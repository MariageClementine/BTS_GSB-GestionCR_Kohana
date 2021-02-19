<?php

session_start();

defined('SYSPATH') OR die('No direct access allowed');

class Controller_Crconsult extends Controller_Template {

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
        $this->template->titre = "GSB || Consulter vos comptes-rendus";
        $this->template->control = 'crconsult';
    }

    public function action_index() {
        $rapports = ORM::factory('rapportvisite')->where('visiteur_id', '=', $_SESSION['matricule'])->find_all();
        if ($rapports->count()) {
            foreach ($rapports as $rapport) {
                $rapTab[] = array('id' => $rapport->id,
                    'nomPrat' => $rapport->praticien->nom,
                    'date' => $rapport->dateVisite
                );
            }
        } else {
            $rapTab = null;
        }
        $this->tpl = View::factory('compterendu/consult/index');
        $this->tpl->rapports = $rapTab;

        $idRap = $this->request->post('lstRap');
        if (isset($idRap)) {
            $rapport = ORM::factory('rapportvisite')
                    ->where('id', '=', $idRap)
                    ->find();
            if ($rapport->saisieFinie == 0) {
                preg_match("#00:([0-9]{2}):00#", $rapport->dureeSaisie, $matches);
                $duree = $matches[1];
            } else
                $duree = $rapport->dureeSaisie;
            $rapInfos = array(
                'id' => $rapport->id,
                'pratId' => $rapport->praticien_id,
                'pratNom' => $rapport->praticien->nom,
                'pratPrenom' => $rapport->praticien->prenom,
                'motifId' => $rapport->motif_id,
                'motifgenre' => $rapport->motifvisite->libelle,
                'motifautre' => $rapport->motifAutre,
                'datevis' => $rapport->dateVisite,
                'datesaisie' => $rapport->dateSaisie,
                'dureesaisie' => $duree,
                'bilan' => $rapport->bilan,
                'impact' => $rapport->impact,
                'concurrence' => $rapport->concurrence,
                'coefconfiance' => $rapport->coefConfiance,
                'saisiefinie' => $rapport->saisieFinie
            );
            $this->tpl->rapInfos = $rapInfos;

            $presentations = ORM::factory('presente')
                    ->where('rapport_id', ' = ', $idRap)
                    ->find_all();

            if ($presentations->count()) {
                foreach ($presentations as $presenter) {
                    $docOff = ($presenter->docOfferte == 1) ? 'oui' : 'non';
                    $presInfos[] = array(
                        'id' => $presenter->id,
                        'medId' => $presenter->medicament_id,
                        'medNom' => $presenter->medicament->nomCommercial,
                        'docOfferte' => $docOff
                    );
                }
                $this->tpl->presInfos = $presInfos;
            }
            $offres = ORM::factory('offrir')
                    ->where('rapport_id', ' = ', $idRap)
                    ->find_all();
            if ($offres->count()) {
                foreach ($offres as $offrir) {
                    $offrInfos[] = array(
                        'id' => $offrir->id,
                        'medId' => $offrir->medicament_id,
                        'medNom' => $offrir->medicament->nomCommercial,
                        'qte' => $offrir->offQte
                    );
                }
                $this->tpl->offrInfos = $offrInfos;
            }
            if ($rapport->saisieFinie == 0) {
                $medicaments = ORM::factory('medicament')->find_all();
                foreach ($medicaments as $medicament) {
                    $medInfos[] = array(
                        'id' => $medicament->id,
                        'nomComm' => $medicament->nomCommercial
                    );
                }
                $this->tpl->medicaments = $medInfos;

                $praticiens = ORM::factory('praticien')->find_all();
                foreach ($praticiens as $praticien) {
                    $pratInfos[] = array(
                        'id' => $praticien->id,
                        'nom' => $praticien->nom,
                        'prenom' => $praticien->prenom
                    );
                }
                $this->tpl->praticiens = $pratInfos;

                $motifs = ORM::factory('motifvisite')->find_all();
                foreach ($motifs as $motif) {
                    $motifInfos[] = array(
                        'id' => $motif->id,
                        'lib' => $motif->libelle
                    );
                }
                $this->tpl->motifs = $motifInfos;
            }
        }//endif isset post
    }

    public function action_modif() {
        //recup des données
        //on instancie le (les) modele(s)
        var_dump($_POST);
        $rapport = ORM::factory('rapportvisite')->where('id', '=', $_POST['idRap'])->find();
        //on lui attribue les données
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
            $this->tpl = View::factory('compterendu/consult/erreur');
            $this->tpl->niveau = "'Détails' ou 'Divers'";
        } else {
            //on passe a la suite
            //on instancie les presentations
            $presenteADel = ORM::factory('presente')->where('rapport_id', '=', $_POST['idRap'])->find_all();
            foreach ($presenteADel as $pres) {
                $pres->delete();
            }
            $presente = ORM::factory('presente');
            $presente->medicament_id = $this->request->post('prodpres1');
            $presente->docOfferte = (isset($_POST['docofferte1']) && $_POST['docofferte1'] == "on") ? 1 : 0;

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
                //on suppr les donnees existantes

                $offresADel = ORM::factory('offrir')->where('rapport_id', '=', $_POST['idRap'])->find_all();
                foreach ($offresADel as $offreADel) {
                    $offreADel->delete();
                }
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
                        $this->tpl = View::factory('compterendu/consult/erreur');
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
                    for ($i = 1; $i < count($offres) + 1; $i++) {
                        $offres[$i]->rapport_id = $rapport->id;
                        $offres[$i]->save();
                    }
                    $this->tpl = View::factory('compterendu/consult/succes');
                }
            }//endif presence de produits offerts
            else {
                //tout est verifié, on peut enregistrer
                $rapport->save();
                $presente->rapport_id = $rapport->id;
                $presente->save();
                if (isset($presente2)) {
                    $presente2->rapport_id = $rapport->id;
                    $presente2->save();
                }
                $this->tpl = View::factory('compterendu/consult/succes');
            }
        }//endif rapport saved
    }

    //contrairement a tous les autres controller, cette fonction ne marche pas
//    public function action_cherche() {
//        $rapport = ORM::factory('rapportvisite')
//                ->where('id', '=', $_POST['lstRap'])
//                ->find();
//        $rapInfos = array(
//            'id' => $rapport->id,
//            'pratId' => $rapport->praticien_id,
//            'pratNom' => $rapport->praticien->nom,
//            'pratPrenom' => $rapport->praticien->prenom,
//            'motifId' => $rapport->motif_id,
//            'motifgenre' => $rapport->motifvisite->libelle,
//            'motifautre' => $rapport->motifAutre,
//            'datevis' => $rapport->dateVisite,
//            'datesaisie' => $rapport->dateSaisie,
//            'dureesaisie' => $rapport->dureeSaisie,
//            'bilan' => $rapport->bilan,
//            'impact' => $rapport->impact,
//            'concurrence' => $rapport->concurrence,
//            'coefconfiance' => $rapport->coefConfiance,
//            'saisiefinie' => $rapport->saisieFinie
//        );
//
//        $presentations = ORM::factory('presente')
//                ->where('rapport_id', '=', $_POST['lstRap'])
//                ->find_all();
//
//        if ($presentations->count()) {
//            foreach ($presentations as $presenter) {
//                $docOff = ($presenter->docOfferte == 1) ? 'oui' : 'non';
//                $presInfos[] = array(
//                    'id' => $presenter->id,
//                    'medId' => $presenter->medicament_id,
//                    'medNom' => $presenter->medicament->nomCommercial,
//                    'docOfferte' => $docOff
//                );
//            }
//        }
//        $offres = ORM::factory('offrir')
//                ->where('rapport_id', '=', $_POST['lstRap'])
//                ->find_all();
//        if ($offres->count()) {
//            foreach ($offres as $offrir) {
//                $offrInfos[] = array(
//                    'id' => $offrir->id,
//                    'medId' => $offrir->medicament_id,
//                    'medNom' => $offrir->medicament->nomCommercial,
//                    'qte' => $offrir->offQte
//                );
//            }
//        }
//        if ($rapport->saisieFinie == 1) {
//            $this->template = View::factory('crconsult/cherche');
//        } else {
//            $this->template = View::factory('compterendu/consult/modif');
//        }
//        $this->template->rapInfos = $rapInfos;
//        $this->template->presInfos = $presInfos;
//        $this->template->offrInfos = $offrInfos;
//    }
}
