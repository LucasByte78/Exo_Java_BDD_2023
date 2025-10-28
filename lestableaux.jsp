<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les tableaux</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les tableaux</h1>
<form action="#" method="post">
    <p>Saisir au minimum 3 chiffres à la suite <input type="text" id="inputValeur" name="chaine">
    <p><input type="submit" value="Afficher">
</form>
<%-- Récupération des valeurs --%>
    <% String chaine = request.getParameter("chaine"); %>
    
    <% if (chaine != null) { %>

    <%-- Division de la chaîne de chiffres séparés par des espaces --%>
    <% String[] tableauDeChiffres = chaine.split("\\s+"); %>
    <p>La tableau contient <%= tableauDeChiffres.length %> valeurs</p>
    <% for(int i = 0 ; i < tableauDeChiffres.lenght ; i++) { %>
    

    Chiffre 1 : <%= Integer.parseInt(tableauDeChiffres[0]) %>    
<h2>Exercice 1 : La carré de la première valeur</h2>
<% 
    int valeur1 = Integer.parseInt(tableauDeChiffres[0]);
    int valeur2 = Integer.parseInt(tableauDeChiffres[1]);
    int valeur3 = Integer.parseInt(tableauDeChiffres[2]);
    int carrepremierevaleur = valeur1 * valeur1;
%>
<%="Le carré de la première valeur est : " + carrepremierevaleur %>

<h2>Exercice 2 : La somme des 2 premières valeurs</h2>
<% int somme = valeur1 + valeur2; %>
<%="La somme des valeurs 1 et 2 est : " + somme %>

<h2>Exercice 3 : La somme de toutes les valeurs</h2>
<p>L'utilisateur peut à présent saisir autant de valeurs qu'il le souhaite dans champs de saisie.</br>
Ecrire un programme afin de faire la somme de toutes les valeurs saisie par l'utilisateur</p>
<% 
    int longueurchaine = tableauDeChiffres.lenght();
    int sommegenerale = 0;
%>
<% 
    for(int i = 0 ; i < longueurchaine ; i++)
    {
        sommegenerale += tableauDeChiffres[i];
    }
%>
<h2>Exercice 4 : La valeur maximum</h2>
<p>Ecrire un programme pour afficher la valeur maximale saisie par l'utilisateur</p>

<h2>Exercice 5 : La valeur minimale</h2>
<p>Ecrire un programme pour afficher la valeur minimale saisie par l'utilisateur</p>

<h2>Exercice 6 : La valeur le plus proche de 0</h2>
<p>Trouvez la valeur la plus proche de 0 (chiffres positifs ou négatifs)</p>

<h2>Exercice 7 : La valeur le plus proche de 0 (2° version)</h2>
<p>Trouvez la valeur la plus proche de 0 (chiffres positifs ou négatifs)</p>
<p>En cas d'égalité entre un chiffre positif et négatif, affichez le chiffre positif</p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
