CREATE TABLE [Stock].[StockPrice]
(
    StockID INT NOT NULL,
    StockDate DATE NOT NULL,
    Price DECIMAL(18,6) NOT NULL,
    PRIMARY KEY (StockID, StockDate),
    CONSTRAINT FK_StockPrice_Stock FOREIGN KEY (StockID) REFERENCES [Stock].Stock(StockID),

)
