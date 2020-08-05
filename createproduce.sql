Use Db_Shop
GO
CREATE PROCEDURE [dbo].[SP_TimKH_MaKH] 
@UserID int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * from UsersDetail Where UserID=@UserId
END


GO

CREATE PROCEDURE [dbo].[SP_TimKH_MaHD] 
@OrderID int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * from UsersDetail Where UserId in (select UserID from TheOrder where Code = @OrderID)
END


GO

CREATE PROCEDURE [dbo].[SP_SanPham_MaKH] 
@UserID int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM Product where Code in (SELECT ProductCode FROM OrdersDetail WHERE OrderID in (SELECT Code From TheOrder WHERE UserID = @UserID))
END


GO