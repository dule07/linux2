# Mysql alias

## Sử dụng AS

https://freetuts.net/su-dung-as-alias-trong-mysql-338.html

Việc sử dụng AS (Alias) trong MySQL khi viết câu truy vấn giúp câu SQL ngắn gọn hơn rất nhiều. Trường hợp tên field bị trùng nhau thì chúng ta phải sử dụng AS để đặt một cái tên định danh mới cho các field. Riêng với Table thì nếu dùng AS thì ở WHERE và SELECT có thể lấy tên của  AS thay vì lấy tên gốc của table. Nếu alias có dấu cách thì đặt ở trong dấu ngoặc đơn ' '

# Có 2 loại: alias columm và alias table

## Alias columm 

Cú pháp:

    SELECT 
    [column_1 | expression] AS 'descriptive_name'
    FROM table_name;

Truy vấn sau đây chọn tên và họ của nhân viên. Nó sử dụng hàm `CONCAT_WS ()` để ghép tên và họ thành tên đầy đủ.

    select concat_ws(',', lastName, firstName) as 'Full Name' from employees;

![Imgur](https://i.imgur.com/KYsEcmS.png)

## alias table

