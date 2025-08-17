<form id="form" action="#" method="POST" class="form-main">
                <!-- ДЛЯ РЕГИСТРАЦИИ -->
                <div id="register-form">
                    <label>
                        Имя пользователя:
                        <input type="text" name="username" value="">
                    </label><br>

                    <label>
                        Email:
                        <input type="email" name="email" value="">
                    </label><br>

                    <label>
                        Пароль:
                        <input type="password" placeholder="sad" name="password">
                    </label><br>

                    <label>
                        Повтор пароля:
                        <input type="password" name="password2">
                    </label><br>

                    <button type="submit">Зарегистрироваться</button>
                    <div class="form-another">
                        <a id="to-login" href="#">Или войти</a>
                    </div>
                </div>
                

                <!-- ДЛЯ АВТОРИЗАЦИИ -->
                <div id="login-form" style="display:none">
                    <label>Email:
                        <input type="email" name="email" />
                    </label><br />

                    <label>Пароль:
                        <input type="password" name="password" />
                    </label><br />

                    <button type="submit">Войти</button>

                    <div class="form-another">
                        <a href="#" id="to-register">Регистрация</a>
                    </div>
                </div>
            </form>