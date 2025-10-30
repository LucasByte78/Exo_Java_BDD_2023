<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%!
     public class Task {
          private String Nom;
          private String Description;
          private String DateEcheance;
          private boolean TacheFinie;
          
          public Task(String _Nom, String _Description, String _DateEcheance) {
               Nom = _Nom;
               Description = _Description;
               if (_DateEcheance != null && !_DateEcheance.isEmpty())
               {
                    DateEcheance = "Non Spécifié";
               }
               else 
               {
                    DateEcheance = _DateEcheance;
               }
               TacheFinie = false;
          }
          public String getNom() 
          { 
               return Nom; 
          }
          public String getDescription() 
          { 
               return Description; 
          }
          public String getDate() 
          { 
               return DateEcheance; 
          }
          public boolean isTacheFinie() 
          { 
               return TacheFinie; 
          }
          
          public void toggleStatus() 
          {
               TacheFinie = !TacheFinie;
          }
     }
%>
<%

     ArrayList<Task> tasks = (ArrayList<Task>) session.getAttribute("tasks");
     
     if (tasks == null) {
     tasks = new ArrayList<Task>();
     session.setAttribute("tasks", tasks);
     }
     
     String action = request.getParameter("action");
     String indexStr = request.getParameter("index");
     int index = -1;
     
     if (indexStr != null) {
     try {
     index = Integer.parseInt(indexStr);
     } catch (NumberFormatException e) {
     // Ignorer
     }
     }
     
     // Traitement du formulaire d'ajout (POST)
     if ("POST".equalsIgnoreCase(request.getMethod())) {
     String Nom = request.getParameter("Nom");
     String Description = request.getParameter("Description");
     String DateEcheance = request.getParameter("Date");
     
     if (Nom != null && !Nom.trim().isEmpty()) {
     Task newTask = new Task(Nom.trim(), Description.trim(), DateEcheance);
     tasks.add(newTask);
     
     // Redirection (Pattern PRG)
     response.sendRedirect("MonProjet.jsp");
     return;
     }
     }
     
     // Traitement des actions (GET)
     if (action != null && index != -1 && index >= 0 && index < tasks.size()) {
     if ("toggle".equals(action)) {
     tasks.get(index).toggleStatus();
     } else if ("delete".equals(action)) {
     tasks.remove(index);
     }
     
     // Redirection
     response.sendRedirect("MonProjet.jsp");
     return;
     }
%>

<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<title>Gestion des tâches</title>
<style>
/* Style Sobriété */
body {
font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
margin: 40px auto;
max-width: 800px;
background-color: #f8f9fa; /* Très léger gris */
color: #343a40; /* Texte sombre */
}
h1 { 
color: #343a40; 
border-bottom: 2px solid #e9ecef;
padding-bottom: 10px;
margin-bottom: 30px;
}
a {
text-decoration: none;
color: #007bff; /* Bleu standard et professionnel */
}
a:hover {
color: #0056b3;
text-decoration: underline;
}
form {
background: #fff;
padding: 30px;
border-radius: 8px;
border: 1px solid #dee2e6; /* Bordure subtile au lieu d'une ombre forte */
}
label {
display: block;
margin-top: 15px;
font-weight: 600;
}
input, textarea, button[type="submit"] {
width: 100%;
margin: 5px 0 15px 0;
padding: 10px;
font-size: 16px;
border-radius: 4px;
border: 1px solid #ced4da;
box-sizing: border-box;
}
textarea {
resize: vertical;
}
button[type="submit"] {
background-color: #343a40; /* Bouton principal sombre */
color: white;
border: none;
cursor: pointer;
margin-top: 20px;
transition: background-color 0.2s;
}
button[type="submit"]:hover {
background-color: #495057;
}
.task-list {
margin-top: 40px;
}
.task {
background: #fff;
padding: 20px;
border-radius: 6px;
margin-bottom: 10px;
border-left: 5px solid #007bff; /* Accent color sur la gauche */
position: relative;
}
.task h3 {
margin-top: 0;
margin-bottom: 5px;
color: #343a40;
}
.task p {
margin: 5px 0;
font-size: 0.95em;
}
.task.TacheFinie {
opacity: 0.7;
text-decoration: line-through;
border-left: 5px solid #6c757d; /* Gris pour les tâches terminées */
}
.actions {
position: absolute;
right: 20px;
top: 20px;
display: flex;
gap: 15px;
}
.actions a {
font-size: 0.9em;
white-space: nowrap;
}
.back-home {
display: inline-block;
margin-bottom: 20px;
background: #e9ecef;
padding: 8px 15px;
border-radius: 4px;
color: #343a40;
font-size: 0.9em;
transition: background-color 0.2s;
}
.back-home:hover {
background-color: #dee2e6;
}
</style>
</head>
<body>

<a class="back-home" href="index.html">⬅ Retour à l'accueil</a>

<h1>📝 Gestion des Tâches</h1>

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
<p><strong>Description :</strong> <%= t.getDescription() %></p>
<p><strong>Échéance :</strong> <%= t.getDate() %></p>

<div class="actions">
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
