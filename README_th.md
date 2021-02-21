# โมดูลเปิด VoLTE/VoWiFi สำหรับ Pixel 3/3a/4 (รวมถึงรุ่น XL)

Magisk Module สำหรับเปิดใช้งาน __VoLTE__ (Voice over LTE) และ __VoWiFi__ (Voice over Wi-Fi) บนเครือข่ายในประเทศไทย

* __AIS__ (Advanced Wireless Network)
* __DTAC__ (dtac TriNet)
* __TRUE-H__ (True Move H Universal Communication)
* __MVNOs__ ที่ใช้งานโครงข่าย AIS/DTAC/TRUE-H บนอุปกรณ์ที่รองรับ

รองรับทั้ง Android 10 และ Android 11


## เปิดใช้งานกับเครือข่าย

ใส่ซิมการ์ดในเครื่องรุ่นที่รองรับโดยผู้ให้บริการ เพื่อทำการเปิดใช้งานบริการ (ผ่านการกดเลข USSD หรือผ่านคอลเซ็นเตอร์)

* [https://www.ais.co.th/4g/volte/](https://www.ais.co.th/4g/volte/), [https://www.ais.co.th/4g/vowifi/](https://www.ais.co.th/4g/vowifi/) - AIS / โทร: 1175
* [https://www.dtac.co.th/network/4g-volte.html](https://www.dtac.co.th/network/4g-volte.html), [https://www.dtac.co.th/network/wifi-calling.html](https://www.dtac.co.th/network/wifi-calling.html) - dtac / โทร: 1678
* [http://truemoveh.truecorp.co.th/news/detail/95](http://truemoveh.truecorp.co.th/news/detail/95), [https://truemoveh.truecorp.co.th/news/detail/473](https://truemoveh.truecorp.co.th/news/detail/473) - TRUE-H / โทร: 1242

จากนั้นให้ทดสอบโทรออกผ่าน 4G และ Wi-Fi เพื่อให้แน่ใจว่าสามารถใช้บริการได้แล้ว


## เปิดใช้งานบนตัวเครื่อง

ก่อนอื่นคือต้องทำการ [Root เครื่อง Pixel ด้วย Magisk](https://www.xda-developers.com/google-pixel-4-root-magisk/) ก่อน จึงจะสามารถติดตั้งโมดูลนี้ได้นะครับ

1. __ติดตั้งโมดูลนี้__ (ไฟล์ zip) ใน Magisk แล้ว __รีบูท__ เครื่อง
2. หลังจากรีบูทแล้ว, __โทรศัพท์อาจขึ้นว่า "ไม่มีบริการ"__ เนื่องจากระบบกำลังประมวลผลการตั้งค่าใหม่อยู่ ให้รอจนกว่าชื่อเครือข่ายกลับมาครับ
2. ไปที่เมนู __Settings -> Network and Internet -> Mobile network__ แล้ว __เปิดใช้งาน__ __*"Enhanced 4G LTE Mode"*__ และ __*"Wi-Fi calling"*__
3. __ปิด__ Wi-Fi
4. ไปที่เมนู __โทรศัพท์ -> กด \*#\*#4636#\*#\*__ -> Phone information แล้วกดที่ปุ่มบนสุด-ขวามือ __เลือก *"IMS Service Status"*__
4. เช็คว่าถ้า __IMS Registration__ เป็น __Registered__ แล้ว และ __Voice over LTE__ เป็น __Available__ เป็นอันเสร็จสมบูรณ์ ใช้งานได้แล้วครับ

(Voice over Wi-Fi จะถูกเปิดใช้งานตามตัวเลือก *"Wi-Fi calling"* ในข้อ 2.)

## ยกเลิก/ปิดการใช้งาน

1. __ถอนการติดตั้งโมดูล__ จากแอพ Magisk
2. __ลบโฟลเดอร์ทั้งหมด__ ใน /data/vendor ที่ขึ้นต้นด้วย modem
3. __รีบูทเครื่อง__

## ดาวน์โหลด

#### [__v1.1-20200922__ (เวอร์ชั่นล่าสุด)](https://github.com/thongtech/voenabler-th-p3/releases/download/v1.1-20200922/voenabler-th-p3-v1.1-20200922.zip)

## อัพเดท OTA

หลังการอัพเดท OTA ทุกครั้ง ให้ถอนการติดตั้งและติดตั้งโมดูลเข้าไปใหม่ เพื่อให้ใช้งาน VoLTE/VoWiFi ได้ต่อเนื่องครับ

## หมายเหตุ

* โมดูลตัวนี้จะช่วยเปิด 4G 3CA (การรวมคลื่น) ของ AIS และ TRUE-H บน Pixel 4/4XL ให้ด้วยครับ

## ประวัติการอัพเดท

#### v1.1-20200922
* รองรับ Android 11

#### v1.00-20200303
* เวอร์ชั่นแรก

## ขอขอบคุณ

[nooriro](https://github.com/Magisk-Modules-Repo/volte-kr-crosshatch/), [Occy](https://m.cafe.naver.com/CommentView.nhn?search.clubid=26545115&search.articleid=159482&search.refcommentid=34700816&search.commentid=34700816&search.menuid=454&search.focus=true&search.showCafeHome=true&search.perPage=5#focusing) และ [Chinese developers](https://www.google.com/search?newwindow=1&q=fdr_check)
