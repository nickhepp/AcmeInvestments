CREATE TABLE [Stock].[AcmeHolding]
(
    StockID INT NOT NULL,
    StockDate DATE NOT NULL,
    Quantity INT NOT NULL,
    CONSTRAINT FK_AcmeHolding_Stock FOREIGN KEY (StockID) REFERENCES [Stock].[Stock](StockID),
    PRIMARY KEY (StockID, StockDate)
)
