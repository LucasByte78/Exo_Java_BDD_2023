<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
</form>
</body>
</html>
