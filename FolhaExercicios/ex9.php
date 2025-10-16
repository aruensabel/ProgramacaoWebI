<!DOCTYPE html>
<html lang="pt-br">
<head><meta charset="UTF-8"><title>Exercício 9 - Juros Compostos</title></head>
<body>
<h2>Financiamento com Juros Compostos (Juquinha)</h2>
<?php
$valor = 8654; $parcelas = [24,36,48,60]; $taxa = 0.02;
foreach ($parcelas as $p) {
    $montante = $valor * pow((1 + $taxa), $p);
    $parcela = $montante / $p;
    echo "<p>$p vezes - Juros: " . ($taxa*100) . "% - Parcela: R$ " . number_format($parcela, 2, ',', '.') . "</p>";
    $taxa += 0.003;
}
?>
</body></html>