<?php defined('SYSPATH') OR die('No direct access allowed');

class Model_Constitution extends ORM
{
	protected $_table_name = 'constitution';
	protected $_primary_key = 'id';
	protected $_belongs_to = array(
		'medicament' => array(
			'model' => 'medicament',
			'foreign_key' => 'medicament_id'),
                'composant' => array(
                            'model' => 'composant',
                            'foreign_key' => 'composant_id')
		); 
}
