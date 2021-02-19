<html>
<head>
	<link href="<?php echo URL::base() ?>style/style.css" rel="stylesheet" type="text/css" />
	<title><?php echo $titre?></title>
	<!--<meta http-equiv="content-type" content="text/html; charset=utf-8"/>-->
	<link href="<?php echo URL::base() ?>style/style.css" rel="stylesheet" type="text/css"> 
        <link rel="shortcut icon" href="<?php echo URL::base() ?>media/styles/GSBfavicon.ico">
        <link rel="icon" type="image/gif" href="<?php echo URL::base() ?>media/styles/GSBfavicon1.gif">
        <script language="javascript" src="<?php echo URL::base() ?>js/functions.js" type="text/javascript"></script>
        <!-- permet de récupérer le bon chemin dans les fct°s js -->
        <script language="javascript">
            var urlBase = <?php echo URL::base() ?>+"index.php/";
            </script>

</head>
<body>
<div name="haut" style="margin: 2 2 2 2 ;height:100; color:white; background-color:77AADD; vertical-align:center;">
	<h1>
		<img style="float:left; border-radius:10px;" src="<?php echo URL::base() ?>media/styles/logo2.jpg" /><p style="float:left;">Gestion des visites</p>
	</h1>
</div>
<div name="gauche" style="border-radius:20px ;float:left;width:18%; background-color:white; height:100%;">
	<h2>Outils</h2>
	<ul><li>Comptes-Rendus</li>
		<ul>
			<li><a href="<?=URL::base()?>index.php/crcreation" >Nouveaux</a></li>
			<li><a href="<?=URL::base()?>index.php/crconsult">Consulter</a></li>
		</ul>
		<li>Consulter</li>
		<ul><li><a href="<?=URL::base()?>index.php/medicament" >Médicaments</a></li>
			<li><a href="<?=URL::base()?>index.php/praticien" >Praticiens</a></li>
			<li><a href="<?=URL::base()?>index.php/visiteur" >Autres visiteurs</a></li>
		</ul>
		<li><a href="<?=URL::base()?>index.php/session/deconnexion">D&eacute;connexion</a></li>
	</ul>
</div>
<div name="droite" style="float:left;width:80%;">
	<div name="bas" style="margin : 10 2 2 2;clear:left;background-color:77AADD;color:white;height:88%;">
                        <hr />
                        <?php
                        echo $content;
                            ?>
                                                                
	</div>
    
</div>
<!--     $contenu = Request::factory('session/footer/'.$control)->execute();
    echo $contenu-->
</body>
</html>