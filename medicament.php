<?php defined('SYSPATH') OR die('No direct access allowed');

class Model_Medicament extends ORM
{
	protected $_table_name = 'medicament';
	protected $_primary_key = 'id';
	protected $_belongs_to = array(
		'famille' => array(
			'model' => 'famille',
			'foreign_key' => 'famille_id')
		); 
	protected $_has_many = array(
		'presentes' => array(
			'model' => 'presente',
			'foreign_key' => 'medicament_id'),
                'offrirs' => array(
                    'model' => 'offrir',
                    'foreign_key' => 'medicament_id'),
                'constitutions' => array(
                        'model' => 'constitution',
                        'foreign_key' => 'medicament_id')
                );
}