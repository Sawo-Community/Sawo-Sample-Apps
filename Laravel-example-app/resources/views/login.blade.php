<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta content="IE=edge" http-equiv="X-UA-Compatible"/>
    <title>Sawo Auth</title>
    <style type="text/css">
    body{background-color:#f1f1f1}
    #sawo-container{background-color:#fff;display:flex;height:300px;width:300px;border:solid 1px #ddd;margin:auto;border-radius:1rem;padding:1rem 5rem}
    #sawo-message {text-align: center;padding: 1rem;font-size: 2rem;text-transform: uppercase;}
    .danger {color: red;}
    .success {color: green;}
</style>
</head>
<body>
    <!-- Package blade template -->
    @include('sawo::auth')
</body>
</html>
