<?php
require_once '../src/db.php';

// Enviar form
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['resposta'])) {
    $feedback = $_POST['feedback'] ?? null;

    foreach ($_POST['resposta'] as $id_pergunta => $nota) {
        $stmt = $pdo->prepare("
            INSERT INTO avaliacoes (id_pergunta, resposta, feedback)
            VALUES (?, ?, ?)
        ");
        $stmt->execute([$id_pergunta, $nota, $feedback]);
    }

    $mensagem = " Avaliação registrada com sucesso!";
}

// Buscar perguntas
$perguntas = $pdo->query("SELECT * FROM perguntas WHERE status = true ORDER BY id_pergunta")->fetchAll();
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Formulário de Avaliação</title>
    <link rel="stylesheet" href="css/style.css">
    <script defer src="js/script.js"></script>
</head>
<body>

<div class="container">
    <h1>Formulário de Avaliação</h1>

    <?php if (isset($mensagem)): ?>
        <div class="mensagem"><?= $mensagem ?></div>
    <?php endif; ?>

    <form method="POST" action="">
        <?php if (empty($perguntas)): ?>
            <p><em>Nenhuma pergunta cadastrada no momento.</em></p>
        <?php else: ?>
            <?php foreach ($perguntas as $p): ?>
                <div class="pergunta">
                    <strong><?= htmlspecialchars($p['texto']) ?></strong>
                    <div class="opcoes" data-group="<?= $p['id_pergunta'] ?>">
                        <?php
                        $cores = [
                            "#d32f2f", "#d84315", "#ef6c00", "#f57c00", "#f9a825",
                            "#fbc02d", "#cddc39", "#9ccc65", "#66bb6a", "#43a047", "#388e3c"
                        ];
                        for ($i = 0; $i <= 10; $i++): ?>
                            <label class="nota" data-value="<?= $i ?>" style="background-color: <?= $cores[$i] ?>;">
                                <input type="radio" name="resposta[<?= $p['id_pergunta'] ?>]" value="<?= $i ?>">
                                <?= $i ?>
                            </label>
                        <?php endfor; ?>
                    </div>
                </div>
            <?php endforeach; ?>

            <label><strong>Comentário (opcional):</strong></label><br>
            <textarea name="feedback" rows="3" placeholder="Deixe seu comentário..."></textarea><br><br>

            <button type="submit">Enviar Avaliação</button>
        <?php endif; ?>
    </form>
</div>

</body>
</html>
