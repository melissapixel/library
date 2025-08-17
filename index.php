<?php
    # Роутер
    
    if (isset($_GET['page'])){

        if ($_GET['page'] == 'page'){
            include 'snippets/page-index.php';
        }
        
        if ($_GET['page'] == 'news'){
            include 'snippets/news-index.php';
        }

        if ($_GET['page'] == 'edit'){
            include 'snippets/profile-index.php';
        }

        if ($_GET['page'] == 'personal'){
            include 'snippets/profile-index.php';
        }

        if ($_GET['page'] == 'hobby'){
            include 'snippets/profile-index.php';
        }

        if ($_GET['page'] == 'messages'){
            include 'snippets/messages-index.php';
        }

        if ($_GET['page'] == 'friends'){
            include 'snippets/friends-index.php';
        }

        if ($_GET['page'] == 'allfriends'){
            include 'snippets/allfriends-index.php';
        }

        if ($_GET['page'] == 'photos'){
            include 'snippets/photos-index.php';
        }

        if ($_GET['page'] == 'liter'){
            include 'snippets/book-main-index.php';
        }

        if ($_GET['page'] == 'write'){
            include 'snippets/book-write-index.php';
        }

        if ($_GET['page'] == 'mybook'){
            include 'snippets/book-mybook-index.php';
        }


        #=======================

        if ($_GET['page'] == 'add-photo'){
            include 'snippets/photos-add-photo.php';
        }

        if ($_GET['page'] == 'edit-status'){
            include 'snippets/profile-status.php';
        }

        if ($_GET['page'] == 'edit-personal'){
            include 'snippets/profile-update.php';
        }

        if ($_GET['page'] == 'add-dosug'){
            include 'snippets/profile-add-dosug.php';
        }

        if ($_GET['page'] == 'add-post'){
            include 'snippets/page-add-post.php';
        }

        if ($_GET['page'] == 'new-book'){
            include 'liter-pages/write/php/new/new-book.php';
        }

    } else{
        include 'main.php';
    }
?>