use testdb;
CREATE TABLE[dbo].[emptbl](
[eno][int]NOT NULL,[name][nvarchar](20)NOT NULL,
[salary][numeric](18,0) not null,[city][nvarchar](20)not null,
CONSTRAINT[PK_emptbl]PRIMARY KEY CLUSTERED([eno]ASC));
ALTER TABLE[dbo].[emptbl]WITH CHECK ADD CONSTRAINT
[CK_emptbl_City]CHECK (([city]='Chennai'OR [city]='Bgl'))