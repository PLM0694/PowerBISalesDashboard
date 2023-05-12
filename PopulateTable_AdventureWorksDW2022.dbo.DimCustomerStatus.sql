USE AdventureWorksDW2022
GO

BEGIN TRANSACTION

	MERGE [dbo].[DimCustomerStatus] [target]
	USING [dbo].[DimCustomer] [source]
	ON ([target].[CustomerKey] = [source].[CustomerKey])
	WHEN MATCHED 
		THEN UPDATE SET
		[target].[CustomerKey] = [source].[CustomerKey]
	WHEN NOT MATCHED BY TARGET THEN
		INSERT([CustomerKey])
		VALUES([source].[CustomerKey])
	WHEN NOT MATCHED BY SOURCE
		THEN DELETE;
	
	UPDATE [dbo].[DimCustomerStatus]
	SET [NewCustomerIndicator] = 0
	WHERE [CustomerKey]  NOT IN 
		(SELECT [CustomerKey] FROM [dbo].[DimCustomer] WHERE YEAR([DateFirstPurchase]) = 2011)

--The total number of customers is 18484
--The total number of new customers is 2216
SELECT COUNT(*)
FROM [dbo].[DimCustomerStatus]
--WHERE NewCustomerIndicator = 1

ROLLBACK;
--COMMIT;



