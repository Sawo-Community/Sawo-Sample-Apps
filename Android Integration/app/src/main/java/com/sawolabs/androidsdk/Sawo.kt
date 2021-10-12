package com.sawolabs.androidsdk

import android.content.Context
import android.content.Intent

class Sawo(private val mContext:Context, private val apiKey: String, private val apiKeySecret: String) {
    fun login(identifierType: String, callBackClass: String) {
        val sawoWebSDKURL = "https://websdk.sawolabs.com/?apiKey=$apiKey&apiKeySecret=$apiKeySecret&identifierType=$identifierType&webSDKVariant=android"
        val intent = Intent(mContext, LoginActivity::class.java).apply {
            putExtra(SAWO_WEBSDK_URL, sawoWebSDKURL)
            putExtra(CALLBACK_CLASS, callBackClass)
        }
        mContext.startActivity(intent)
    }
}