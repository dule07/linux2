# Bật plugin inputs.procstat. Bench bằng siege

Sửa file `/etc/telegraf/telegraf.conf`

    nano /etc/telegraf/telegraf.conf

Sửa 2 dòng

    [[inputs.procstat]]
    pattern = ".*"

![Imgur](https://i.imgur.com/j3JOrdY.png)

    systemctl restart telegraf.service

Kiểm tra trên grafana

![Imgur](https://i.imgur.com/VHYM1m2.png)

Thêm agent là 1 con wordpress có IP 10.10.34.174

Query như sau: (Hiển thị các tiến trình dùng ram, nếu muốn hiển thị theo đơn vị byte thì chọn field `memory_rss` thay cho `memory_usage`

![Imgur](https://i.imgur.com/mBTHlXT.png)

Chỉnh sửa hiển thị. Đơn vị %

![Imgur](https://i.imgur.com/AAzdVl5.png)

Hiển thị thông số hiện tại, và thêm bảng bên cạnh

![Imgur](https://i.imgur.com/2TPUF5X.png)

Vẽ 2 đồ thị hiển thị % cpu tương tự với field `cpu_usage`

![Imgur](https://i.imgur.com/thh0KyV.png)

![Imgur](https://i.imgur.com/xw3D1SL.png)

Đứng trên 1 máy khác, Dùng siege đẩy tải trang wp: 

![Imgur](https://i.imgur.com/rBnMxxI.png)

https://www.tecmint.com/load-testing-web-servers-with-siege-benchmarking-tool/

https://github.com/danghai1996/thuctapsinh/blob/master/HaiDD/Monitor/CommandMonitor/siege.md

    siege 10.10.34.174

Kết quả: tiến trình mysqld sử dụng nhiều CPU hơn

![Imgur](https://i.imgur.com/jKSlbKy.png)

![Imgur](https://i.imgur.com/zauwpIl.png)