-- ТАБЛИЦА С РАСХОДАМИ СЕМЬИ
CREATE TABLE dbo.TBL_EXPENSES
    (ID             int     IDENTITY(1,1)   NOT NULL,   -- внутренний Ид расхода
     [DATE]         date                    NOT NULL,   -- дата совершения покупки
     [NAME]         varchar(4000)           NULL,       -- наименование операции
     PRICE          decimal(10,2)           NOT NULL,   -- сумма покупки
     ID_CATEGORY    int                     NOT NULL    -- Ид категории из таблицы dbo.DIC_CATEGORY (внутреннее распределение)
    );
GO