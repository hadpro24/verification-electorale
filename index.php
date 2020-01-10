<?php

function sanitize_output($buffer) {

    $search = array(
        '/\>[^\S ]+/s',     // strip whitespaces after tags, except space
        '/[^\S ]+\</s',     // strip whitespaces before tags, except space
        // '/(\s)+/s',         // shorten multiple whitespace sequences
        '/<!--(.|\s)*?-->/' // Remove HTML comments
    );

    $replace = array(
        '>',
        '<',
        // '\\1',
        ''
    );

    $buffer = preg_replace($search, $replace, $buffer);

    return $buffer;
}

ob_start("sanitize_output");

?>
<!DOCTYPE html>
<html lang="fr">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="theme-color" content="#34b0fa">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/aos.css" />
    <link rel="stylesheet" href="style.css">
    <title>Verification de la liste electorale 2020 - CENI</title>
  </head>
  <body>
    <header class="px-3 px-sm-5 py-3 head">
      <div class="logo">
        <img src="ceni-logo.png" alt="">
      </div>
      <div class="year text-uppercase text-center">
        <div class="title">Vérification</div>
        <div class="date">Liste électorale 2020</div>
      </div>
    </header>
    <div class="container py-4">
      <div class="row">
        <form class="form-inline col-12 search-form p-3 pl-sm-5 pb-4 " id="search-form">
          <div class="mb-2 col-12 pl-0">
            <small class="help-text">
              <strong class="pr-1">*</strong>Tous les champs sont obligatoires
            </small>
          </div>
          <input type="text" class="form-control mb-2 mr-sm-2 col-sm-2" id="search-field-nom" placeholder="Nom" required>
          <input type="text" class="form-control mb-2 mr-sm-2 col-sm-2" id="search-field-prenom" placeholder="Prénom" required>
          <input type="text" class="form-control mb-2 mr-sm-2 col-sm-2" id="search-field-pere" placeholder="Nom du père" required>
          <input type="text" class="form-control mb-2 mr-sm-2 col-sm-2" id="search-field-mere" placeholder="Nom de la mère " required>
          <button type="submit" class="btn btn-primary mb-2 col-sm-3">Rechercher</button>
        </form>
      </div>
      <div class="row justify-content-center mt-4 d-none" id="alert-notfound">
        <div class="col-6 ofset-3">
          <div class="alert alert-danger text-center" role="alert">
            Aucun élément correspondant n'a été trouvé  
          </div>
        </div>
      </div>
      <div class="row d-none" id="loader-wrapper">
        <div class="col-12 mt-1">
          <div class="d-flex justify-content-center">
            <div class="loader">Chargement...</div>
          </div>
        </div>
      </div>
      <div class="row" id="results-wrapper">
        <hr class="col-11">
        <div class="col-12 results"></div>
      </div>
    </div>

    <script src="assets/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="assets/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="assets/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="assets/aos.js"></script>
    <script>
        AOS.init({once:true});
    </script>
    <script type="text/javascript">
       document.addEventListener('DOMContentLoaded', function(){
          document.querySelector('#search-form').onsubmit = function(){
            document.querySelector('#search-form').disabled = true;
            // get data
             const search_value_nom = document.querySelector('#search-field-nom').value.trim();
             const search_value_prenom = document.querySelector('#search-field-prenom').value.trim();
             const search_value_pere = document.querySelector('#search-field-pere').value.trim();
             const search_value_mere = document.querySelector('#search-field-mere').value.trim();

             if(search_value_nom == ''){
                document.querySelector('#search-field-nom').required = true;
                document.querySelector('#search-form').disabled = false;
                return false;
             }
             if(search_value_prenom == ''){
                document.querySelector('#search-field-prenom').required = true;
                document.querySelector('#search-form').disabled = false;
                return false;
             }
             if(search_value_pere == ''){
                document.querySelector('#search-field-pere').required = true;
                document.querySelector('#search-form').disabled = false;
                return false;
             }
             if(search_value_mere == ''){
                document.querySelector('#search-field-mere').required = true;
                document.querySelector('#search-form').disabled = false;
                return false;
             }

             // initialisation de nouveau requêtte
              document.querySelector('#results-wrapper .results').innerHTML = '';
              document.querySelector('#loader-wrapper').classList.remove('d-none');
              const request = new XMLHttpRequest();
              request.open('POST', '/get_data_verify.php');
              // apeler cette fonction la requestte sera complete
              request.onload = () => {
                // on extrait le resultat DE json EN TEXT
                const response = JSON.parse(request.responseText);
                console.log(response);
                document.querySelector('#search-field-nom').value=''; 
                document.querySelector('#search-field-prenom').value=''; 
                document.querySelector('#search-field-pere').value=''; 
                document.querySelector('#search-field-mere').value=''; 
                // return false;
                if(response.success)
                {
                   // return false;
                   document.querySelector('#loader-wrapper').classList.add('d-none');
                   document.querySelector('#alert-notfound').classList.add('d-none');
                   document.querySelector('#alert-notfound').classList.remove('d-flex');

                   // display resultat
                   let results = document.querySelector('#results-wrapper .results');

                   document.querySelector('#results-wrapper').classList.remove('d-none');
                   response.data.map(function(item){
                       var el = document.createElement('div');
                       el.classList.add('card');
                       el.classList.add('result-item');
                       el.classList.add('mb-2');
                       el.innerHTML =`
                            <div class="card result-item" data-aos="fade-up" data-aos-duration="1300" data-aos-delay="50">
                                <div class="card-body row">
                                  <div class="col-sm-4 mb-3">
                                    <label class="h6">Nom</label>
                                    <input type="text" class="form-control" readonly 
                                    value="${item.nom_electeur}">
                                  </div>
                                  <div class="col-sm-4 mb-3">
                                    <label class="h6">Prénom</label>
                                    <input type="text" class="form-control" readonly 
                                    value="${item.prenom_electeur}">
                                  </div>
                                  <div class="col-sm-4 mb-3">
                                    <label class="h6">Nom du père</label>
                                    <input type="text" class="form-control" readonly 
                                      value="${item.nom_pere}">
                                  </div>
                                  <div class="col-sm-4 mb-3">
                                    <label class="h6">Nom de la mère</label>
                                    <input type="text" class="form-control" readonly 
                                    value="${item.nom_mere}">
                                  </div>
                                  <div class="col-sm-4 mb-3">
                                    <label class="h6">Région</label>
                                    <input type="text" class="form-control" readonly 
                                    value="${item.region}">
                                  </div>
                                  <div class="col-sm-4 mb-3">
                                    <label class="h6">Préfecture</label>
                                    <input type="text" class="form-control" readonly 
                                    value="${item.prefecture}">
                                  </div>
                                  <div class="col-sm-4 mb-3">
                                    <label class="h6">Commune</label>
                                    <input type="text" class="form-control" readonly 
                                    value="${item.commune}">
                                  </div>
                                  <div class="col-sm-4 mb-3">
                                    <label class="h6">District</label>
                                    <input type="text" class="form-control" readonly 
                                    value="${item.district}">
                                  </div>
                                  <div class="col-sm-4 mb-3">
                                    <label class="h6">Secteur</label>
                                    <input type="text" class="form-control" readonly 
                                    value="${item.secteur}">
                                  </div>
                                </div>
                            </div>
                      `;
                      results.appendChild(el);
                   });
                   document.querySelector('#search-form').disabled = false;
                   return false;
                }
                else
                {
                   document.querySelector('#results-wrapper').classList.add('d-none');
                   document.querySelector('#loader-wrapper').classList.add('d-none');

                   document.querySelector('#alert-notfound').classList.remove('d-none');
                   document.querySelector('#alert-notfound').classList.add('d-flex');
                   document.querySelector('#search-form').disabled = false;
                   return false;
                }
              }

              // on ajouter les données
              const data = new FormData();
              data.append('search_value_nom', search_value_nom);
              data.append('search_value_prenom', search_value_prenom);
              data.append('search_value_pere', search_value_pere);
              data.append('search_value_mere', search_value_mere);
              // on envoie la request
              request.send(data);
              return false;
          }
       });
    </script>
  </body>
</html>