<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>les conditions</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les conditions</h1>
<form action="#" method="post">
    <p>Saisir la valeur 1 : <input type="text" id="inputValeur" name="valeur1">
    <p>Saisir la valeur 2 : <input type="text" id="inputValeur" name="valeur2">
    <p>Saisir la valeur 3 : <input type="text" id="inputValeur" name="valeur3">
    <p><input type="submit" value="Afficher">
</form>
<%-- Récupération des valeurs --%>
    <% String valeur1 = request.getParameter("valeur1"); %>
    <% String valeur2 = request.getParameter("valeur2"); %>
    <% String valeur3 = request.getParameter("valeur3"); %>

    <%-- Vérification de la condition entre les deux valeurs --%>
    <% if (valeur1 != null && valeur2 != null) { %>
        <%-- Conversion des valeurs en entiers pour la comparaison --%>
        <% int intValeur1 = Integer.parseInt(valeur1); %>
        <% int intValeur2 = Integer.parseInt(valeur2); %>
        
        <%-- Condition if pour comparer les valeurs --%>
        <% if (intValeur1 > intValeur2) { %>
            <p>Valeur 1 est supérieure à Valeur 2.</p>
        <% } else if (intValeur1 < intValeur2) { %>
            <p>Valeur 1 est inférieure à Valeur 2.</p>
        <% } else { %>
            <p>Valeur 1 est égale à Valeur 2.</p>
        <% } %>
   
    
<h2>Exercice 1 : Comparaison 1</h2>
<p>Ecrire un programme qui demande à l'utilisateur de saisir 3 valeurs (des chiffres),</br>
A, B et C et dites nous si la valeur de C est comprise entre A et B.</br>
Exemple :</br>
A = 10</br>
B = 20</br>
C = 15</br>
Oui C est compris entre A et B</p>
<%
    System.out.println("A = %d\n", request.getParameter("valeur1"));
    System.out.println("B = %d\n", request.getParameter("valeur2"));
    System.out.println("C = %d\n", request.getParameter("valeur3"));
%>
<p>
    <% String val1 = request.getParameter("valeur1"); %>
    <% String val2 = request.getParameter("valeur2"); %>
    <% String val3 = request.getParameter("valeur3"); %>

    <% int A = Integer.parseInt(val1); %>
    <% int B = Integer.parseInt(val2); %>
    <% int C = Integer.parseInt(val3); %>

    <% int min = Math.min(A, B);%>
    <% int max = Math.max(A, B);%>

    <% if (C >= min && C <= max) { %>
        <%= "C est compris entre A et B"%>
    <%} else {%>
        <%= "C n'est pas compris entre A et B"%>
    <%}%>

</p>

<h2>Exercice 2 : Pair ou Impair ?</h2>
<p>

    <% if (A%2 == 0) {%>
        <%= "La valeur A entree est pair\n"%>
    <%} else {%>
        <%= "La valeur A entree est impair\n"%>
    <%}%>
        <% if (B%2 == 0) {%>
        <%= "La valeur B entree est pair\n"%>
    <%} else {%>
        <%= "La valeur B entree est impair\n"%>
    <%}%>
    <% if (C%2 == 0) {%>
        <%= "La valeur C entree est pair\n"%>
    <%} else {%>
        <%= "La valeur C entree est impair\n"%>
    <%}%>
</p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
