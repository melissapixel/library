<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link type="image/x-icon" rel="shortcut icon" href="res/img/logo/eed8665e91158578e7ecb5abcdf5017c.jpg">
    <title>Bibliteka</title>
    <link rel="stylesheet" href="res/css/style.css">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Funnel+Display:wght@300..800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Russo+One&display=swap" rel="stylesheet">

</head>
<body>
    <?PHP include 'src/conn.php' ?>
    <div class="container-main">

        <div class="main-empty"></div>

        <div class="main-form">

            <?php include 'chanks/main_form.php' ?>

        </div>
        
    </div>

    <?php include 'chanks/main_about_book.php' ?>


    <?php include 'chanks/main_advice_book.php' ?>


    <script src="controllers/show_reg_log.js"></script>
</body>
</html>