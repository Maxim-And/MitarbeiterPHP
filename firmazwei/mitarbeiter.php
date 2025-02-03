<?php

require_once('db.php');

// Werte in die Datenbanktabellen überführen
if(isset($_POST['knopf'])){
	$vorname = $_POST['first'];
	$nachname = $_POST['second'];
	$geboren = $_POST['birthday'];
	$abteilung = $_POST['department'];
	$gehalt = $_POST['income'];
	$adresse = $_POST['adress'];
	$email = $_POST['email'];
	$iban = $_POST['konto'];
	
	$sql1 = "INSERT INTO mitarbeiter(vorname, nachname, geboren) VALUES ('$vorname','$nachname','$geboren')";
	$sql2 = "INSERT INTO metadaten(abteilung, gehalt, adresse, email, kontonummer) 
			VALUES ('$abteilung','$gehalt', '$adresse', '$email','$iban')";
			
	$conn->query($sql1);
	$conn->query($sql2);
	
	header('Location: success.php');
	exit();
	
}

?>
<!DOCTYPE html>
<html lang="de">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mitarbeiter Neu</title>
	<link rel="stylesheet" href="mitarbeiter.css">
  </head>
  <body>	
		<form class="formular" method="post">
			<label>Vorname</label>
			<input name="first">
			<label>Nachname</label>
			<input name="second">
			<label>Geboren</label>
			<input name="birthday">
			<label>Abteilung</label>
			<?php
				// Abteilungen abrufen
				$sql = "SELECT DISTINCT abteilung FROM metadaten";
				$result = $conn->query($sql);

				// HTML-Select starten
				echo '<select name="department">';
				echo '<option value="">-- Abteilung wählen --</option>';

				while ($row = $result->fetch_assoc()) {
					echo '<option value="' . $row["abteilung"] . '">' . $row["abteilung"] . '</option>';
				}

				echo '</select>';
			?>
			<label>Gehalt</label>
			<input name="income">
			<label>Adresse</label>
			<input name="adress">
			<label>Email</label>
			<input name="email">
			<label>IBAN</label>
			<input name="konto">
			<button name="knopf" type="submit">Speichern</button>
		</form>
  </body>
</html>

