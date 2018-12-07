<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.4/css/buttons.bootstrap4.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/select/1.2.7/css/select.bootstrap4.min.css">
<link rel="stylesheet" href="../../extensions/Editor/css/editor.bootstrap4.min.css">
<link rel="stylesheet" href="css/testTab.css" type="text/css" />
</head>
<body>
	<div class="container">
  <h1>HTML5 Editable Table</h1>
  <p>Through the powers of <strong>contenteditable</strong> and some simple jQuery you can easily create a custom editable table. No need for a robust JavaScript library anymore these days.</p>
  
  <ul>
    <li>An editable table that exports a hash array. Dynamically compiles rows from headers</li> 
    <li>Simple / powerful features such as add row, remove row, move row up/down.</li>
  </ul>
  
  <div id="table" class="table-editable">
    <span class="table-add glyphicon glyphicon-plus"></span>
    <table class="table">
      <tr>
        <th>Name</th>
        <th>Value</th>
        <th></th>
        <th></th>
      </tr>
      <tr>
        <td contenteditable="true">Stir Fry</td>
        <td contenteditable="true">stir-fry</td>
        <td>
          <span class="table-remove glyphicon glyphicon-remove"></span>
        </td>
        <td>
          <span class="table-up glyphicon glyphicon-arrow-up"></span>
          <span class="table-down glyphicon glyphicon-arrow-down"></span>
        </td>
      </tr>
      <tr class="hide">
        <td contenteditable="true">Untitled</td>
        <td contenteditable="true">undefined</td>
        <td>
          <span class="table-remove glyphicon glyphicon-remove"></span>
        </td>
        <td>
          <span class="table-up glyphicon glyphicon-arrow-up"></span>
          <span class="table-down glyphicon glyphicon-arrow-down"></span>
        </td>
      </tr>
    </table>
  </div>
  
  <button id="export-btn" class="btn btn-primary">Export Data</button>
  <p id="export"></p>
</div>
    
    <script type="text/javascript" src="js/testTab.js"></script> 
</body>
</html>