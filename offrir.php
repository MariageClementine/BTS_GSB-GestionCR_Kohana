<?php

defined('SYSPATH') OR die('No direct access allowed');

class Model_Offrir extends ORM {

    protected $_table_name = 'offrir';
    protected $_primary_key = 'id';
    protected $_belongs_to = array(
        'medicament' => array(
            'model' => 'medicament',
            'foreign_key' => 'medicament_id'),
        'rapportvisite' => array(
            'model' => 'rapportvisite',
            'foreign_key' => 'rapport_id')
    );

    public function checkQte($qte) {
       if(preg_match("#^ ?[0-9]{1,2} ?$#", $qte)){
           $this->offQte = $qte; 
           return true ;
       }
       else return false;
    }

}
