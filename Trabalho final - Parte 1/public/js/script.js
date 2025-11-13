document.addEventListener('DOMContentLoaded', () => {
    try {
        const grupos = Array.from(document.querySelectorAll('.opcoes'));
        if (!grupos.length) return;

        function mostrarErro(form, texto) {
            const antigo = form.querySelector('.mensagem-erro');
            if (antigo) antigo.remove();

            const div = document.createElement('div');
            div.className = 'mensagem-erro';
            div.textContent = texto;

            const botao = form.querySelector('button[type="submit"], button');
            if (botao) botao.insertAdjacentElement('afterend', div);
            else form.appendChild(div);

            div.scrollIntoView({ behavior: 'smooth', block: 'center' });
        }

        function removerErro(form) {
            const antigo = form.querySelector('.mensagem-erro');
            if (antigo) antigo.remove();
        }

        // Marca visual cinza
        grupos.forEach(grupo => {
            const labels = Array.from(grupo.querySelectorAll('.nota'));
            labels.forEach(label => {
                label.addEventListener('click', (evt) => {
               
                    labels.forEach(l => l.classList.remove('selecionada'));
                    label.classList.add('selecionada');
                    const input = label.querySelector('input[type="radio"]');
                    if (input) input.checked = true;
                    const form = label.closest('form');
                    if (form) removerErro(form);
                });
            });
        });

        // Validação
        const form = document.querySelector('form');
        if (form) {
            form.addEventListener('submit', (e) => {
                const total = grupos.length;
                let respondidas = 0;
                grupos.forEach(g => {
                    if (g.querySelector('input[type="radio"]:checked')) respondidas++;
                });

                if (respondidas < total) {
                    e.preventDefault();
                    mostrarErro(form, 'Por favor, responda todas as perguntas antes de enviar.');
                    return false;
                }

                removerErro(form);
                return true;
            });
        }
    } catch (err) {
        console.error('Erro no script de avaliação:', err);
    }
});
