<?php

include "implementDAO.php";

$personne = PersonneDAO::createPersonne("Testcrea","Personne");
if ($personne) {
	echo "Personne créée";
} else {
	echo "Personne existante";
}
$auteur = AuteurDAO::createAuteur("Testcrea","Auteur");
if ($auteur) {
	echo "Auteur créé";
} else {
	echo "Auteur existant";
}
$genre = GenreDAO::createGenre("GenreTest");
if ($genre) {
	echo "Genre créé";
} else {
	echo "Genre existant";
}

AuteurDAO::upAuteur(10,"TestEdit","Auteur");
PersonneDAO::upPersonne(11,"TestEdit","Personne",0);

$livre = LivreDAO::createLivre("Histoire de Test",10,3);

?>