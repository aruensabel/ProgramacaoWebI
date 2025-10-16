<!DOCTYPE html>
<html lang="pt-br">
<head><meta charset="UTF-8"><title>Exercício 6 - Feira do Joãozinho</title></head>
<body>
<h2>Feira do Joãozinho</h2>
<form method="post">
<?php
$produtos = ["maçã", "melancia", "laranja", "repolho", "cenoura", "batatinha"];
foreach ($produtos as $p) {
    echo "<label>Preço do(a) $p (kg): </label><input type='number' step='any' name='preco_$p' required><br>";
    echo "<label>Quantidade comprada (kg): </label><input type='number' step='any' name='qtd_$p' required><br><br>";
}
?>
<input type="submit" value="Calcular Total">
</form>
<?php
if ($_POST) {
    $total = 0;
    foreach ($produtos as $p) {
        $total += $_POST["preco_$p"] * $_POST["qtd_$p"];
    }
    echo "<hr>";
    if ($total > 50) {
        $dif = $total - 50;
        echo "<p style='color:red;'>Faltou R$ " . number_format($dif, 2, ',', '.') . " para Joãozinho pagar.</p>";
    } elseif ($total < 50) {
        $dif = 50 - $total;
        echo "<p style='color:blue;'>Sobraram R$ " . number_format($dif, 2, ',', '.') . " para Joãozinho.</p>";
    } else {
        echo "<p style='color:green;'>O saldo para compras foi esgotado!</p>";
    }
}
?>
</body></html>