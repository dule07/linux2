# Tìm hiểu về check_mk

## Checklist

https://github.com/meditechopen/meditech-ghichep-omd#1

https://github.com/duckmak14/thuctapsinh/tree/master/DucNA/check_mk/docs

## Tài liệu

https://check-mk-documentation.readthedocs.io/en/latest/index.html

## Lịch sử

Năm 2008 check_mk được ra mắt như là một plugins hỗ trợ và bổ sung thêm cho lõi nagios. Để có thể giúp cho giải pháp nagios hoàn thiện hơn các nhược điểm mà nagios còn mắc phải

Năm 2010 dự án OMD (Open Monitoring Distribution) được khởi động bởi Mathias Kettner. Đã kết hợp nhiều sản phẩm để có thể tạo ra sự linh hoạt trong giám sát hơn. Lúc đó có 2 phiên bản distro của OMD là OMD-LABS và CHECK_MK RAW ( OMD thường) . OMD sử dụng nhân là nagios kết hợp thêm nhiều sản phẩm mã nguồn mở để tạo ra một sản phẩm tối ưu cho nhu cầu giám sát, cảnh báo và hiển thị

Năm 2015 phiên bản đơn giản của OMD đã được ra mắt gọi là CHECK_MK vào lúc đó có 2 phiên bản của là: CHECK_MK RAW EDITION(CRE) và CHECK_MK ENTERPRISE EDITION(CEE). Hiện nay có thêm một phiên bản mới phiên bản này dựa trên phiên bản CEE được gọi là Checkmk Managed Services Edition.

## Phân biệt OMD-LABS và OMD(check_mk)

- OMD là một phiên bản nhỏ của OMD-LABS nó tập chung chủ yếu vào việc phát triển check_mk.
- OMD-LABS là phiên bản nâng cấp của OMD nên nó có thêm một số sản phẩm mã nguồn mở khác được tích hợp ví dụ như : Naemon; Icinga2; Grafana/Influxdb …
- Trang web mặc định của OMD-LABS là Thruk
- Từ phiên bản OMD-LABS 3.0 trở đi đã remove một số phần mềm là: Nagios3; Icinga 2, Check_mk, Nagvis

## Checkmk là gì?

Là một giải pháp giám sát dựa trên mã nguồn mở. Có lõi là nagios core. 

Check_mk được tạo ra với mục đích giải bài toán hiệu năng cho nagios. Giúp cho việc mở rộng hệ thống giám sát dễ dàng hơn.

Với tính năng được tích hợp với nhiều sản phẩm thì check_mk được cấu hình đơn giản hơn nhiều so với lõi nagios trước kia. Check_mk bổ sung thêm một số chức năng:

- Thời gian check tiêu chuẩn được giảm từ 5 phút xuống 1 phút
- Có thể cấu hình bằng giao diện WEB
- Có chức năng giám sát phân tán
- Có bảng điều khiển
- Có bảng thống kê số liệu
- Có biểu đồ hiển thị
- v.v…

## Các phiên bản và tính năng

Đến thời điểm hiện tại thì nagios có 3 phiên bản chính và có sẵn

- Check_MK Raw Edition (CRE)
- Check_MK Enterprise Edition (CEE), gồm:
    - Checkmk Enterprise - Free Edition
    - Checkmk Enterprise - Standard Edition
    - Checkmk Managed Services Edition (CME)


![Imgur](https://i.imgur.com/xVDEiCl.png)

[So sánh cụ thể các phiên bản](https://checkmk.com/editions.html)


Phiên bản Check_MK Raw Edition (CRE) là phiên bản mã nguồn mở và hoàn toàn miễn phí. Phiên bản Checkmk Enterprise - Free Edition giới hạn chỉ giám sát 2 site, 10 host mỗi site. 2 phiên bản còn lại chúng ta sẽ phải trả tiền nếu muốn sử dụng nó.

Chúng ta sẽ đi tìm hiểu và làm việc với phiên bản miễn phí là CRE. Và phiên bản stable hiện tại là phiên bản 1.6. Chu kỳ phát triển của check_mk là 6 tháng sẽ có một bản stable.

## Các khái niệm trong check_mk

1. Livestatus

- Là một phần quan trọng của check_mk. Nó giúp check_mk truy xuất dữ liệu một cách nhanh nhất.
- Không truy xuất dữ liệu được đọc theo tốc độ I/O của disk bởi vì nó sẽ không lưu trữ thông tin trạng thái ở file.
- Khi truy xuất nó phân biệt chữ hoa và trữ thường. Cú pháp của livestatus dựa trên giao thức HTTP
- Livestatus sẽ sử dụng một socket để lấy dữ liệu từ phía host và service

2. Livecheck

- Trước khi có livecheck thì mỗi khi kiểm tra dịch vụ sẽ chỉ thực hiện trên một core của CPU.
- Sau khi có livecheck thì mỗi khi kiểm tra dịch vụ sẽ không chỉ một CPU làm việc mà được phân tán trên tất cả các core của CPU.

3. Multisite

- Là GUI web được check_mk áp dụng để hiển thị thông tin trạng thái giám sát. Nó dựa trên livestatus nên hoạt động rất nhanh.

4. WATO (Web admininstration tools)

Sử dụng để cấu hình check_mk. 

Wato bao gồm nhiều modules. Mỗi modules có một chức năng khác nhau. Một số module phổ biến:
- Main menu : chứa danh sách tất cả các loại modules cùng với một miêu tả ngắn cách dùng
- Monitoring Agents : Tại đây sẽ tìm thấy các agent cho linux windowns và cách hệ điều hành khác
- Host : Quản lý các host được theo dõi
- Global Settings : Những cài đặt không áp dụng cho host; service và users
- Host & Service Parameters : danh sách tất cả các cài đặt giám sát về host và service

Khi thay đổi bằng WATO thì giám sát sẽ chưa thực hiện vai trò của mình ngay lập tức. Mà sau khi nhấn nút Activate changes mới thực hiện thay đổi và mới bắt đầu thực hiện giám sát.

5. Event console

- Ngoài việc check trạng thái theo lịch trình thì cũng có một kiểu check trạng thái theo sự việc xảy ra ( ví dụ như là việc có một host bị down)
- Đối với event console thì check_mk có một hệ thống tích hợp để theo dõi sự kiện từ các nguồn như là syslog, SNMP traps, log file.
- Những event xảy ra không được xử lý bởi lõi giám sát mà sẽ được sử dụng bởi dịch vụ riêng

6. Site

- Trên một server có thể tạo ra nhiều site để có thể phân chia các khu vực giám sát dành cho một hệ thống lớn.
- Muốn có một WATO để có thể quan sát thì ta phải tạo ra một site để có thể sử dụng WATO
- Với mỗi user có quyền khác nhau đối với 1 Site giám sát. Quyền cao nhất là user omdadmin có quyền quản lý
- Có 3 cấu của các user được chia như sau
    - adminstrator
    - Guest user
    - Normal monitoring user

7. RRD (Round Robin Database)

- Đây là dạng DB mặc định mà khi check_mk lưu dữ liệu vào.
- Dung lượng của DB này đã được định sẵn từ trước Khi mà nó đầy dữ liệu thì nó sẽ ghi đè lên dữ liệu được ghi đầu tiên
- Có thể tích hợp dung lượng trong một khoảng thời gian nào đó vào làm một.
- Có thể truy vấn được dữ liệu trong RRD bằng live status language.
- Dữ liệu trong Round Robin được lưu thành các bảng và các cột
- Dữ liệu có thể hợp nhất lại thành một để có thể giải quyết được vấn đề là muốn quan sát dữ liệu trong một khoảng thời gian dài như là một năm

![Imgur](https://i.imgur.com/4hTcTSF.png)

8. Live status language

- Là ngôn ngữ để truy vấn trong RRD.
- Ngôn ngữ truy vấn này được chia ra thành các tables và trong các tables có các columns để lưu trữ các thông tin và dữ liệu của hệ thống check_mk
- Có thể sử dụng ngôn ngữ này để truy vấn dữ liệu. Lưu ý ngôn ngữ truy vấn này phân biệt chữ hoa và chữ thường.
- Có thể sử dụng các headers để lọc thông tin hiển thị từ các truy vấn được sử dụng
Khi muốn truy vấn thống kê thì có các giá trị và các toán tử được định nghĩa sẵn để sử dụng

## Cấu trúc của CHECK_MK

![Imgur](https://i.imgur.com/rcIrS9Y.png)

- Các lõi sẽ gọi xuống check_mk để thực hiện chức năng kiểm tra của nó
- Sau khi check thì livestatus sẽ hiển thị thông tin của mk lên website
- PNP4nagios: được sử dụng để xử lý dữ liệu để chuyển sang dạng biểu đồ
- Nagvis : được sử dụng để vẽ lại mô hình giám sát giúp người dùng có thể nhìn một cách dễ dàng hiểu hơn
- Dữ liệu sẽ được lưu vào trong RRD