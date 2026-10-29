BULK INSERT dbo.city
FROM 'D:\Downloads\city (1).csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    TABLOCK
);


BULK INSERT dbo.PRODUCTS
FROM 'D:\Downloads\products (1).csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    TABLOCK
);

BULK INSERT dbo.CUSTOMERS
FROM 'D:\Downloads\customers (2).csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    TABLOCK
);


BULK INSERT dbo.SALES
FROM 'D:\Downloads\sales (1).csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    TABLOCK
)_
