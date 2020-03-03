# TH VoLTE/VoWiFi Enabler for Pixel 3/3a/4 (including XL variant)

Systemlessly activates __VoLTE__ (Voice over LTE) and  __VoWiFi__ (Voice over Wi-Fi) on Thai carriers:

* __AIS__ (Advanced Wireless Network)
* __DTAC__ (dtac TriNet)
* __TRUE-H__ (True Move H Universal Communication)


## Prerequisite

Activate your VoLTE/VoWiFi service with your carrier first, by inserting SIM card into any phone listed in supported models on the website and activate via the USSD or call centre.

* [https://www.ais.co.th/4g/volte/](https://www.ais.co.th/4g/volte/) - AIS / Call: 1175
* [https://www.dtac.co.th/network/4g-volte.html](https://www.dtac.co.th/network/4g-volte.html) - dtac / Call: 1678
* [http://truemoveh.truecorp.co.th/news/detail/95](http://truemoveh.truecorp.co.th/news/detail/95) - TRUE-H / Call: 1242

Have a test and make sure that they are working then you are good to go!


## VoLTE/VoWiFi Activation

It is mandatory to [have your Pixel rooted with Magisk] (https://www.xda-developers.com/google-pixel-4-root-magisk/) to install this module.
Make sure that Magisk is installed properly on your system then proceed with these steps:

1. __Install__ this module on Magisk and __reboot__ the system.
2. After reboot, go to __Settings -> Network and Internet -> Mobile network__ and __enable__ __*"Enhanced 4G LTE Mode"*__ and __*"Wi-Fi calling"*__.
3. __Turn off__ Wi-Fi
4. Go to __Phone -> dial \*#\*#4636#\*#\*__, tap at the top-right button, __select *"IMS Service Status"*__.
4. Check if __IMS Registration__ is __Registered__ and __Voice over LTE__ is __Available__ then, congrats, you're succeeded.

(Voice over Wi-Fi will be activated upon the *"Wi-Fi calling"* option in 2.)

## VoLTE/VoWiFi Deactivation

1. __Uninstall__ the module from Magisk and __reboot__ your Pixel.

## Update History

#### v1.00-20200303
* First release

## Acknowledgments

Thanks to : [nooriro](https://github.com/Magisk-Modules-Repo/volte-kr-crosshatch/), [Occy](https://m.cafe.naver.com/CommentView.nhn?search.clubid=26545115&search.articleid=159482&search.refcommentid=34700816&search.commentid=34700816&search.menuid=454&search.focus=true&search.showCafeHome=true&search.perPage=5#focusing) and [Chinese developers](https://www.google.com/search?newwindow=1&q=fdr_check)
