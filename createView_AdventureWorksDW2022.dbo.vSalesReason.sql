/****** Script for SelectTopNRows command from SSMS  ******/
USE [AdventureWorksDW2022]
GO

CREATE VIEW vSalesReason AS
	SELECT [sales_order].[SalesOrderNumber]
      ,[sales_order].[SalesOrderLineNumber]
	  ,[reason].[SalesReasonName]
	FROM [AdventureWorksDW2022].[dbo].[FactInternetSalesReason] [sales_order]
	INNER JOIN [dbo].[DimSalesReason] [reason] ON [sales_order].[SalesReasonKey] = [reason].SalesReasonKey