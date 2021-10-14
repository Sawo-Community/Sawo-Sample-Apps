<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Log;
use SawoLabs\Laravel\Sawo;

class SawoController extends Controller
{
    /**
     * Login page for Sawo.
     *
     * @param Request $request Request data
     */
    public function index(Request $request)
    {
        return view('login');
    }

    /**
     * Authenticate user.
     *
     * @param Request $request [description]
     *
     * @return [type] [description]
     */
    public function loginCallback(Request $request)
    {
        $userData = $request->only('user_id', 'created_on', 'identifier', 'identifier_type', 'verification_token');
        Log::info(json_encode($userData));

        $verified = Sawo::validateToken($userData['user_id'], $userData['verification_token']);

        if (false == $verified) {
            return redirect('/');
        }
        session(['user' => json_encode($userData)]);

        // If user is identifying via phone
        // if ('phone_number_sms' == $userData['identifier_type']) {
        //     $user = User::where('phone', $userData['identifier'])->first();
        // } elseif ('email' == $userData['identifier_type']) {
        //     $user = User::where('email', $userData['identifier'])->first();
        // }
        // if (!$user) {
        //     $user = User::factory()->create([
        //         'name' => $userData['identifier'],
        //         'email' => $userData['identifier'],
        //         'phoen' => $userData['identifier'],
        //         'password' => bcrypt($userData['verification_token']),
        //     ]);
        // }

        // if ($user) {
        //     Auth::login($user);
        // } else {
        //     abort(500);
        // }

        return redirect()->route('home');
    }
}
