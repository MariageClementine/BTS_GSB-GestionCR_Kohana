<?php defined('SYSPATH') OR die('No direct access allowed');

class Model_Secteur extends ORM
{
	protected $_table_name = 'secteur';
	protected $_primary_key = 'id';
	protected $_has_many = array(
		'visiteurs' => array(
			'model' => 'visiteur',
			'foreign_key' => 'secteur_id')
		);
}