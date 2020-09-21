# TH VoLTE/VoWiFi Enabler for Pixel 3/3a/4 (including XL variant)

Systemlessly activates __VoLTE__ (Voice over LTE) and  __VoWiFi__ (Voice over Wi-Fi) on Thai carriers:

* __AIS__ (Advanced Wireless Network)
* __DTAC__ (dtac TriNet)
* __TRUE-H__ (True Move H Universal Communication)

Now support Android 10 and Android 11!


## Prerequisite

Activate VoLTE (HD Voice/4G Calling) + VoWiFi (WiFi Calling) services with your carrier first, by inserting SIM card into any phone listed in supported models on the website and activate via the USSD or call centre.

* [https://www.ais.co.th/4g/volte/](https://www.ais.co.th/4g/volte/) - AIS / Call: 1175
* [https://www.dtac.co.th/network/4g-volte.html](https://www.dtac.co.th/network/4g-volte.html) - dtac / Call: 1678
* [http://truemoveh.truecorp.co.th/news/detail/95](http://truemoveh.truecorp.co.th/news/detail/95) - TRUE-H / Call: 1242

Have a test and make sure that they are working then you are good to go!


## VoLTE/VoWiFi Activation

It is mandatory to [have your Pixel rooted with Magisk](https://www.xda-developers.com/google-pixel-4-root-magisk/) to install this module.
Make sure that Magisk is installed properly on your system then proceed with these steps:

1. __Install__ this module on Magisk and __reboot__ the system.
2. After rebooting, __the phone may be showing "No service"__ due to the parsing of new configurations, so, please wait until the operator name showed up.
2. Go to __Settings -> Network and Internet -> Mobile network__ and __enable__ __*"Enhanced 4G LTE Mode"*__ and __*"Wi-Fi calling"*__.
3. __Turn off__ Wi-Fi
4. Go to __Phone -> dial \*#\*#4636#\*#\*__ -> Phone information, tap at the top-right button, __select *"IMS Service Status"*__.
4. Check if __IMS Registration__ is __Registered__ and __Voice over LTE__ is __Available__ then, congrats, you're succeeded.

(Voice over Wi-Fi will be activated upon the *"Wi-Fi calling"* option in 2.)

## VoLTE/VoWiFi Deactivation

1. __Uninstall__ the module from Magisk
2. __Delete__ all the folders in /data/vendor that begin with modem
3. __Reboot__ your Pixel.

## Downloads

#### [__v1.1-20200922__ (latest release)](https://github.com/thongtech/voenabler-th-p3/releases/download/v1.1-20200922/voenabler-th-p3-v1.1-20200922.zip)

## OTA updates

To keep VoLTE/VoWiFi working, after every OTA, __re-install the module__ by uninstalling then install the module again.

## Notes

* This module also enables LTE 3CA (Carrier Aggregation) for AIS and TRUE-H on Pixel 4/4XL

## Update History

#### v1.1-20200922
* Support for Android 11

#### v1.00-20200303
* First release

## Acknowledgments

Thanks to : [nooriro](https://github.com/Magisk-Modules-Repo/volte-kr-crosshatch/), [Occy](https://m.cafe.naver.com/CommentView.nhn?search.clubid=26545115&search.articleid=159482&search.refcommentid=34700816&search.commentid=34700816&search.menuid=454&search.focus=true&search.showCafeHome=true&search.perPage=5#focusing) and [Chinese developers](https://www.google.com/search?newwindow=1&q=fdr_check)
