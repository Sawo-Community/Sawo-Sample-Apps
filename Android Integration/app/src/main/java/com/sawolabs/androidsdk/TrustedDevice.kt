package com.sawolabs.androidsdk

data class TrustedDevice(
    val trusted_id: String,
    val secondary_id: String,
    val device_id: String,
    val trusted_response: String
)
