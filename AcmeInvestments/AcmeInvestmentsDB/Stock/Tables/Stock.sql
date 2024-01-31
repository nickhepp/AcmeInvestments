CREATE TABLE [Stock].[Stock]
(
    StockID INT PRIMARY KEY NOT NULL,
    CompanyID INT NOT NULL,
    CONSTRAINT FK_Stock_Company FOREIGN KEY (CompanyID) REFERENCES [Stock].[Company](CompanyID),
    CONSTRAINT UQ_Stock_CompanyID_StockID UNIQUE (CompanyID, StockID)
)
