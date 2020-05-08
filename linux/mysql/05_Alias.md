# Mysql alias

Có 2 loại: alias columm và alias table

## Alias columm 

Cú pháp:

    SELECT 
    [column_1 | expression] AS 'descriptive_name'
    FROM table_name;

Truy vấn sau đây chọn tên và họ của nhân viên. Nó sử dụng hàm `CONCAT_WS ()` để ghép tên và họ thành tên đầy đủ.

    select concat_ws(',', lastName, firstName) as 'Full Name' from employees;

![Imgur](https://i.imgur.com/KYsEcmS.png)

