-- Буферная таблица для загрузки данных по расходам на сервер
CREATE TABLE buf.TBL_EXPENSES
    ([DATE]     date            NOT NULL,   -- дата совершения покупки
     [NAME]     varchar(4000)   NULL,       -- наименование операции
     PRICE      decimal(10,2)   NOT NULL,   -- сумма покупки
     CATEGORY   varchar(255)    NOT NULL    -- название категории (внутреннее распределение)
    );
GO