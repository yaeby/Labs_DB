USE	AdventureWorks2019
GO

	ALTER FUNCTION CalculateTransactionAmount
	(
		@txn_code VARCHAR(MAX)
	)
	RETURNS FLOAT
	AS
	BEGIN
		DECLARE @calculated_amount FLOAT;
		DECLARE @transaction_currency VARCHAR(3);
		DECLARE @exchange_rate FLOAT;
		DECLARE @shares INT;

		SELECT @transaction_currency = CCY,
			   @shares = SHARES
		FROM SRC_TXN
		WHERE TXN_SRC_KEY = @txn_code;

		IF @transaction_currency = 'USD'
		BEGIN
			SET @calculated_amount = @shares;
		END
		ELSE
		BEGIN
			SELECT @exchange_rate = COALESCE(e.RATE, 1)
			FROM SRC_TXN AS s
			LEFT JOIN EXCH_RATE AS e
				ON s.CCY = e.CCY_CODE
			WHERE s.TXN_SRC_KEY = @txn_code
				AND e.CCY_CODE = @transaction_currency
				AND s.BUS_DY BETWEEN e.EFF_DT AND e.END_DATE;

			SET @calculated_amount = @shares / @exchange_rate;
		END;

		RETURN @calculated_amount;
	END;
GO