ALTER TABLE [dbo].[Product]
ADD CHECK (Price > 0)

ALTER TABLE [dbo].[TheOrder]
ADD CHECK (CreateTime < (getdate()))

ALTER TABLE [dbo].[Product] 
ADD Dateofarrival [datetime] NULL