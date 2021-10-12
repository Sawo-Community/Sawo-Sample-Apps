package com.sawolabs.androidsdk

data class Device(
    val device_token:String,
    val device_id:String,
    val device_brand:String,
    val device_model: String,
    val device_name:String ,
    val sdk_variant:String
)