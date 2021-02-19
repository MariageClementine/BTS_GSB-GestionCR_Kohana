<?php defined('SYSPATH') OR die('No direct access allowed');

class Model_Presente extends ORM
{
	protected $_table_name = 'presente';
	protected $_primary_key = 'id';
	protected $_belongs_to = array(
		'medicament' => array(
			'model' => 'medicament',
			'foreign_key' => 'medicament_id'),
                'rapportvisite' => array(
			'model' => 'rapportvisite',
			'foreign_key' => 'rapport_id')
		); 
}