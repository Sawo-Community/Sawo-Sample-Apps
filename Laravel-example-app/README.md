# Sawo PHP SDK

[![Current version](https://img.shields.io/packagist/v/sawolabs/sawo-laravel.svg?logo=composer)](https://packagist.org/packages/sawolabs/sawo-laravel)
[![Supported PHP version](https://img.shields.io/static/v1?logo=php&label=PHP&message=%5E7.2|~8.0.0&color=777bb4)](https://packagist.org/packages/sawolabs/sawo-laravel)

## Table of Contents

- [Overview](#overview)
- [Installation](#installation)
- [License](#license)

## Overview

[Sawo](https://sawolabs.com/) provides the api and infrastructure you need to authenticate your users in PHP.

For more information, visit the [Sawo SDK documentation](https://docs.sawolabs.com/sawo/).

## Installation

To get started with Sawo, use the Composer package manager to add the package to your project's dependencies:

```bash
$ composer require sawolabs/sawo-laravel
```
## Configuration

Before using Sawo, you will need to add credentials for the your application. These credentials should be placed in your application's ```config/sawo.php``` configuration file.

```
'api_key' => env('SAWO_API_KEY', ''),
'api_secret_key' => env('SAWO_SECRET_KEY', ''),
'identifier_type' => env('SAWO_IDENTIFIER_TYPE', 'email'),
'redirect_url' => env('SAWO_REDIRECT', ''),
```

or same can be configured in .env

```
SAWO_API_KEY=<YOUR_SAWO_API_KEY_HERE>
SAWO_SECRET_KEY=<YOUR_SAWO_SECRET_KEY_HERE>
SAWO_IDENTIFIER_TYPE=phone_number_sms
SAWO_REDIRECT=https://yourdomain.com/sawo/callback
```
## Add Sawo login form to blade template
Include the following include part in your login blade template to show Sawo Auth dialog

```
@include('sawo::auth')
```

## Verifying User Token

``` php
use SawoLabs\Laravel\Sawo;

Route::get('/sawo/callback', function () {
    $userData = $request->only('user_id', 'created_on', 'identifier', 'identifier_type', 'verification_token');

    $isVerified = Sawo::validateToken($userData['user_id'], $userData['verification_token']);

    // If user is identifying via phone
    if ('phone_number_sms' == $userData['identifier_type']) {
        $user = User::where('phone', $userData['identifier'])->first();
    } elseif ('email' == $userData['identifier_type']) {
        $user = User::where('email', $userData['identifier'])->first();
    }

    if (empty($user)) {
        $user = new \App\Models\User();
        $user->phone = $userData['identifier'];
        $user->email = $userData['identifier'];
        $user->password = bcrypt($userData['verification_token']);
    }
    
});

```

## Example Project [link](https://github.com/sawolab/laravel-example)


## License

Sawo SDK is licensed under the [MIT License](LICENSE).
