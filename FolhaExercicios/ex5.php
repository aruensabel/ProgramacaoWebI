<!DOCTYPE html>
<html lang="pt-br">
<head><meta charset="UTF-8"><title>Exercício 5 - Área do Triângulo</title></head>
<body>
<h2>Área do Triângulo Retângulo</h2>
<form method="post">
<label>Base (m): </label><input type="number" name="base" step="any" required><br><br>
<label>Altura (m): </label><input type="number" name="altura" step="any" required><br><br>
<input type="submit" value="Calcular">
</form>
<?php
if ($_POST) {
    $base = $_POST['base']; $altura = $_POST['altura'];
    $area = ($base * $altura) / 2;
    echo "<p>A área do triângulo retângulo é $area metros quadrados.</p>";
}
?>
</body></html>