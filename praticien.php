<?php defined('SYSPATH') OR die('No direct access allowed');

class Model_Praticien extends ORM
{
	protected $_table_name = 'praticien';
	protected $_primary_key = 'id';
	protected $_belongs_to = array(
		'typepraticien' => array(
			'model' => 'typepraticien',
			'foreign_key' => 'typepraticien_id')
		); 
	protected $_has_many = array(
		'travailles' => array(
			'model' => 'travaille',
			'foreign_key' => 'praticien_id'),
                'rapportvisites' => array(
			'model' => 'rapportvisite',
			'foreign_key' => 'praticien_id')
		);
}