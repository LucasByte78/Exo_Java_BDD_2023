<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%!
  public class Task 
  {
    String Nom;
    String Description;

    public Task(String _Nom, String _Description)
    {
      Nom = _Nom;
      Description = _Description;
    }
    public String getNom()
    {
      return Nom;
    }
  
    public String getDescription()
    {
      return Description;
    }
  }
%>
<%
     ArrayList<Task> tasks = (ArrayList<Task>) session.getAttribute("tasks");

      if (tasks == null) {
          tasks = new ArrayList<Task>();
          session.setAttribute("tasks", tasks);
     }

     // Vérifier si le formulaire a été soumis
     String title = request.getParameter("Nom");
     String description = request.getParameter("Description");

     if (Nom != null && Description != null && !Nom.trim().isEmpty()) {
          // Créer et ajouter une nouvelle tâche
          Task newTask = new Task(Nom.trim(), Description.trim());
          tasks.add(newTask);
          session.setAttribute("tasks", tasks);
     }
%>
<html>
<head>
<title>Gestionnaire de tâches</title>
  <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f5f5f5;
        }
        h1 { color: #333; }
        input, textarea, button {
            width: 100%;
            margin-top: 10px;
            padding: 10px;
            font-size: 14px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }
        form {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            width: 400px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }
        button {
            background-color: #0078d7;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
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
        }
        .task h3 {
            margin: 0 0 5px 0;
        }
    </style>
</head>
<body bgcolor=white>
  <h1>Mon gestionnaire de tâches</h1>
  <form action="#" method="post">
    <label for="nom">Nom de la tâche :</label>
    <input type="text" id="nom" name="nom" required>

    <label for="description">Description de la tâche :</label>
    <textarea id="description" name="description" rows="3"></textarea>

    <p><button type="submit">Ajouter une tâche</button>
    <div class="task-list">
      <h2>Vos tâches :</h2>
      <%
       if (tasks.isEmpty()) 
       {
      %>
          <p>Aucune tâche pour le moment.</p>
      <%
       } 
       else 
       {
            for (int i = 0; i < tasks.size(); i++) 
            {
                 Task t = tasks.get(i);
  
                 // Déterminer la classe CSS selon l'état
                 String taskClass = "";
                 if (t.isCompleted()) {
                      taskClass = "completed";
                 }
  
                 // Déterminer le texte pour la date d'échéance
                 String dueDateText = "Aucune";
                 if (t.getDueDate() != null && !t.getDueDate().isEmpty()) {
                      dueDateText = t.getDueDate();
                 }
  
                 // Déterminer le texte pour le lien d'action
                 String toggleText = "Terminer";
                 if (t.isCompleted()) {
                      toggleText = "Rétablir";
                 }
  
      %>
      <div class="task <%= taskClass %>">
          <h3><%= t.getTitle() %></h3>
          <p><%= t.getDescription() %></p>
          <div class="actions">
               <a href="tasks.jsp?action=toggle&index=<%=i%>"><%= toggleText %></a>
               //<a href="tasks.jsp?action=delete&index=<%=i%>" onclick="return confirm('Supprimer cette tâche ?');">Supprimer</a>
          </div>
      </div>
    </div>
  </form>
</body>
</html>
