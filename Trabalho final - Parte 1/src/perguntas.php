<?php
require_once 'db.php';

function buscarPerguntas($pdo) {
    $sql = "SELECT id_pergunta, texto FROM perguntas WHERE status = TRUE ORDER BY id_pergunta ASC";
    $stmt = $pdo->query($sql);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}
?>
