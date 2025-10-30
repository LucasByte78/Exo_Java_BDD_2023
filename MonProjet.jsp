<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%-- ================================
     Définition de la classe Task
     ================================ --%>
<%-- La classe est déclarée une seule fois au niveau de la page (déclaration JSP <%! ... %>) --%>
<%!
public class Task {
    private String Nom;
    private String Description;
    private String DateEcheance; // Renommé pour plus de clarté
    private boolean TacheFinie;

    public Task(String _Nom, String _Description, String _DateEcheance) {
        Nom = _Nom;
        Description = _Description;
        // Gère le cas où le champ de date est vide
        DateEcheance = (_DateEcheance != null && !_DateEcheance.isEmpty()) ? _DateEcheance : "Non spécifiée";
        TacheFinie = false;
    }

    public String getNom() { return Nom; }
    public String getDescription() { return Description; }
    public String getDate() { return DateEcheance; }
    public boolean isTacheFinie() { return TacheFinie; }

    // Nouvelle méthode pour basculer le statut (Terminé/Rétablir)
    public void toggleStatus() {
        TacheFinie = !TacheFinie;
    }
}
%>
<%
    // ================================
    // LOGIQUE DE CONTRÔLE
    // ================================

    // 1. Initialisation de la liste des tâches en session
    ArrayList<Task> tasks = (ArrayList<Task>) session.getAttribute("tasks");

    if (tasks == null) {
        tasks = new ArrayList<Task>();
        session.setAttribute("tasks", tasks);
    }

    // Récupération des paramètres pour les actions (GET)
    String action = request.getParameter("action");
    String indexStr = request.getParameter("index");
    int index = -1;

    if (indexStr != null) {
        try {
            index = Integer.parseInt(indexStr);
        } catch (NumberFormatException e) {
            // Index invalide, on laisse index = -1
        }
    }

    // 2. Traitement du formulaire d'ajout (POST)
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String Nom = request.getParameter("Nom");
        String Description = request.getParameter("Description");
        String DateEcheance = request.getParameter("Date"); // Récupération de la date

        if (Nom != null && !Nom.trim().isEmpty()) {
            Task newTask = new Task(Nom.trim(), Description.trim(), DateEcheance);
            tasks.add(newTask);
            
            // Pattern PRG (Post/Redirect/Get) : Redirection pour éviter la soumission multiple
            response.sendRedirect("MonProjet.jsp");
            return; // Arrêter l'exécution du JSP après la redirection
        }
    }

    // 3. Traitement des actions (GET) : Supprimer ou Terminer/Rétablir
    if (action != null && index != -1 && index >= 0 && index < tasks.size()) {
        if ("toggle".equals(action)) {
            tasks.get(index).toggleStatus();
        } else if ("delete".equals(action)) {
            tasks.remove(index);
        }

        // Redirection après l'action pour nettoyer l'URL
        response.sendRedirect("MonProjet.jsp");
        return; // Arrêter l'exécution du JSP après la redirection
    }
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestion des tâches</title> <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f5f5f5;
        }
        a {
            text-decoration: none;
            color: #0078d7;
        }
        h1 { color: #333; }
        form {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            width: 450px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }
        input, textarea, button {
            width: 90%;
            margin: 10px;
            padding: 10px;
            font-size: 14px;
            border-radius: 6px;
            border: 1px solid #ccc;
            box-sizing: border-box; /* Pour que le padding n'augmente pas la taille totale */
        }
        button[type="submit"] {
            background-color: #0078d7;
            color: white;
            border: none;
            cursor: pointer;
        }
        button[type="submit"]:hover {
            background-color: #005fa3;
        }
        .task-list {
            margin-top: 30px;
        }
        .task {
            background: white;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 10px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            position: relative;
        }
        .task.TacheFinie {
            opacity: 0.6;
            text-decoration: line-through;
        }
        .task h3 {
            margin-top: 0;
        }
        .actions { /* Renommé .Supprimers en .actions pour plus de clarté */
            position: absolute;
            right: 15px;
            top: 15px;
            display: flex;
            gap: 10px;
        }
        .actions a {
            color: #0078d7;
        }
        .actions a:hover {
            text-decoration: underline;
        }
        .back-home {
            display: inline-block;
            margin-bottom: 20px;
            background: #ccc;
            padding: 8px 12px;
            border-radius: 5px;
            color: black;
        }
    </style>
</head>
<body>

<a class="back-home" href="index.html">⬅ Retour à l'accueil</a>

<h1>📝 Liste de tâches</h1>

<form method="post" action="MonProjet.jsp">
    <label for="Nom">Nom de la tâche :</label>
    <input type="text" id="Nom" name="Nom" required>

    <label for="Description">Description :</label>
    <textarea id="Description" name="Description" rows="3"></textarea>

    <label for="Date">Date d’échéance :</label>
    <input type="date" id="Date" name="Date">

    <button type="submit">Ajouter la tâche</button>
</form>

<div class="task-list">
    <h2>Vos tâches :</h2>
    <%
    if (tasks.isEmpty())
    {
    %>
        <h3>Aucune tâche pour le moment.</h3>
    <%
    }
    else
    {
        for (int i = 0; i < tasks.size(); i++)
        {
            Task t = tasks.get(i);

            String taskClass = t.isTacheFinie() ? "TacheFinie" : "";
            String toggleText = t.isTacheFinie() ? "Rétablir" : "Terminer";
    %>
        <div class="task <%= taskClass %>">
            <h3><%= t.getNom() %></h3>
            <p>Description : <%= t.getDescription() %></p>
            <p>Date d'échéance : **<%= t.getDate() %>**</p> <div class="actions">
                <a href="MonProjet.jsp?action=toggle&index=<%=i%>"><%= toggleText %></a>
                
                <a href="MonProjet.jsp?action=delete&index=<%=i%>" onclick="return confirm('Voulez-vous vraiment supprimer la tâche « <%= t.getNom() %> » ?');">Supprimer</a>
            </div>
        </div>
    <%
        }
    }
    %>
</div>

</body>
</html>
