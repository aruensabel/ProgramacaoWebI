<?php
require_once 'db.php';
require_once 'funcoes.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $respostas = $_POST['resposta'] ?? [];
    $feedback = sanitizar($_POST['feedback'] ?? '');
    $id_dispositivo = 1; // fixo por enquanto até fazer a parte 2 com painel do adm

    if (empty($respostas)) {
        die("Nenhuma resposta enviada.");
    }

    $pdo->beginTransaction();

    try {
        foreach ($respostas as $id_pergunta => $valor) {
            $sql = "INSERT INTO avaliacoes (id_setor, id_pergunta, id_dispositivo, resposta, feedback, data_hora)
                    VALUES (1, :pergunta, :dispositivo, :resposta, :feedback, NOW())";
            $stmt = $pdo->prepare($sql);
            $stmt->execute([
                ':pergunta' => $id_pergunta,
                ':dispositivo' => $id_dispositivo,
                ':resposta' => $valor,
                ':feedback' => $feedback
            ]);
        }
        $pdo->commit();
        header("Location: ../public/obrigado.php");
        exit;
    } catch (PDOException $e) {
        $pdo->rollBack();
        die("Erro ao salvar avaliação: " . $e->getMessage());
    }
}
?>
