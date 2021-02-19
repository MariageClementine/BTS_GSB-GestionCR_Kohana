<div name="contenu">
    <h1> Vos Rapports </h1>
    <?php
    if ($rapports != null) {
        ?>

        <form name="selectRap" action="<?= URL::base() ?>index.php/crconsult" method="POST">
            <select name="lstRap" class="titre" >
                <option>Choisir...</option>
                <?php
                foreach ($rapports as $rapport) {
                    ?>
                    <option value="<?= $rapport['id'] ?>">
                        <?= $rapport['nomPrat'] ?> , <?= $rapport['date'] ?>
                    </option>
                    <?php
                }
                ?>
            </select>
            <input type='submit' name='action' value="Rechercher">
        </form>
        <!-- formulaire remplit par la fonction ajax -->
        <form id="formRap">
        </form>
        <?php
        if (isset($rapInfos)) {
            if ($rapInfos['saisiefinie'] == 1) {
                ?>
                <div name="rap" style="float:left;" >
                    <div name="details" style="clear:both; display: inline-block">
                        <h1> Détails du rapport </h1>
                        <label class="titre">Praticien :</label><label class="zone" ><?= $rapInfos['pratNom'] ?> <?= $rapInfos['pratPrenom'] ?></label>
                        <label class="titre">Motif :</label><label class="zone" ><?= $rapInfos['motifgenre'] ?></label>
                        <?php
                        if ($rapInfos['motifautre'] != null) {
                            ?>
                            <label class="titre">Precision :</label><label class="zone" ><?= $rapInfos['motifautre'] ?></label>
                            <?php
                        }
                        ?>
                        <label class="titre">Date visite :</label><label class="zone" ><?= date('d-m-Y', strtotime($rapInfos["datevis"])) ?></label>
                        <label class="titre">Date saisie :</label><label class="zone" ><?= date('d-m-Y', strtotime($rapInfos["datesaisie"])) ?></label>
                        <label class="titre">Durée de la saisie :</label><label class="zone" ><?= $rapInfos['dureesaisie'] ?></label>
                        <label class="titre">Bilan :</label><label class="zone" ><?= $rapInfos['bilan'] ?></label>
                        <label class="titre">Impact :</label><label class="zone" ><?= $rapInfos['impact'] ?></label>
                        <label class="titre">Concurrence :</label><label class="zone" ><?= $rapInfos['concurrence'] ?></label>   
                        <label class="titre">Coef. Confiance :</label><label class="zone" ><?= $rapInfos['coefconfiance'] ?></label>
                    </div>
                    <div name="presente"  style="clear:both;display: inline-block">
                        <?php
                        if (isset($presInfos)) {
                            ?>

                            <h1> Eléments présentés </h1>
                            <?php
                            foreach ($presInfos as $presente) {
                                ?>
                                <label class="titre">Produit :</label><label class="zone" ><?= $presente['medNom'] ?></label>
                                <label class="titre">Documentation offerte :</label><label class="zone" ><?= $presente['docOfferte'] ?></label>
                                <br>

                                <?php
                            }
                        }
                        ?>
                    </div>
                    <div name="offre" style="clear:both;">
                        <?php
                        if (isset($offrInfos)) {
                            ?>

                            <h1> Echantillons Offerts </h1>
                            <?php
                            foreach ($offrInfos as $offre) {
                                ?>
                                <label class="titre">Produit :</label><label class="zone" ><?= $offre['medNom'] ?></label>
                                <label class="titre">Quantité Offerte :</label><label class="zone" ><?= $offre['qte'] ?></label>
                                <br>

                                <?php
                            }
                        }
                        ?>
                    </div>
                </div>
                <?php
            }//endif saisie finie
            else {
                ?>
                <form name="formSaisieRap" action="<?= URL::base() ?>/index.php/crconsult/modif" method="post">
                    <h3 style="text-decoration: underline"> Détails du rapport </h3>
                    <input type="hidden" name="idRap" value="<?=$rapInfos['id']?>"/>
                    <label class="titre">Date visite :<p>(au format jj-mm-aaaa)</p></label><input value="<?= date('d-m-Y', strtotime($rapInfos["datevis"])) ?>" type="text" name="datevis" class="zone" />
                    <label class="titre">Praticien :</label><select  name="praNum" class="zone" >
                        <option value="<?= $rapInfos['pratId'] ?>"><?= $rapInfos['pratNom'] ?> <?= $rapInfos['pratPrenom'] ?></option>
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
                    <label class="titre">Coef. Confiance :</label><input type="text" name="coefconfiance" class="zone" value="<?= $rapInfos['coefconfiance'] ?>"/>
                    <label class="titre">Date Saisie:</label><input type="text" name="datesaisie" disabled="disabled" class="zone" value="<?= date("d-m-Y") ?>"/>
                    <label class="titre">Motif:</label><select  name="motifgenre" class="zone" onChange="selectionne();">
                        <option value="<?= $rapInfos['motifId'] ?>"> <?= $rapInfos['motifgenre'] ?> </option>
                        <?php
                        foreach ($motifs as $motif) {
                            ?>
                            <option value="<?= $motif['id'] ?>"><?= $motif['lib'] ?></option>
                            <?php
                        }
                        ?>

                    </select>
                    <input type="text" name="motifautre" class="zone" disabled="disabled" value="<?= $rapInfos['motifautre'] ?>"/>
                    <label class="titre">Bilan :</label><textarea rows="5" cols="50" name="bilan" class="zone" value><?= $rapInfos['bilan'] ?></textarea>
                    <label class="titre">Impact :</label><textarea rows="5" cols="50" name="impact" class="zone"><?= $rapInfos['impact'] ?></textarea>
                    <label class="titre">Concurrence :</label><textarea rows="5" cols="50" name="concurrence" class="zone"><?= $rapInfos['concurrence'] ?></textarea>
                    <label class="titre" ><h3 style="text-decoration: underline"> Veuillez ressaisir les &eacute;l&eacute;ments pr&eacute;sent&eacute;s </h3></label>
                    <label class="titre" >Produit 1 : </label>
                    <select name="prodpres1" class="zone">
                        <?php
                        if (isset($presInfos[0])) {
                            ?>
                            <option value="<?= $presInfos[0]['medId'] ?>"><?= $presInfos[0]['medNom'] ?></option>
                            <?php
                        }
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

                    <label class="titre"><h3 style="text-decoration: underline">Veuillez ressaisir les &eacute;chantillons offerts</h3></label>
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
                    <label class="titre">Durée de la saisie (en minutes):</label><input value="<?= $rapInfos['dureesaisie'] ?>" name="dureesaisie" type="text" class="zone">
                    <label class="titre">Saisie définitive :</label><input name="saisiefinie" type="checkbox" class="zone"  />
                    <label class="titre"></label><div class="zone"><input type="reset" value="Annuler"></input><input type="submit" name='action' value="Valider"></input></div>
                </form>
                <?php
            }//endif saisie pas finie
        }//endif isset
        ?>
        <?php
    } else {
        ?>
        <label class="zone"> Vous n'avez aucun compte-rendu pour le moment </label>
        <?php
    }
    ?>
</div>