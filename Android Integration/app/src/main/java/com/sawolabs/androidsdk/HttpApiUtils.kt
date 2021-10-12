package com.sawolabs.androidsdk

import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

object HttpApiUtils {
    private const val baseURL = "https://api.sawolabs.com/api/v1/"
    fun getRetrofitBuilder(): Retrofit.Builder {
        return Retrofit.Builder().baseUrl(baseURL)
            .addConverterFactory(GsonConverterFactory.create())
    }
}