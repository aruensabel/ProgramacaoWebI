<!DOCTYPE html>
<html lang="pt-br">
<head><meta charset="UTF-8"><title>Exercício 1 - Soma de Três Valores</title></head>
<body>
<h2>Soma de Três Valores</h2>
<form method="post">
<label>Valor 1: </label><input type="number" name="v1" required step="any"><br><br>
<label>Valor 2: </label><input type="number" name="v2" required step="any"><br><br>
<label>Valor 3: </label><input type="number" name="v3" required step="any"><br><br>
<input type="submit" value="Calcular">
</form>
<?php
if ($_POST) {
    $v1 = $_POST['v1']; $v2 = $_POST['v2']; $v3 = $_POST['v3'];
    $soma = $v1 + $v2 + $v3;
    if ($v1 > 10) $cor = "blue";
    elseif ($v2 < $v3) $cor = "green";
    elseif ($v3 < $v1 && $v3 < $v2) $cor = "red";
    else $cor = "black";
    echo "<p style='color:$cor;'>A soma dos valores é: <strong>$soma</strong></p>";
}
?>
</body></html>