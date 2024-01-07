<!doctype html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>@yield('title')</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        .fs-2 {
            margin-left: 200px; /* Редактируем отступ справа */
        }
        a {
            color: white; /* Устанавливаем белый цвет для текста ссылки */
            margin-right: 200px;
        }
    </style>
</head>
<body class="bg-dark text-white">
<header class="border-bottom lh-2 py-4 d-flex justify-content-between align-items-center">
    <div class="fs-2 col-13 text-center"><a href="/" class="text-decoration-none"><b>МАГАЗИН ПРЕДМЕТОВ РОСКОШИ</b></a></div>
    <a href="/home" class="fs-5 text-decoration-none">Личный кабинет</a>
</header>

<div class="container">
    @yield('main')
</div>

</body>
</html>
