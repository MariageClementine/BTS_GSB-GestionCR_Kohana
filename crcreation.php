<?php

session_start();

defined('SYSPATH') OR die('No direct access allowed');

class Controller_Crcreation extends Controller_Template {

    public $template = 'layout/temp';

    public function before() {
        parent::before();
        if (!isset($_SESSION['matricule'])) {
            $this->request->redirect("session");
        }
        $this->template->content = null;
        if ($this->request->is_initial())
            $this->tpl = & $this->template->content;
        else
            $this->tpl = & $this->template;
        $this->template->titre = "GSB || Créer un compte-rendu";
        $this->template->control = 'crcreation';
    }

    public function action_index() {
        $praticiens = ORM::factory('praticien')
                ->order_by('nom')
                ->find_all();
        foreach ($praticiens as $praticien) {
            $lstPra[] = array(
                'id' => $praticien->id,
                'nom' => $praticien->nom,
                'prenom' => $praticien->prenom
            );
        }
        $motifs = ORM::factory('motifvisite')->find_all();
        foreach ($motifs as $motif) {
            $lstMotif[] = array(
                'id' => $motif->id,
                'lib' => $motif->libelle
            );
        }
        $medicaments = ORM::factory('medicament')
                ->order_by('nomCommercial')
                ->find_all();
        foreach ($medicaments as $medicament) {
            $lstMed[] = array(
                'id' => $medicament->id,
                'nomComm' => $medicament->nomCommercial
            );
        }
        $this->tpl = View::factory('compterendu/creation/index');
        $this->tpl->praticiens = $lstPra;
        $this->tpl->motifs = $lstMotif;
        $this->tpl->medicaments = $lstMed;
    }

    public function action_ajout() {
        //recup des données
        //on instancie le (les) modele(s)
        $rapport = ORM::factory('rapportvisite');
        //on lui attribue les données
        $rapport->visiteur_id = $_SESSION['matricule'];
        $rapport->praticien_id = $this->request->post('praNum');
        $rapport->dateSaisie = date('Y-m-d');
        $rapport->motif_id = $this->request->post('motifgenre');
        $rapport->bilan = $this->request->post('bilan');
        $rapport->impact = $this->request->post('impact');
        $rapport->concurrence = $this->request->post('concurrence');
        if ($rapport->motif_id == 5 && isset($_POST['motifautre']))
            $rapport->motifAutre = $this->request->post('motifautre');
        else
            $rapport->motifAutre = null;
        if (isset($_POST['saisiefinie']) && $_POST['saisiefinie'] == 'on')
            $rapport->saisieFinie = 1;
        else
            $rapport->saisieFinie = 0;
        //on vérifie l'integrité des champs
        $checkRap = $rapport->checkDonnees($_POST['datevis'], $_POST['coefconfiance'], $_POST['dureesaisie']);

        //si un champ n'est pas intègre
        if (!$checkRap) {
            $this->tpl = View::factory('compterendu/creation/erreur');
            $this->tpl->niveau = "'Details' ou 'Divers'";
        } else {
            //on passe a la suite
            //on instancie les presentations
            $presente = ORM::factory('presente');
            $presente->medicament_id = $this->request->post('prodpres1');
            $presente->docOfferte = (isset($_POST['docofferte1']) && $_POST['docofferte'] == "on") ? 1 : 0;

            //si il y a deuxieme produit presenté
            if ($_POST['prodpres2'] != '0') {
                $presente2 = ORM::factory('presente');
                $presente2->medicament_id = $this->request->post('prodpres2');
                $presente2->docOfferte = (isset($_POST['docofferte2']) && $_POST['docofferte2'] == "on") ? 1 : 0;
            }



            //s'il y a eu au moins 1 echantillon offert
            if ($_POST['offr1'] != '0') {
                $num = 1; //variable qui s'incremente a chaque tour de boucle
                $ok = true; //pour vérifier que TOUTES les offres sont ok
                $offres = array(); //pour stocker les offres le temps de vérifier les suivantes

                //tant qu'on rencontre une ligne
                while (isset($_POST['offr' . $num]) && $ok) {
                    
                    $offre = ORM::factory('offrir');
                    //on attribue les valeurs
                    $offre->visiteur_id = $_SESSION['matricule'];
                    $offre->medicament_id = $this->request->post('offr' . $num);
                    //on vérifie que les champs soient corrects
                    $checkOffre = $offre->checkQte($_POST['qte' . $num]);
                    //si erreur
                    if (!$checkOffre || $_POST['offr' . $num] == '0') {
                        $this->tpl = View::factory('compterendu/creation/erreur');
                        $this->tpl->niveau = "'Echantillons Offerts'";
                        $ok = false;
                    }//endif soucis offre
                    else
                    //on rentre les offres dans le tableau
                        $offres[$num] = $offre;
                    $num++;
                }//end while
                //si ok est tjs a true a la fin, tout est passé
                if ($ok) {
                    //tout est verifié, on peut enregistrer
                    $rapport->save();
                    $presente->rapport_id = $rapport->id;
                    $presente->save();
                    if (isset($presente2)) {
                        $presente2->rapport_id = $rapport->id;
                        $presente2->save();
                    }
                    //on sauve chacune des offres
                    for ($i = 1; $i < count($offres)+1; $i++) {
                        $offres[$i]->rapport_id = $rapport->id;
                        $offres[$i]->save();
                    }
                    $this->tpl = View::factory('compterendu/creation/succes');
                }
            }//endif presence de produits offerts
            else {
                //tout est verifié, on peut enregistrer
                $rapport->save();
                $presente->rapport_id = $rapport->id;
                $presente->save();
                if (isset($presente2))
                {
                    $presente2->rapport_id = $rapport->id;
                    $presente2->save();
                } 
                $this->tpl = View::factory('compterendu/creation/succes');
            }
        }//endif rapport saved
    }

//end function
}
