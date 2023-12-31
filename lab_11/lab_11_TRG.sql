USE AdventureWorks2019
GO

	ALTER TRIGGER SRC_TXN_trg
	ON SRC_TXN
	AFTER INSERT, UPDATE, DELETE
	AS
	BEGIN
		DECLARE @action as char(1);
		DECLARE @key as varchar(max);

		SET @action = 'I';
		IF EXISTS(SELECT * FROM DELETED)
		BEGIN
			SELECT @key = TXN_SRC_KEY FROM DELETED
			SET @action = 
				CASE
					WHEN EXISTS(SELECT * FROM INSERTED) THEN 'U'
					ELSE 'D'    
				END
		END
		ELSE
		BEGIN
			IF NOT EXISTS(SELECT * FROM INSERTED) RETURN; -- Nothing updated or inserted
			SELECT @key = TXN_SRC_KEY FROM INSERTED
		END

		INSERT INTO J$SRC_TXN (TXN_SRC_KEY, CONSUME_F, ACTION_F)
		VALUES (@key, 0, @action)
		PRINT 'TRIGGER INSERTED DATA'
	END;
GO