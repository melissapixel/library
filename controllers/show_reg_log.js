document.addEventListener('DOMContentLoaded', function() {
    const toLogin = document.getElementById('to-login');
    const toRegister = document.getElementById('to-register');
    const regForm = document.getElementById('register-form');
    const loginForm = document.getElementById('login-form');
    const form = document.getElementById('form');

    function showLogin() {
        regForm.style.display = 'none';
        loginForm.style.display = 'block';
    }

    function showRegister() {
        loginForm.style.display = 'none';
        regForm.style.display = 'block';
    }

    // переходим к входу
    toLogin.addEventListener('click', function(e) {
        e.preventDefault();
        showLogin();
    });

    // переходим к регистрации
    toRegister.addEventListener('click', function(e) {
        e.preventDefault();
        showRegister();
    });

    // пример обработки сабмита (для демонстрации)
    form.addEventListener('submit', function(e) {
        // определить активную форму по видимости
        if (regForm.style.display !== 'none') {
            // регистрация
            // e.g. отдать данные на /register
            console.log('Регистрация', new FormData(form));
        } else {
            // вход
            console.log('Вход', new FormData(form));
        }
            // отменяем отправку по умолчанию во избежание перезагрузки
            e.preventDefault();
    });
});
