<?php defined('SYSPATH') OR die('No direct access allowed');

class Model_Famille extends ORM
{
	protected $_table_name = 'famille';
	protected $_primary_key = 'id';
	protected $_has_many = array(
		'medicaments' => array(
			'model' => 'medicament',
			'foreign_key' => 'famille_id')
		);
}