<!DOCTYPE html>
<html lang="pt-br">
<head><meta charset="UTF-8"><title>Exercício 7 - Juros Mariazinha</title></head>
<body>
<h2>Financiamento da Mariazinha</h2>
<?php
$a_vista = 22500; $parcela = 489.65; $qtd = 60;
$total_pago = $parcela * $qtd; $juros = $total_pago - $a_vista;
echo "<p>Valor à vista: R$ $a_vista</p>";
echo "<p>Total pago em 60x: R$ " . number_format($total_pago, 2, ',', '.') . "</p>";
echo "<p>Valor pago apenas de juros: <strong>R$ " . number_format($juros, 2, ',', '.') . "</strong></p>";
?>
</body></html>