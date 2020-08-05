SELECT * FROM UsersDetail where UserID in (select UserID From TheOrder) -- liệt kê khách hàng đã mua hàng

SELECT * FROM Product -- liệt kê sản phẩm

SELECT * FROM TheOrder -- liệt kê danh sách đơn đặt hàng

SELECT * FROM UsersDetail order by UserID ASC -- liệt kê danh sách khách hàng theo thứ tự alphabet

SELECT * FROM Product order by Price DESC -- liệt kê danh sách sản phẩm theo thứ tự giảm dần

SELECT * FROM Product where Code in (SELECT ProductCode From OrdersDetail where OrderID in (SELECT CODE FROM TheOrder WHERE UserID = 1) ) -- liệt kê sản phẩm mà Nguyễn Văn An đã mua

SELECT COUNT(UserID) as Soluongkhachhang from UsersDetail -- Số lượng khách hàng trên hệ thống

SELECT COUNT(ID) as Sohangdaban from OrdersDetail -- Số lượng sản phẩm bán ra

SELECT sum(lastprice) from OrdersDetail where OrderID = 1 -- Tổng tiền bán ra của đơn hàng id  = 1


