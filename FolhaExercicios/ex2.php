<!DOCTYPE html>
<html lang="pt-br">
<head><meta charset="UTF-8"><title>Exercício 2 - Divisível por 2</title></head>
<body>
<h2>Verificar Divisibilidade por 2</h2>
<form method="post">
<label>Digite um número: </label><input type="number" name="num" required>
<input type="submit" value="Verificar">
</form>
<?php
if ($_POST) {
    $num = $_POST['num'];
    if ($num % 2 == 0) echo "<p>Valor divisível por 2</p>";
    else echo "<p>O valor não é divisível por 2</p>";
}
?>
</body></html>