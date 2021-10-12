package com.sawolabs.androidsdk

import retrofit2.Call
import retrofit2.http.Body
import retrofit2.http.Headers
import retrofit2.http.POST

interface SecondaryTrustedDeviceApi {
    @Headers("content-type: application/json")
    @POST("secondary_trusted_device/")
    fun sendTrustedResponse(
        @Body TrustedDevice: TrustedDevice
    ): Call<Void>
}
