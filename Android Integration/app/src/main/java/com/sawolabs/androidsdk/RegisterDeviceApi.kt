package com.sawolabs.androidsdk

import retrofit2.http.POST
import retrofit2.Call
import retrofit2.http.Body
import retrofit2.http.Headers

interface RegisterDeviceApi {
    @Headers("content-type: application/json")
    @POST("register_device/")
    fun sendDeviceData(
        @Body device: Device
    ):Call<Void>
}