<!DOCTYPE html>
<html lang="pt-br">
<head><meta charset="UTF-8"><title>Exercício 4 - Área do Retângulo</title></head>
<body>
<h2>Área do Retângulo</h2>
<form method="post">
<label>Lado A (m): </label><input type="number" name="a" step="any" required><br><br>
<label>Lado B (m): </label><input type="number" name="b" step="any" required><br><br>
<input type="submit" value="Calcular">
</form>
<?php
if ($_POST) {
    $a = $_POST['a']; $b = $_POST['b']; $area = $a * $b;
    $tag = ($area > 10) ? "h1" : "h3";
    echo "<$tag>A área do retângulo de lados $a e $b metros é $area metros quadrados.</$tag>";
}
?>
</body></html>