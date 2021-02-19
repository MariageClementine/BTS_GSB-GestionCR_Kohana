<?php defined('SYSPATH') OR die('No direct access allowed');

class Model_Visiteur extends ORM
{
	protected $_table_name = 'visiteur';
	protected $_primary_key = 'id';
	protected $_belongs_to = array(
		'labo' => array(
			'model' => 'labo',
			'foreign_key' => 'labo_id'),
                'secteur' => array(
			'model' => 'secteur',
			'foreign_key' => 'secteur_id'),
                'departement' => array(
			'model' => 'departement',
			'foreign_key' => 'dep_id')
		); 
	protected $_has_many = array(
		'rapportvisites' => array(
			'model' => 'rapportvisite',
			'foreign_key' => 'visiteur_id')
		);
}