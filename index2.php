<h1> Création d'un rapport </h1>
<form name="formSaisieRap" action="<?= URL::base() ?>/index.php/crcreation/ajout" method="post">
    <h3 style="text-decoration: underline"> Détails du rapport </h3>
    <label class="titre">Date visite :<p>(au format jj-mm-aaaa)</p></label><input type="text" name="datevis" class="zone" />
    <label class="titre">Praticien :</label><select  name="praNum" class="zone" >
        <option> Choisir... </option>
        <?php
        foreach ($praticiens as $praticien) {
            ?>
            <option value="<?= $praticien["id"] ?>">
                <?= $praticien['nom'] ?> <?= $praticien['prenom'] ?>
            </option>
            <?php
        }
        ?>
    </select>
    <label class="titre">Coef. Confiance :</label><input type="text" name="coefconfiance" class="zone" />
    <label class="titre">Date Saisie:</label><input type="text" name="datesaisie" disabled="disabled" class="zone" value="<?= date("d-m-Y") ?>"/>
    <label class="titre">Motif:</label><select  name="motifgenre" class="zone" onChange="selectionne();">
        <?php
        foreach ($motifs as $motif) {
            ?>
            <option value="<?= $motif['id'] ?>"><?= $motif['lib'] ?></option>
            <?php
        }
        ?>

    </select>
    <input type="text" name="motifautre" class="zone" disabled="disabled" />
    <label class="titre">Bilan :</label><textarea rows="5" cols="50" name="bilan" class="zone" ></textarea>
    <label class="titre">Impact :</label><textarea rows="5" cols="50" name="impact" class="zone" ></textarea>
    <label class="titre">Concurrence :</label><textarea rows="5" cols="50" name="concurrence" class="zone" ></textarea>
    <label class="titre" ><h3 style="text-decoration: underline"> El&eacute;ments pr&eacute;sent&eacute;s </h3></label>
    <label class="titre" >Produit 1 : </label>
    <select name="prodpres1" class="zone">
        <?php
        foreach ($medicaments as $medicament) {
            ?>
            <option value="<?= $medicament['id'] ?>"><?= $medicament['nomComm'] ?></option>
            <?php
        }
        ?>	
    </select>
    <label class="titre">Documentation offerte :</label><input name="docofferte1" type="checkbox" class="zone" />
    <label class="titre" >Produit 2 : </label>
    <select name="prodpres2" class="zone">
        <option value="0">...</option>
        <?php
        foreach ($medicaments as $medicament) {
            ?>
            <option value="<?= $medicament['id'] ?>"><?= $medicament['nomComm'] ?></option>
            <?php
        }
        ?>
    </select>
    <label class="titre">Documentation offerte :</label><input name="docofferte2" type="checkbox" class="zone"  />
    <label class="titre"><h3 style="text-decoration: underline">Echantillons</h3></label>
    <div class="titre" id="lignes">
        <label class="titre" >Produit : </label>
        <select name="offr1" class="zone">
            <option value="0">Produits</option>
            <?php
            foreach ($medicaments as $medicament) {
                ?>
                <option value="<?= $medicament['id'] ?>"><?= $medicament['nomComm'] ?></option>
                <?php
            }
            ?>
        </select><input type="text" name="qte1" size="2" class="zone"/>
        <input type="button" id="but1" value="+" onclick="ajoutLigne(1);" class="zone" />
    </div>		
    <label class="titre"><h3 style="text-decoration: underline">Divers</h3></label>
    <label class="titre">Durée de la saisie (en minutes):</label><input name="dureesaisie" type="text" class="zone">
    <label class="titre">Saisie définitive :</label><input name="saisiefinie" type="checkbox" class="zone"  />
    <label class="titre"></label><div class="zone"><input type="reset" value="Annuler"></input><input type="submit" name='action' value="Valider"></input>
</form>
