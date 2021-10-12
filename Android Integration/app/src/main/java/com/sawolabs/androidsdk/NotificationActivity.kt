package com.sawolabs.androidsdk

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.biometric.BiometricPrompt
import com.google.gson.Gson
import io.sentry.Breadcrumb
import io.sentry.Sentry
import io.sentry.SentryLevel
import org.json.JSONObject
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

private const val TAG = "NotificationActivity"

class NotificationActivity : AppCompatActivity() {
    private lateinit var biometricPrompt: BiometricPrompt
    private lateinit var promptInfo: BiometricPrompt.PromptInfo
    private lateinit var yesBtn: Button
    private lateinit var noBtn: Button
    private lateinit var deviceInformationText: TextView
    private lateinit var additionalData: PushNotificationAdditionalData


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_notification)

        additionalData = Gson().fromJson(
            intent.getStringExtra(TRUSTED_DEVICE_NOTIFICATION_ADDITIONAL_DATA),
            PushNotificationAdditionalData::class.java
        )
        deviceInformationText = findViewById(R.id.textView)
        yesBtn = findViewById(R.id.button2)
        noBtn = findViewById(R.id.button3)
        deviceInformationText.text = getString(
            R.string.trusted_device_notification_activity_text_view_1_text,
            "${additionalData.secondary_device_brand}  ${additionalData.secondary_device_model}"
        )


        biometricPrompt =
            BiometricPromptUtils.createBiometricPrompt(this, ::processCancel, ::processSuccess)
        promptInfo = BiometricPromptUtils.createPromptInfo(this)

        biometricPrompt.authenticate(promptInfo)
    }

    private fun processCancel() {
        Toast.makeText(
            applicationContext,
            getString(R.string.trusted_device_notification_activity_biometric_cancel),
            Toast.LENGTH_LONG
        ).show()
    }

    private fun processSuccess(cryptoObject: BiometricPrompt.CryptoObject?) {
        yesBtn.visibility = View.VISIBLE
        noBtn.visibility = View.VISIBLE
        deviceInformationText.visibility = View.VISIBLE
        findViewById<TextView>(R.id.textView2).visibility = View.VISIBLE
    }

    fun callApi(view: View) {
        when (view.id) {
            R.id.button2 -> {
                callApiSecondaryDevice(true)
                finish()
            }
            R.id.button3 -> {
                callApiSecondaryDevice(false)
                finish()
            }
            else -> {
                throw RuntimeException("Unknown button pressed")
            }
        }
    }

    private fun callApiSecondaryDevice(userTrustedDevice: Boolean) {
        val sharedPref = getSharedPreferences(SHARED_PREF_FILENAME, Context.MODE_PRIVATE)
        val builder = HttpApiUtils.getRetrofitBuilder()
        val retrofit = builder.build()
        val secondaryTrustedDeviceApi = retrofit.create(SecondaryTrustedDeviceApi::class.java)
        val trustedDevice = TrustedDevice(
            additionalData.trusted_id,
            additionalData.secondary_id,
            sharedPref.getString(SHARED_PREF_DEVICE_ID_KEY, null).toString(),
            if (userTrustedDevice) "allowed" else "denied"
        )
        // SENTRY Tag and Breadcrumb
        val activity = this.javaClass.simpleName
        Sentry.setTag("activity", activity)


        val breadcrumb = Breadcrumb()
        breadcrumb.message = "Retrofit call for secondary trusted device"
        breadcrumb.level = SentryLevel.INFO
        breadcrumb.setData("Activity Name", activity)
        Sentry.addBreadcrumb(breadcrumb)

        val call = secondaryTrustedDeviceApi.sendTrustedResponse(trustedDevice)
        call.enqueue(object : Callback<Void> {
            override fun onResponse(call: Call<Void>, response: Response<Void>) {
                if (response.isSuccessful) {
                    if (userTrustedDevice) {
                        Toast.makeText(
                            this@NotificationActivity,
                            getString(R.string.trusted_device_notification_activity_device_authorized),
                            Toast.LENGTH_LONG
                        ).show()

                    } else if (userTrustedDevice) {
                        Toast.makeText(
                            this@NotificationActivity,
                            getString(R.string.trusted_device_notification_activity_device_rejected),
                            Toast.LENGTH_LONG
                        ).show()
                    }
                } else {
                    try {
                        Log.d(
                            TAG,
                            "SecondaryTrustedDeviceApi: Server responded with error ${JSONObject(
                                response.errorBody()!!.string()
                            )}"
                        )
                    } catch (e: Exception) {
                        Sentry.captureException(e)
                        Log.d(

                            TAG,
                            "SecondaryTrustedDeviceApi: Error in parsing server error response ${e.message}"
                        )
                    }
                }

            }

            override fun onFailure(call: Call<Void>, t: Throwable) {
                Log.d(TAG, "SecondaryTrustedDeviceApi: Error in requesting API ${t.message}")
            }
        })
    }
}
