package com.sawolabs.androidsdk

import android.app.Application
import android.content.Intent
import com.onesignal.OneSignal

//change the app id accordingly
const val ONESIGNAL_APP_ID = "25f5431e-5523-4a96-8c6f-d6957424b19d"

class ApplicationClass : Application() {
    override fun onCreate() {
        super.onCreate()

        // Logging set to help debug issues, remove before releasing your app.
        // OneSignal.setLogLevel(OneSignal.LOG_LEVEL.VERBOSE, OneSignal.LOG_LEVEL.NONE)

        // OneSignal Initialization
        OneSignal.initWithContext(this)
        OneSignal.setAppId(ONESIGNAL_APP_ID)

        OneSignal.setNotificationOpenedHandler { result ->
            val intent = Intent(this, NotificationActivity::class.java).apply {
                putExtra(
                    TRUSTED_DEVICE_NOTIFICATION_ADDITIONAL_DATA,
                    result.notification.additionalData.toString()
                )
                flags = Intent.FLAG_ACTIVITY_REORDER_TO_FRONT or Intent.FLAG_ACTIVITY_NEW_TASK
            }
            this.startActivity(intent)
        }
    }
}
