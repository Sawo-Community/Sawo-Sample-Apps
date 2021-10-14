<!doctype html>
<html class="no-js" lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Welcome</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="manifest" href="site.webmanifest">
        <link rel="apple-touch-icon" href="icon.png">
    </head>
    <body>
    	<h1>Welcome {{ json_decode(session('user'), true)['identifier'] }}</h1>
    	<table border cellpadding="10px">
    	@foreach(json_decode(session('user')) as $key => $value)
    	<tr><td>{{ $key }}</td><td>{{ $value }}</td></tr>
    	@endforeach
    	</table>
    </body>
</html>
