https://haydenjames.io/
# Các lệnh để monitor hệ thống Linux
## 1. Lệnh Netstat

Lệnh netstat trên linux là một lệnh nằm trong số các tập lệnh để giám sát hệ thống trên linux. netstat giám sát cả chiều in và chiều out kết nối vào server, hoặc các tuyến đường route, trạng thái của card mạng. lệnh netstat rất hữu dụng trong việc giải quyết các vấn đề về sự cố liên quan đến network như là lượng connect kết nối, traffic, tốc độ, trạng thái của từng port, IP …

- Kiểm tra tổng quát

        netstat -a

- Kiểm tra các port đang sử dụng phương phức TCP

        netstat -at

- Kiểm tra các port đang sử dụng phương phức UDP

        netstat -au

- Kiểm tra các port đang ở trạng thái listening

        netstat -l

- Kiểm tra các port đang listen dùng phương thức TCP

        netstat -lt

- Kiểm tra các port đang listen dùng phương thức UDP

        netstat -lu

- Kiểm tra được port đang lắng nghe sử dụng dịch vụ gì

        netstat -plnt

- Hiển thị bảng định tuyến

        netstat -rn

- Kiểm tra những kết nối thông qua port 80

        netstat -an | grep :80 | sort

- Kiểm tra có bao nhiêu gói SYN_REC trên server. Đối với con số thì tùy thuộc vào server của bạn, ví dụ nếu mỏi ngày có tầm 20 đến 30 kết nối, bổng dưng một ngày lên cả 100 -> 1000 kết nối thì  -> server bị ddos.

        netstat -np | grep SYN_REC | wc -l

## 2. Lệnh ss

Công cụ ss được sử dụng để giúp chúng ta cách hiển thị tất cả các thông tin của socket mạng trong hệ thống Linux. Nó cho phép hiển thị thông tin như netstat và sẽ hiển thị nhiều thông tin trạng thái hơn các công cụ khác. Lệnh ss sẽ lấy thông tin trực tiếp từ kernel.

Lệnh ss cung cấp cho chúng ta các thông tin về:

- Tất cả các TCP sockets.
- Tất cả các UDP sockets.
- Tất cả các kết nối ssh/ftp/http/https.
- Tất cả các tiến trình được kết nối với máy chủ.
- Lọc trạng thái như: SYN-RECV, SYN-SENT,TIME-WAIT, địa chỉ port.

**Sử dụng:**

- Sử dụng lệnh `ss` không chứa các tùy chọn để liệt kê tất cả các kết nối bất kì ở tất cả các trạng thái.

        ss

- Sử dụng tùy chọn `-a` kết hợp với lệnh `ss` để hiển thị danh sách các listen socket và non-listen socket:

        ss -a

- Sử dụng lệnh `ss` với tùy chọn `-l` hiển thị các listen socket

        ss -l

- Lệnh `ss` giúp chúng ta hiển thị tất cả các kết nối bằng giao thức TCP bằng cách sử dụng tùy chọn `-t`

        ss -t

- Có thể kết hợp tùy chon `-l` với tùy chọn `-t` bên trên để hiển thị các listen TCP đang kết nối

        ss -lt

- Lệnh `ss` giúp chúng ta hiển thị tất cả các kết nối UDP socket bằng cách sử dụng tùy chọn `-u` và tùy chọn `-a`

        ss -ua

- Có thể kết hợp tùy chon `-l` với tùy chọn `-u` bên trên để hiển thị các listen UDP đang kết nối

        ss -lu

- Có thể hiển thị PID (ID của tiến trình) của các socket đang được kết nối chúng ta sử dụng tùy chọn `-p`

        ss -p

- Khi chúng ta muốn liệt kê tổng các trạng thái của socket trên máy chủ của chúng ta thì sử dụng lệnh `ss` với tùy chọn `-s`

        ss -s

- Để hiển thị các địa chỉ IPV4 của socket đang kết nối chúng ta sử dụng tùy chọn `-4`

        ss -4

- Để hiển thị các địa chỉ IPV6 của socket đang kết nối chúng ta sử dụng tùy chọn `-6`

        ss -6

- Lệnh `ss` cho phép chúng ta lọc socket port number hoặc address number. Để hiển thị tất cả các kết nối của socket đích hoặc socket nguồn của ssh chúng ta thực thi lệnh

        ss -at '( dport = :22 or sport = :22 )'

    hoặc

        ss -at '( dport = :ssh or sport = :ssh )'

## 3. Lệnh top

Lệnh top trong Linux được sử dụng để hiển thị tất cả các tiến trình đang chạy trong môi trường Linux.

![Imgur](https://i.imgur.com/fR23jYk.png)

Thông tin sau được hiển thị khi bạn chạy lệnh top trong Linux:

Dòng 1:
- Thời gian
- Máy tính đã chạy được bao lâu rồi
- Số lượng người dùng
- Trung bình tải
- Trung bình tải hiển thị thời gian load hệ thống trong 1, 5 và 15 phút cuối.

Dòng 2
- Tổng số nhiệm vụ
- Số lượng tác vụ đang chạy
- Số lượng tác vụ trong trạng thái “ngủ”
- Số lượng tác vụ đã dừng
- Số lượng tác vụ zombie (tiến trình không tồn tại)

Dòng 3
- Mức sử dụng CPU bởi người dùng theo tỷ lệ phần trăm
- Mức sử dụng CPU bởi hệ thống theo tỷ lệ phần trăm
- Mức sử dụng CPU bởi các tiến trình có mức ưu tiên thấp theo tỷ lệ phần trăm
- Mức sử dụng CPU bởi idle process (tiến trình cho biết bộ xử lý đang rảnh rỗi) theo tỷ lệ phần trăm
- Mức sử dụng CPU bởi io wait (thời gian CPU không hoạt động để chờ I/O disk hoàn thành) theo tỷ lệ phần trăm
- Mức sử dụng CPU bởi việc ngắt phần cứng theo tỷ lệ phần trăm
- Mức sử dụng CPU bởi việc ngắt phần mềm theo tỷ lệ phần trăm
- Mức sử dụng CPU bởi steal time (thời gian CPU ảo “chờ” CPU thực, trong khi bộ ảo hóa đang phục vụ bộ xử lý ảo khác) theo tỷ lệ phần trăm

Dòng 4
- Tổng bộ nhớ hệ thống
- Bộ nhớ trống
- Bộ nhớ đã sử dụng
- Bộ nhớ đệm buffer cache

Dòng 5
- Tổng swap có sẵn
- Tổng swap còn trống
- Tổng swap đã sử dụng
- Bộ nhớ khả dụng

(Swap là RAM ảo, được sử dụng khi bộ nhớ vật lý (RAM) bị đầy.)

**Bảng chính**
- ID tiến trình
- Người dùng
- Mức độ ưu tiên
- Mức độ nice (gọi một tập lệnh shell với mức độ ưu tiên cụ thể)
- Bộ nhớ ảo được sử dụng bởi tiến trình
- Bộ nhớ “thường trú” mà một tiến trình sử dụng (tức là tiến trình luôn ở trong bộ nhớ và không thể chuyển ra thiết bị lưu trữ khác)
- Bộ nhớ có thể chia sẻ
- CPU được sử dụng bởi tiến trình theo tỷ lệ phần trăm
- Bộ nhớ được sử dụng bởi tiến trình theo tỷ lệ phần trăm
- Thời gian tiến trình đã được chạy
- Lệnh

**Giữ lệnh top luôn chạy trong nền trên máy tính Linux:**

Bạn có thể dễ dàng giữ lệnh top luôn chạy mà không cần phải nhập lệnh vào terminal mỗi lần mở máy.

Để tạm dừng lệnh top và tiếp tục sử dụng terminal, nhấn CTRL + Z trên bàn phím.

Để đưa lệnh top trở lại foreground, hãy nhập `fg`.

**Các option:**

`-h` - Hiển thị phiên bản hiện tại

```
[root@localhost ~]# top -h
  procps-ng version 3.3.10
Usage:
  top -hv | -bcHiOSs -d secs -n max -u|U user -p pid(s) -o field -w [cols]
[root@localhost ~]# 
```

`-c` - Tham số này chuyển đổi trạng thái cột lệnh từ hiển thị lệnh sang hiển thị tên chương trình và ngược lại

`-d` - Chỉ định thời gian trễ khi refresh màn hình

Ví dụ: Refresh màn hình sau mỗi 5 giây:

    top -d 5

`-O` - Lấy danh sách các cột để sắp xếp theo thứ tự

    top -O | less

`-o` - Sắp xếp theo trường được đặt tên

Ví dụ:

    top -o %CPU


`-p` - Chỉ hiển thị các tiến trình với ID được chỉ định

Cú pháp:
    
    top -p <PID>

Ví dụ:
```
[root@localhost ~]# top -p 1
top - 14:27:06 up 33 min,  1 user,  load average: 0.00, 0.01, 0.02
Tasks:   1 total,   0 running,   1 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem :  1882188 total,  1626260 free,   104636 used,   151292 buff/cache
KiB Swap:  2097148 total,  2097148 free,        0 used.  1615240 avail Mem

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
    1 root      20   0  125424   3792   2572 S   0.0  0.2   0:01.04 systemd
```

`-u` - Chỉ hiển thị những tiến trình của người dùng được chỉ định

Ví dụ: 

    top -u root

`-i` - Không hiển thị các idle task

Chế độ xem mặc định trong top có thể hơi lộn xộn và nếu bạn chỉ muốn xem các tiến trình đang hoạt động (nghĩa là những tiến trình không ở chế độ idle - “nhàn rỗi”) thì bạn có thể chạy lệnh sau:

    top -i

Xem thêm: https://quantrimang.com/dung-lenh-top-linux-xem-tien-trinh-dang-chay-162613

## 4. Lệnh htop

### 4.1. Cài đặt:

Trên Ubuntu/Debian:

    apt-get install htop

Trên RHEL/CentOS:

    yum install epel-release

    yum install htop

### 4.2. Ưu điểm của lệnh htop:

- Hỗ trợ thao tác chuột
- Cho phép bạn cuộn cả chiều ngang và chiều dọc, để xem tất cả mọi tiến trình và hoàn thành các dòng lệnh
- Cho phép bạn kết thúc một quá trình mà không cần biết PID
- Bắt đầu nhanh hơn lệnh top
- Lệnh top yêu cầu bạn nhập PID hoặc giá trị ưu tiên để thay đổi mức ưu tiên hoặc gia hạn một tiến trình, còn htop thì không

### 4.3. Sử dụng:

Gõ lệnh

    htop

![Imgur](https://i.imgur.com/aqCEPPE.png)

**Các thành phần**

3 thành phần:

- Header: Phần header hiển thị các số liệu hệ thống bao gồm CPU, Ram, Swap, các tác vụ đang chạy, load average và thời gian hoạt động (Uptime).

![Imgur](https://i.imgur.com/IUS9qtd.png)

- Body: Phần này liệt kê tất cả các tiến trình đang chạy.

![Imgur](https://i.imgur.com/Ijd8X5I.png)

- Footer: Phần này hiển thị các tùy chọn menu của htop

![Imgur](https://i.imgur.com/9I8Yjx8.png)

**Hướng dẫn sử dụng:**

#### 4.3.1. Mức sử dụng CPU

![Imgur](https://i.imgur.com/pkInZQQ.png)

- Màu xanh dương: Tiến trình với mức ưu tiên thấp
- Màu xanh lá cây: Tiến trình người dùng
- Màu đỏ: Tiến trình kernel
- Màu vàng: Thời gian IRQ
- Màu đỏ tươi: Thời gian Soft IRQ
- Xám: Thời gian chờ IO

#### 4.3.2. Mức dùng bộ nhớ RAM

![Imgur](https://i.imgur.com/OOQkjpS.png)

- Màu xanh lá cây: Bộ nhớ đã sử dụng
- Màu xanh dương: Bộ nhớ đệm
- Màu vàng: Bộ nhớ cache

#### 4.3.3. Tải trung bình (Load average)

![Imgur](https://i.imgur.com/JFpX8BY.png)

Tải trung bình (Load average) là thước đo lượng công việc mà hệ thống thực hiện. Load average cho ta thấy được trung bình khối lượng công việc hệ thống phải xử lý trong mỗi khoảng thời gian 1 phút, 5 phút và 15 phút. Thông số load average còn phụ thuộc vào server có bao nhiêu CPU. Ví dụ server có một CPU có load average là 1.0 cho thấy sử dụng 100%.

#### 4.3.4. Thông tin tiến trình

![Imgur](https://i.imgur.com/f0pfSYq.png)

Htop sẽ liệt kê tất cả các tiến trình đang chạy trên hệ thống với thông tin về số lượng cpu, bộ nhớ mà mỗi tiến trình đang sử dụng cũng như lệnh được sử dụng để bắt đầu tiến trình.

- PID: Số ID của tiến trình.
- USER: Chủ sở hữu tiến trình.
- PR: Mức độ ưu tiên của tiến trình. Con số càng thấp, mức độ ưu tiên càng cao.
- NI: Giá trị nice value của tiến trình, ảnh hưởng đến mức độ ưu tiên của nó.
- VIRT: Tiến trình sử dụng bao nhiêu bộ nhớ ảo.
- RES: Tiến trình sử dụng bao nhiêu RAM vật lý, được đo bằng kilobyte.
- SHR: Bộ nhớ chia sẻ mà tiến trình đang sử dụng.
- S: Tình trạng hiện tại của tiến trình (zombied, sleeping, running, uninterruptedly sleeping, traced).
- %CPU: Tỷ lệ phần trăm CPU được sử dụng bởi tiến trình.
- %MEM: Tỷ lệ phần trăm RAM vật lý được sử dụng bởi tiến trình.
- TIME+: Tiến trình xử lý đã sử dụng bao nhiêu thời gian.
COMMAND: Tên của lệnh bắt đầu tiến trình.

### 4.3.5. Một số phím tắt

- Di chuyển dấu nhắc trong danh sách các tiến trình theo chiều dọc hoặc ngang bằng phím mũi tên
- Kill mộ tiến trình bằng cách nhấn phím F9
- Renice một tiến trình bằng cách nhấn phím F7 hoặc F8
- Liệt kê các tập tin được sử dụng bởi một tiến trình bằng cách nhấn phím I
- Chỉ hiển thị tiến trình của một người dùng bằng cách nhấn phím U
- Hiển thị các tiến trình được sắp xếp theo một cột bất kỳ bằng cách nhấn phím F6
- Hiển thị các tiến trình trong chế độ xem dạng cây bằng cách nhấn phím F5

### 4.3.6. Các tùy chọn

`–d` – delay (hiển thị độ trễ giữa các bản cập nhật, tính bằng 1/10 giây).

`–C` – no-color (chế độ đơn sắc)

`–h` – help (hiển thị thông báo trợ giúp và thoát)

`–u` – user=USERNAME (chỉ hiển thị các tiến trình của một người dùng nhất định)

`–h` – pid=PID (chỉ hiển thị các PID đã cho)

`–s` – sort-key COLUMN (Sắp xếp theo cột này)

`–v` – version (thông tin phiên bản đầu ra và thoát)

Xem thêm: https://haydenjames.io/htop-quick-guide-customization/

