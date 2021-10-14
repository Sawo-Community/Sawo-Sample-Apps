<?php

return [
    /*
    |--------------------------------------------------------------------------
    | Configure Sawo defaults
    |--------------------------------------------------------------------------
    |
    | Supported Identifier Types: "phone_number_sms", "email"
    |
    */

    'api_key' => env('SAWO_API_KEY', ''),

    'api_secret_key' => env('SAWO_SECRET_KEY', ''),

    'identifier_type' => env('SAWO_IDENTIFIER_TYPE', 'email'),

    'redirect_url' => env('SAWO_REDIRECT', ''),
];
