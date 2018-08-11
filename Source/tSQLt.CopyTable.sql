DROP PROCEDURE IF EXISTS [tSQLt].[CopyTable];

CREATE OR ALTER PROCEDURE [tSQLt].[CopyTable]
    @TableFullName NVARCHAR(MAX),
    @OrigTableFullName NVARCHAR(MAX),
    @Identity BIT = 0,
    @ComputedColumns BIT = 0,
    @Defaults BIT = 0
AS
    DECLARE @SchemaName nvarchar(max) = QUOTENAME(PARSENAME(@TableFullName, 2))
    DECLARE @TableName nvarchar(max) = QUOTENAME(PARSENAME(@TableFullName, 1))
  
    EXEC tSQLt.Private_CreateFakeOfTable 
            @SchemaName,
            @TableName,
            @OrigTableFullName,
            @Identity,
            @ComputedColumns,
            @Defaults;