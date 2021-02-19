<h1> Veuillez vous connecter pour pouvoir accéder aux options </h1>
<form action="<?=URL::base()?>index.php/session/connexion" method="post">
    <label class="titre">Login :</label><input class="zone" type="text" name="log"/>
    <label class="titre">Mot de passe :</label><input class="zone" type="password" name="mdp"/>
    <div class="zone">
        <input type="submit" name="action" value="Connexion"/>
    </div>
</form>