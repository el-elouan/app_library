<?php

include("interface.php");
include("connect.php");

class PersonneDAO implements iPersonne {
	public function createPersonne(string $prenom, string $nom) {
		$exist = R::find('personne', ' prenom = ? AND nom = ?', array($prenom, $nom));
		if (!$exist) {
			$personne = R::dispense('personne');
	        $personne->prenom = $prenom;
	        $personne->nom = $nom;
	        $personne->auteur = 0;
	        return R::store($personne);
		}
		return false;
	}
	public function getPersonne(int $id) {
		return R::load('personne', $id);
	}
	public function getPersonnes() {
		return R::findAll('personne');
	}
	public function upPersonne(int $id, string $prenom, string $nom, int $auteur) {
		$personne = R::load('personne', $id);
        $personne->prenom = $prenom;
        $personne->nom = $nom;
        $personne->auteur = $auteur;
        return R::store($personne);
	}
	public function delPersonne(int $id) {
		$personne = R::load('personne', $id);
        $res = R::trash($personne);
        if ($res) {
        	return true;
        }
	}
}

class AuteurDAO implements iAuteur {
	public function createAuteur(string $prenom, string $nom) {
		$exist = R::find('personne', ' prenom = ? AND nom = ?', array($prenom, $nom));
		if (!$exist) {
			$personne = R::dispense('personne');
	        $personne->prenom = $prenom;
	        $personne->nom = $nom;
	        $personne->auteur = 1;
	        return R::store($personne);
		}
		return false;
	}
	public function getAuteur(int $id) {
		return R::load('personne', $id);
	}
	public function getAuteurs() {
		return R::find( 'personne', ' auteur = 1 ');
	}
	public function getAuteurByLivre($id_livre) {
		$livre = R::load('livre', $id_livre);
		return R::load('personne', $livre->id_auteur);
	}
	public function upAuteur(int $id, string $prenom, string $nom) {
		$auteur = R::load('personne', $id);
        $auteur->prenom = $prenom;
        $auteur->nom = $nom;
        $auteur->auteur = 1;
        return R::store($auteur);
	}
	public function delAuteur(int $id) {
		$personne = R::load('personne', $id);
        $res = R::trash($personne);
        if ($res) {
        	return true;
        }
	}
}

class LivreDAO implements iLivre {
	public function createLivre(string $titre, int $id_auteur, $id_genre) {
		$exist = R::find('livre', ' titre = ? AND id_auteur = ?', array($titre, $id_auteur));
		if (!$exist) {
			$livre = R::dispense('livre');
	        $livre->titre = $titre;
	        $livre->id_auteur = $id_auteur;
	        $livre->id_genre = $id_genre;
	        return R::store($livre);
		}
		return false;
	}
	public function getLivre(int $id) {
		return R::load('livre', $id);
	}
	public function getLivres() {
		return R::findAll('livre');
	}
	public function getLivresByGenre(int $id_genre) {
		return R::find( 'livre', ' genre = '.$id_genre);
	}
	public function getLivresByAuteur(int $id_auteur) {
		return R::find( 'livre', ' auteur = '.$id_auteur);
	}
	public function upLivre(int $id, string $titre, int $id_auteur, int $id_genre) {
		$livre = R::load('livre', $id);
        $livre->titre = $titre;
        $livre->id_auteur = $id_auteur;
        $livre->id_genre = $id_genre;
        return R::store($livre);
	}
	public function delLivre(int $id) {
		$livre = R::load('livre', $id);
        $res = R::trash($livre);
        if ($res) {
        	return true;
        }
	}
}

class GenreDAO implements iGenre {
	public function createGenre(string $nom) {
		$exist = R::find('genre', ' nom = ?', array($nom));
		if (!$exist) {
			$genre = R::dispense('genre');
	        $genre->nom = $nom;
	        return R::store($genre);
		}
		return false;
	}
	public function getGenre(int $id) {
		return R::load('livre', $id);
	}
	public function getGenres() {
		return R::findAll('livre');
	}
	public function upGenre(int $id, string $nom) {
		$genre = R::load('genre', $id);
        $genre->nom = $nom;
        return R::store($genre);
	}
	public function delGenre(int $id) {
		$genre = R::load('genre', $id);
        $res = R::trash($genre);
        if ($res) {
        	return true;
        }
	}
}

?>