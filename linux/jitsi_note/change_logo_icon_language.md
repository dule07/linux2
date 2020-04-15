# Jitsi - Hướng dẫn đổi ngôn ngữ mặc định, đổi logo, favico trên 

## Hướng dẫn đổi ngôn ngữ mặc định

Vào thư mục `/etc/jitsi/meet/`, backup file `<domain>-config.js`. Ở đây domain của tôi là `jitsi.dangdohai.xyz` nên sẽ có file `jitsi.dangdohai.xyz-config.js`

    cp jitsi.dangdohai.xyz-config.js jitsi.dangdohai.xyz-config.js.bak

Đổi ngôn ngữ mặc định thành tiếng Việt

Vào file jitsi.dangdohai.xyz-config.js tìm đến dòng 256. Đổi `defaultLanguage: 'en'` thành `defaultLanguage: 'vi'`. Hoặc chạy lệnh:

    sed -i 's|defaultLanguage: 'vi',|defaultLanguage: 'en',|g' /etc/jitsi/meet/jitsi.dangdohai.xyz-config.js

Mở trình duyệt ẩn danh và kiểm tra lại kết quả.

Ngôn ngữ tiếng Việt trên đây được dịch chưa kỹ lắm. Nếu muốn bạn có thể sửa đổi các câu chữ theo ý bạn tại file `/usr/share/jitsi-meet/lang/main-vi.json`

    cp /usr/share/jitsi-meet/lang/main-vi.json /usr/share/jitsi-meet/lang/main-vi.json.bak
    vi /usr/share/jitsi-meet/lang/main-vi.json

Xem nội dung của file này ở đây: https://github.com/jitsi/jitsi-meet/blob/master/lang/main-vi.json

Để sửa đổi hiển thị thông báo mời vào cuộc họp.

![Imgur](https://i.imgur.com/cVln6B1.png)

Đổi lại một số title trong file `/usr/share/jitsi-meet/title.html` tùy ý bạn:

    vi /usr/share/jitsi-meet/title.html

Kết quả:

![Imgur](https://i.imgur.com/o5Dvl1z.png)

Bổ sung thêm text Vận hành bởi cloud365:

    cp /usr/share/jitsi-meet/css/all.css /usr/share/jitsi-meet/all.css.bak
    vi /usr/share/jitsi-meet/css/all.css


Sửa css bổ sung thêm đoạn sau vào cuối file (chỗ này đã minify)

    .watermark::after{content:"Hạ tầng vận hành bởi Cloud365";color:#fff;font-weight:400;position:relative;left:.1rem;top:3.2rem}
    #largeVideoContainer > div:nth-child(3) > a > .watermark::after{left: -0.3rem}
    .leftwatermark{height: 3rem;}

Sửa file `/usr/share/jitsi-meet/index.html`. 

    vi /usr/share/jitsi-meet/index.html

Tại dòng số 9, tăng thêm 1 số. Ví dụ:

    "css/all.css?v=3729" sửa thành "css/all.css?v=3730"

## Đổi logo

Logo của Cloud365: https://cloud365.vn/images/logo-white.png
 
Thay thế logo của ta vào file `/usr/share/jitsi-meet/images/watermark.png`

    cp /usr/share/jitsi-meet/images/watermark.png /usr/share/jitsi-meet/images/watermark.png.bak
    cd /usr/share/jitsi-meet/images/
    wget https://cloud365.vn/images/logo-white.png -O watermark.png

## Đổi favico

Favicon của Nhân Hòa: https://cloud365.vn/images/favicon.ico

Thay thế favico của ta vào file `/usr/share/jitsi-meet/images/favicon.ico`

    cd /usr/share/jitsi-meet/images/
    mv favicon.ico favicon.ico.bak
    wget https://cloud365.vn/images/favicon.ico -O favicon.ico