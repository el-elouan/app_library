<?php

interface iPersonne {
	public function createPersonne(string $prenom, string $nom);
	public function getPersonne(int $id);
	public function getPersonnes();
	public function upPersonne(int $id, string $prenom, string $nom, int $auteur);
	public function delPersonne(int $id);
}

interface iAuteur {
	public function createAuteur(string $prenom, string $nom);
	public function getAuteur(int $id);
	public function getAuteurs();
	public function getAuteurByLivre($id_livre);
	public function upAuteur(int $id, string $prenom, string $nom);
	public function delAuteur(int $id);
}

interface iLivre {
	public function createLivre(string $titre, int $id_auteur, int $id_genre);
	public function getLivre(int $id);
	public function getLivres();
	public function getLivresByGenre(int $id_genre);
	public function getLivresByAuteur(int $id_auteur);
	public function upLivre(int $id, string $titre, int $id_auteur, int $id_genre);
	public function delLivre(int $id);
}

interface iGenre {
	public function createGenre(string $nom);
	public function getGenre(int $id);
	public function getGenres();
	public function upGenre(int $id, string $nom);
	public function delGenre(int $id);
}

?>