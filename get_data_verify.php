<?php 
include_once('config/database.php'); //connexion à la base de donnée

if(isset($_POST['search_value_nom']) && isset($_POST['search_value_prenom'])
	&& isset($_POST['search_value_pere']) && isset($_POST['search_value_mere']))
{
	if(!empty($_POST['search_value_nom']) && !empty($_POST['search_value_prenom'])
		&& !empty($_POST['search_value_pere']) && !empty($_POST['search_value_mere']))
	{

		extract($_POST);

		$query = $db->prepare("SELECT * FROM electeur WHERE 
			 nom_electeur LIKE :nom AND 
			 prenom_electeur LIKE :prenom AND
			 nom_pere LIKE :pere AND
			 nom_mere LIKE :mere"
			);
		$query->execute([
			'nom' => '%'.$search_value_nom.'%',
			'prenom' => '%'.$search_value_prenom.'%',
            'pere' => '%'.$search_value_pere.'%',
            'mere' => '%'.$search_value_mere.'%',
		]);
		$req_data = $query->fetchAll(PDO::FETCH_OBJ);

		$data = ['success' => $req_data ? true : false, 
			'data' => $req_data,
		];
		// send data
		header('Content-Type: application/json');
		echo json_encode($data);

	}else{
		$error = ['success' =>  false];
		echo json_encode($error);
	}

}else{
	$error = ['success'=>false];
	echo json_encode($error);
}

