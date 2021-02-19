<?php session_start();

defined('SYSPATH') OR die('No direct access allowed');

class Controller_Session extends Controller_Template {

    public $template = 'layout/temp';

    public function before() {
        parent::before();
        $this->template->content = null;
        if ($this->request->is_initial())
            $this->tpl = & $this->template->content;
        else
            $this->tpl = & $this->template;
        $this->template->titre = "GSB || Connexion";
        $this->template->control = 'connexion';
    }

    public function action_index() {
        $this->tpl = View::factory('session/index');
    }

    public function action_connexion() {
        $log = $this->request->post('log');
        $mdp = $this->request->post('mdp');
        
        if ($log == "swiss" && $mdp == "18-jun-2003") {
            $this->tpl = View::factory('session/test');
        }
        else
        {
            $dateEmb = date('Y-m-d',strtotime($mdp));
            $session = ORM::factory('visiteur')->where('nom', '=', $log)->and_where('dateEmbauche', '=', $dateEmb)->find();
            if($session->loaded())
            {
                $_SESSION['matricule'] = $session->id;
                $this->tpl = View::factory('session/menu');
            }
            else
            {
                $this->tpl = View::factory('session/erreur');
            }
        }
    }

    public function action_deconnexion() {

        //qui deconnecte
        $_SESSION[] = array();
        session_destroy();
        $this->action_index();
    }

//    public function action_footer(){
//        //var_dump($this->request->param('controller'));
//       $this->auto_render = false;
//       echo '<pre>';
//       //var_dump($this->request->current());
//       var_dump($this->request->param('id'));
//        
//    }
}
