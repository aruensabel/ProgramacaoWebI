<?php
function sanitizar($dados) {
    return htmlspecialchars(trim($dados), ENT_QUOTES, 'UTF-8');
}
?>
