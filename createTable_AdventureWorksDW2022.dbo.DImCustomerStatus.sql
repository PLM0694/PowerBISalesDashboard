CREATE TABLE dbo.DimCustomerStatus (
	 CustomerKey INT NOT NULL CONSTRAINT FK_DimCustomer_CustomerKey FOREIGN KEY REFERENCES [dbo].[DimCustomer](CustomerKey)
	,NewCustomerIndicator bit NOT NULL DEFAULT(1)
);