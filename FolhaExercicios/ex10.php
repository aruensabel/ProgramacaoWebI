<!DOCTYPE html>
<html lang="pt-br">
<head><meta charset="UTF-8"><title>Exercício 10 - Árvore Recursiva</title></head>
<body>
<h2>Criação de Árvore com Recursão</h2>
<?php
$arvore = [
    "Raiz" => [
        "Galho 1" => ["Folha 1.1","Folha 1.2"],
        "Galho 2" => [
            "Subgalho 2.1" => ["Folha 2.1.1","Folha 2.1.2"],
            "Folha 2.2"
        ]
    ]
];
function exibirArvore($elemento) {
    echo "<ul>";
    foreach ($elemento as $chave => $valor) {
        echo "<li>";
        if (is_array($valor)) {
            echo "<strong>$chave</strong>";
            exibirArvore($valor);
        } else {
            echo "$valor";
        }
        echo "</li>";
    }
    echo "</ul>";
}
exibirArvore($arvore);
?>
</body></html>