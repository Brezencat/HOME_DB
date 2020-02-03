CREATE PROC dbo.LOAD_TBL_EXPENSES
	@MAX_DATE date = null

AS

BEGIN TRY

	IF @MAX_DATE is null
	BEGIN
		SELECT @MAX_DATE = [DATE] FROM dbo.TBL_EXPENSES;
	END

	IF @MAX_DATE is null
	BEGIN
		THROW 50000, 'Дата загрузки не определена, необходимо задать дату вручную', 1;
	END


	DROP TABLE IF EXISTS #BUF;

	--набираем временную таблицу с данными из буфера с ограничением по дате последней загрузки
	--проставляем ID категории
	SELECT e.[DATE]
		 , e.[NAME]
		 , e.PRICE
		 , ISNULL(c.ID_CATEGORY, -1) as ID_CATEGORY
	into #BUF
	FROM buf.TBL_EXPENSES as e
	LEFT JOIN dbo.DIC_CATEGORY as c on e.CATEGORY = c.CATEGORY
	WHERE [DATE] >= @MAX_DATE;


	IF not exists (select TOP(1) 1 from #BUF)
	BEGIN
		THROW 50000, 'Отсутствуют новые даты для загрузки', 1;
	END

	--UPDATE trg
	--set  trg.[DATE] = src.[DATE]
	--	,trg.[NAME] = src.[NAME]
	--	,trg.PRICE = src.PRICE
	--FROM dbo.TBL_EXPENSES as trg
	--inner join #BUF as src on trg.ID_ROW = src.ID_ROW

	INSERT INTO dbo.TBL_EXPENSES 
		([DATE]
		,[NAME]
		,PRICE
		,ID_CATEGORY
		)
	SELECT [DATE]
		 , [NAME]
		 , PRICE
		 , ID_CATEGORY
	FROM #BUF;

END TRY

BEGIN CATCH
	--добавить нормальную обработку ошибок
	THROW;
END CATCH