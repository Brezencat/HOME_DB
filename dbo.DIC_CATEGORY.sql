-- Справочник категорий расходов
CREATE TABLE dbo.DIC_CATEGORY
    (ID_CATEGORY    int  IDENTITY(1,1),     -- ID категории
     CATEGORY       varchar(255) NOT NULL   -- наименование категории
    );
GO