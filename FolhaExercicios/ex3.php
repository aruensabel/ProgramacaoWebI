<!DOCTYPE html>
<html lang="pt-br">
<head><meta charset="UTF-8"><title>Exercício 3 - Área do Quadrado</title></head>
<body>
<h2>Área do Quadrado</h2>
<form method="post">
<label>Lado (m): </label><input type="number" name="lado" required step="any">
<input type="submit" value="Calcular">
</form>
<?php
if ($_POST) {
    $lado = $_POST['lado'];
    $area = $lado * $lado;
    echo "<p>A área do quadrado de lado $lado metros é $area metros quadrados.</p>";
}
?>
</body></html>