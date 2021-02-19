<div name="contenu">
    <h1> Autres Visiteurs </h1>
    <form name="selectDep" action="<?=URL::base()?>index.php/visiteur" method="POST">
    <select name="lstDep" class="titre">
			<option>Choisir...</option>
                        <?php
                        foreach($deps as $dep)
                        {
                            ?>
                        <option value="<?=$dep['id']?>">
                            <?=$dep['nom']?>
                        </option>
                            <?php
                        }
                        ?>
    </select>
        <input type='submit' name='action' value="Rechercher">
    </form>

        <!-- si utilisation du bouton avec post qui redirige vers index -->
    <?php if(isset($visiteurs))
    {
        ?>
     <select name="lstVis" class="titre" onChange="chercherVis(this.value);">
			<option>Choisir...</option>
                        <?php
                        foreach($visiteurs as $vis)
                        {
                            ?>
                        <option value="<?=$vis['id']?>">
                            <?=$vis['nom']?> <?=$vis['prenom']?>
                        </option>
                            <?php
                        }
                        ?>
    </select>
    <?php
    }
    ?>
     <!-- formulaire remplit par la fonction ajax -->
    <form id="formVis">
    </form>
</div>
