<!DOCTYPE html>
<html lang="pt-br">
<head><meta charset="UTF-8"><title>Exercício 8 - Juros Simples</title></head>
<body>
<h2>Financiamento com Juros Simples (Paulinho)</h2>
<?php
$valor = 8654; $parcelas = [24,36,48,60]; $taxa = 0.015;
foreach ($parcelas as $p) {
    $montante = $valor + ($valor * $taxa * $p);
    $parcela = $montante / $p;
    echo "<p>$p vezes - Juros: " . ($taxa*100) . "% - Parcela: R$ " . number_format($parcela, 2, ',', '.') . "</p>";
    $taxa += 0.005;
}
?>
</body></html>