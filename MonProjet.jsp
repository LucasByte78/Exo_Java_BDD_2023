<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Gestionnaire de tâches</title>
<style>
  button, textarea  {
      width: 20%;
      margin-top: 10px;
      padding: 10px;
      font-size: 14px;
      border-radius: 6px;
      border: 1px solid #ccc;    
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
</style>
</head>
<body bgcolor=white>
  <h1>Mon gestionnaire de tâches</h1>
  <form action="#" method="post">
    <p class="textarea">Saisir un nom de tâche : <input type="text" id="inputValeur" name="tache">
    <p><button type="submit">Ajouter une tâche</button>
</form>
</body>
</html>
