<?php require 'inc/header.php' ?>
<?php require 'inc/topbar.php' ?>

<main>
  <div class="container">
    <?php if (empty($this->oAnimals)): ?>
        <h1>Il n'y a aucun animal.</h1>
        <p><button type="button" onclick="window.location='<?=ROOT_URL?>admin_add.html'" class="btn waves-effect waves-light">Ajoutez votre premier animal!</button></p>
    <?php else: ?>
    <h1 class="page-title" style="font-family: Georgia, 'Times New Roman', Times, serif;">Vitrine de la clinique</h1>
    <div class="row">

      <!-- ARTICLES -->
      <?php foreach ($this->oAnimals as $oAnimal): ?>
        <div class="col l6 m6 s12">
          <div class="card hoverable">
            <div class="card-content">
              <h5><a class="grey-text text-darken-2" href="<?=ROOT_URL?>blog_post_<?=$oAnimal->id?>.html"><?=htmlspecialchars($oAnimal->nom)?></a></h5>
              <h6 class="grey-text">Né le <?=date('d/m/Y', strtotime($oAnimal->DateNaissance));?></h6>
            </div>
            <div class="card-image waves-effect waves-block waves-light">
    					<img src="<?=ROOT_URL?>static/img/posts/<?= $oAnimal->image ?>" class="activator" alt="<?= $oAnimal->nom ?>">
    				</div>
            <div class="card-content">
              <span class="card-title activator grey-text text-darken-4"><i class="material-icons right">more_vert</i></span>
              <p><a href="<?=ROOT_URL?>blog_post_<?=$oAnimal->id?>.html">Voir le chapitre au complet</a></p>
            </div>
            <div class="card-reveal">
    					<span class="card-title grey-text text-darken-4"><?= $oAnimal->nom ?><i class="material-icons right">close</i></span>
    					<p><?= preg_replace("/<img[^>]+\>/i", "", nl2br(mb_strimwidth($oAnimal->body, 0, 800, '...'))); ?></p>
    				</div>
          </div>
        </div>
      <?php endforeach ?>
    </div>
  </div>
</main>
<?php endif ?>
<?php require 'inc/footer.php' ?>
