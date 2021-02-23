<?php require 'inc/header.php' ?>
<?php require 'inc/topbar.php' ?>
<main>
  <div class="container">
    <h1 class="page-title">Liste des animaux</h1>
    <?php foreach ($this->oAnimals as $oAnimal): ?>
      <div class="row">
        <hr>
  			<div class="col s12 m12 l12">
			  
  				<h4><?= $oAnimal->nom ?></h4>
				
  				<div class="row">
  					<div class="col s12 m6 l8">
					<p><?= $oAnimal->typeAnimal?></p>  
					<p>Date de naissance: &nbsp<?=date('d/m/Y', strtotime($oAnimal->DateNaissance));?></p>
					<p>Propriétaire: &nbsp<?= $oAnimal->Propriétaire_id?></p>
					<p>Race: &nbsp<?= $oAnimal->race?></p>
					
              <?php require 'inc/control_buttons.php' ?>
  					</div>
  					<div class="col s12 m6 l4">
  						<img src="<?=ROOT_URL?>static/img/posts/<?= $oAnimal->image ?>" class="materialboxed responsive-img" alt="<?= $oAnimal->nom ?>"/>
  						<br/><br/>
  				  	<a class="btn light-blue waves-effect waves-light" href="<?=ROOT_URL?>blog_post_<?=$oAnimal->id?>.html">Lire le chapitre</a>
  					</div>
  				</div>
  			</div>
  		</div>
    <?php endforeach ?>
  </div>
</main>
<?php require 'inc/footer.php' ?>
