<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Gestionnaire de tâches</title>
<style>
  button {
      background-color: #0078d7;
      color: white;
      border: none;
      cursor: pointer;
  }
  button:hover {
      background-color: #005fa3;
  }
</style>
</head>
<body bgcolor=white>
  <h1>Mon gestionnaire de tâches</h1>
  <form action="#" method="post">
    <p>Saisir un nom de tâche : <input type="text" id="inputValeur" name="tache">
    <p><button type="submit">Ajouter une tâche</button>
</form>
</body>
</html>
