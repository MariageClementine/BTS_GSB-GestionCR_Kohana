<?php

defined('SYSPATH') OR die('No direct access allowed');

class Model_Rapportvisite extends ORM {

    protected $_table_name = 'rapportvisite';
    protected $_primary_key = 'id';
    protected $_belongs_to = array(
        'motifvisite' => array(
            'model' => 'motifvisite',
            'foreign_key' => 'motif_id'),
        'visiteur' => array(
            'model' => 'visiteur',
            'foreign_key' => 'visiteur_id'),
        'praticien' => array(
            'model' => 'praticien',
            'foreign_key' => 'praticien_id')
    );
    protected $_has_many = array(
        'offrirs' => array(
            'model' => 'offrir',
            'foreign_key' => 'rapport_id'),
        'presentes' => array(
            'model' => 'presente',
            'foreign_key' => 'rapport_id')
    );

    public function checkDonnees($date, $coef, $duree) {
        $returnDate = $this->checkDate($date);
        $returnCoef = $this->checkCoef($coef);
        $returnDuree = $this->checkDuree($duree);
        if ($returnCoef && $returnDate && $returnDuree)
            return true;
        else
            return false;
    }

    public function checkDate($date) {
        if (preg_match("#^ ?(0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[012])-(19|20)[0-9]{2} ?$#", $date)) {
            $this->dateVisite = date('Y-m-d', strtotime($date));
            return true;
        } else
            return false;
    }

    public function checkCoef($coef) {
        if (preg_match("#^ ?[0-9.]* ?$#", $coef)) {
            $this->coefConfiance = $coef;
            return true;
        } elseif ($coef = null) {
            $this->coefConfiance = $coef;
            return true;
        } else
            return false;
    }

    public function checkDuree($duree) {
        if (preg_match("#^ ?[0-9]{1} ?$#", $duree)) {
            $this->dureeSaisie = "00:0" . $duree . ":00";
            return true;
        } elseif (preg_match("#^ ?[0-9]{2} ?$#", $duree)) {
            $this->dureeSaisie = "00:" . $duree . ":00";
            return true;
        } else
            return false;
    }

}
