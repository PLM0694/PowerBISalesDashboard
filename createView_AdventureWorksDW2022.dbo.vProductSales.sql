USE [AdventureWorksDW2022]
GO

CREATE VIEW vProductSales AS
	SELECT [fact_sales].[ProductKey]
		  ,[fact_sales].[CustomerKey]
		  ,[currency_code].[CurrencyAlternateKey]
	      ,[fact_sales].[OrderDateKey]
		  ,[currency_rate].[EndOfDayRate]
	      ,[territory].[SalesTerritoryCountry]
	      ,[fact_sales].[OrderQuantity]
	      ,[fact_sales].[UnitPrice]
	      ,[fact_sales].[ExtendedAmount]
	      ,[fact_sales].[UnitPriceDiscountPct]
	      ,[fact_sales].[DiscountAmount]
	      ,[fact_sales].[ProductStandardCost]
	      ,[fact_sales].[TotalProductCost]
	      ,[fact_sales].[SalesAmount]
	      ,[fact_sales].[OrderDate]
		  ,[fact_sales].[SalesOrderNumber]
	FROM [dbo].[FactInternetSales] [fact_sales]
	INNER JOIN [dbo].[FactCurrencyRate] [currency_rate]
		ON [fact_sales].[CurrencyKey] = [currency_rate].[CurrencyKey]
		AND [fact_sales].[OrderDateKey] = [currency_rate].[DateKey]
	INNER JOIN [dbo].[DimCurrency] [currency_code] 
		ON  [currency_rate].[CurrencyKey] = [currency_code].[CurrencyKey]
	INNER JOIN [dbo].[DimSalesTerritory] [territory]
		ON [fact_sales].[SalesTerritoryKey] = [territory].[SalesTerritoryKey]