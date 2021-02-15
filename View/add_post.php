<?php require 'inc/header.php' ?>
<?php require 'inc/topbar.php' ?>

<div class="container">
  <h1>Ajoutez un animal</h1>
  <?php require 'inc/msg.php' ?>
  <form method="post" enctype="multipart/form-data">
	<div class="row">
		<div class="input-field col s12">
			<input type="text" name="nom" id="nom" required="required">
			<label for="nom">Nom animal</label>
		</div>
		<div class="input-field col s12">
			Date de naissance
			<input type="date" name="DateNaissance" id="DateNaissance" required="required">
			<label for="DateNaissance"></label>
		</div>
		<div class="input-field col s12">
			Date de deces
			<input type="date" name="DateDeces" id="DateDeces" >
			<label for="title"></label>
		</div>
		<div class="input-field col s12">
			<input type="text" name="Proprietaire_id" id="Proprietaire_id" required="required">
			<label for="title">Nom de propriétaire</label>
		</div>
		

		<div class="input-field col s12">
      <label for="editable">A propos de l'animal</label>
      <br><br>
			<textarea name="body" id="editable"></textarea>
		</div>

		<div class="col s12">
			<div class="input-field file-field">
				<div class="btn">
					<span>Image de l'article</span>
					<input type="file" name="image">
				</div>
				<div class="file-path-wrapper">
					<input type="text" class="file-path validate" readonly>
				</div>
			</div>
		</div>

		<div class="col s12 right-align">
			<br><br>
			<button class="btn waves-effect waves-light" type="submit" name="add_submit">Publier</button>
		</div>

	</div>
</form>
</div>
