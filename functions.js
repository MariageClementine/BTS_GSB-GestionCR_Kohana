function chercherMed($mNumero) {
    var xhr_object = null;
    if (window.XMLHttpRequest) // Firefox 
        xhr_object = new XMLHttpRequest();
    else if (window.ActiveXObject) // Internet Explorer 
        xhr_object = new ActiveXObject("Microsoft.XMLHTTP");
    else { // XMLHttpRequest non supporté par le navigateur 
        alert("Votre navigateur ne supporte pas les objets XMLHTTPRequest...");
        return;
    }
    //traitement à la réception des données
    xhr_object.onreadystatechange = function() {
        if (xhr_object.readyState == 4 && xhr_object.status == 200) {
            var formulaire = document.getElementById("formMed");
            formulaire.innerHTML = xhr_object.responseText;
        }
    }
    //communication vers le serveur
    xhr_object.open("POST", urlBase + "medicament/cherche", true);
    xhr_object.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var data = "lstMed=" + $mNumero;
    xhr_object.send(data);

}

function chercherPrat($pNumero) {
    var xhr_object = null;
    if (window.XMLHttpRequest) // Firefox 
        xhr_object = new XMLHttpRequest();
    else if (window.ActiveXObject) // Internet Explorer 
        xhr_object = new ActiveXObject("Microsoft.XMLHTTP");
    else { // XMLHttpRequest non supporté par le navigateur 
        alert("Votre navigateur ne supporte pas les objets XMLHTTPRequest...");
        return;
    }
    //traitement à la réception des données
    xhr_object.onreadystatechange = function() {
        if (xhr_object.readyState == 4 && xhr_object.status == 200) {
            var formulaire = document.getElementById("formPrat");
            formulaire.innerHTML = xhr_object.responseText;
        }
    }
    //communication vers le serveur
    xhr_object.open("POST", urlBase + "praticien/cherche", true);
    xhr_object.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var data = "lstPrat=" + $pNumero;
    xhr_object.send(data);

}

function chercherVis($vNumero) {
    var xhr_object = null;
    if (window.XMLHttpRequest) // Firefox 
        xhr_object = new XMLHttpRequest();
    else if (window.ActiveXObject) // Internet Explorer 
        xhr_object = new ActiveXObject("Microsoft.XMLHTTP");
    else { // XMLHttpRequest non supporté par le navigateur 
        alert("Votre navigateur ne supporte pas les objets XMLHTTPRequest...");
        return;
    }
    //traitement à la réception des données
    xhr_object.onreadystatechange = function() {
        if (xhr_object.readyState == 4 && xhr_object.status == 200) {
            var formulaire = document.getElementById("formVis");
            formulaire.innerHTML = xhr_object.responseText;
        }
    }
    //communication vers le serveur
    xhr_object.open("POST", urlBase + "visiteur/cherche", true);
    xhr_object.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var data = "lstVis=" + $vNumero;
    xhr_object.send(data);

}

function chercherRap($rNumero) {
    var xhr_object = null;
    if (window.XMLHttpRequest) // Firefox 
        xhr_object = new XMLHttpRequest();
    else if (window.ActiveXObject) // Internet Explorer 
        xhr_object = new ActiveXObject("Microsoft.XMLHTTP");
    else { // XMLHttpRequest non supporté par le navigateur 
        alert("Votre navigateur ne supporte pas les objets XMLHTTPRequest...");
        return;
    }
    //traitement à la réception des données
    xhr_object.onreadystatechange = function() {
        if (xhr_object.readyState == 4 && xhr_object.status == 200) {
            var formulaire = document.getElementById("formRap");
            formulaire.innerHTML = xhr_object.responseText;
        }
    }
    //communication vers le serveur
    xhr_object.open("POST", urlBase + "crconsult/cherche", true);
    xhr_object.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var data = "lstRap=" + $rNumero;
    xhr_object.send(data);

}

function ajoutLigne(pNumero) {//ajoute une ligne de produits/qté à la div "lignes"     
    //masque le bouton en cours
    document.getElementById("but" + pNumero).setAttribute("hidden", "true");
    pNumero++;										//incrémente le numéro de ligne
    var laDiv = document.getElementById("lignes");	//récupère l'objet DOM qui contient les données
    var titre = document.createElement("label");	//crée un label
    laDiv.appendChild(titre);						//l'ajoute à la DIV
    titre.setAttribute("class", "titre");			//définit les propriétés
    titre.innerHTML = "   Produit : ";
    var liste = document.createElement("select");	//ajoute une liste pour proposer les produits
    laDiv.appendChild(liste);
    liste.setAttribute("name", "offr" + pNumero);
    liste.setAttribute("class", "zone");
    //remplit la liste avec les valeurs de la première liste construite en PHP à partir de la base
    liste.innerHTML = formSaisieRap.elements["offr1"].innerHTML;
    var qte = document.createElement("input");
    laDiv.appendChild(qte);
    qte.setAttribute("name", "qte" + pNumero);
    qte.setAttribute("size", "2");
    qte.setAttribute("class", "zone");
    qte.setAttribute("type", "text");
    var bouton = document.createElement("input");
    laDiv.appendChild(bouton);
    //ajoute une gestion évenementielle en faisant évoluer le numéro de la ligne
    bouton.setAttribute("onClick", "ajoutLigne(" + pNumero + ");");
    bouton.setAttribute("type", "button");
    bouton.setAttribute("value", "+");
    bouton.setAttribute("class", "zone");
    bouton.setAttribute("id", "but" + pNumero);
}

function selectionne() {
    //active l'objet pObjet du formulaire si la valeur sélectionnée (pSelection) est égale à la valeur attendue (4)
    if (document.getElementsByName("motifgenre")[0].value == "5")
    {
        document.getElementsByName("motifautre")[0].disabled = false;
    }
    else
    {
        document.getElementsByName("motifautre")[0].disabled = true;
    }
}
//function praPrecedent($pNum) 
//{
//    var xhr_object = null;
//    if (window.XMLHttpRequest) // Firefox 
//        xhr_object = new XMLHttpRequest();
//    else if (window.ActiveXObject) // Internet Explorer 
//        xhr_object = new ActiveXObject("Microsoft.XMLHTTP");
//    else { // XMLHttpRequest non supporté par le navigateur 
//        alert("Votre navigateur ne supporte pas les objets XMLHTTPRequest...");
//        return;
//    }
//    //traitement à la réception des données
//    xhr_object.onreadystatechange = function() {
//        if (xhr_object.readyState == 4 && xhr_object.status == 200) {
//            var formulaire = document.getElementById("selects");
//            formulaire.innerHTML = xhr_object.responseText;
//        }
//    }
//    //communication vers le serveur
//    xhr_object.open("POST", urlBase + "praticien/cherchePrec", true);
//    xhr_object.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
//    var data = "precedent=" + $pNumero;
//    xhr_object.send(data);
//}

