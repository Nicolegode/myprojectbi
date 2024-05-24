 IF EXISTS (SELECT name FROM sys.tables WHERE name = 'DimTempo')
	BEGIN 
		DROP TABLE [dbo].[DimTempo]
 	END
 GO

 CREATE TABLE DimTempo (
 	 SkTempo		  INT NOT NULL IDENTITY
-- 	,NomPeriodicidade VARCHAR (25) NOT NULL
-- 	,DatTempo		  DATE
-- 	,NumAno			  INT
-- 	,NumMes			  INT
-- 	,NumDia			  INT
-- 	,NomMes			  VARCHAR(25)
-- 	,SigMes			  VARCHAR(3)
-- 	,IdcDiaSemana	  INT
-- 	,NomDiaSemana	  VARCHAR(25)
-- 	,NumDiaAno		  INT
-- 	,NumBimestre	  INT
-- 	,NumTrimestre	  INT
-- 	,NumSemestre	  INT
-- 	,NumSemanaMes	  INT
-- 	,NumSemanaAna	  INT
-- 	,IdcDiaUtil		  INT
-- 	,IdcFinalSemana	  INT
-- 	,NomData		  VARCHAR(50)
-- )
-- GO

-- DECLARE @dataini DATE
-- DECLARE @datafin DATE 

-- DECLARE @id_dim_data		AS INT,
-- 		@NumDia				AS INT,
-- 		@dia_da_semana		AS INT,
-- 		@dia_da_semana_nome AS VARCHAR(25),
-- 		@NumAno				AS INT,
-- 		@NumMes				AS INT,
-- 		@mes_nome			AS VARCHAR(25),
-- 		@mes_nome_abrev		AS VARCHAR(3),
-- 		@NumBimestre		AS INT,
-- 		@NumTrimestre		AS INT,
-- 		@NumSemestre		AS INT,
-- 		@IdcDiaUtil			AS INT,
-- 		@IdcFinalSemana		AS INT,
-- 		@NumSemanaMes		AS INT,
-- 		@NumSemanaAna		AS INT

-- SET @dataini ='20060101'
-- SET @datafin ='20281231'
-- SET @id_dim_data = 0

-- WHILE @dataini <= @datafin
-- BEGIN

-- 	SET @id_dim_data = @id_dim_data + 1
-- 	SET @NumDia = DAY(@dataini)
-- 	SET @dia_da_semana = DATEPART(WEEKDAY,@dataini)
-- 	SET @NumAno = YEAR(@dataini)
-- 	SET @NumMes = MONTH(@dataini)

-- 	SET @dia_da_semana_nome = CASE	WHEN @dia_da_semana = 1 THEN 'Domingo'
-- 									WHEN @dia_da_semana = 2 THEN 'Segunda'
-- 									WHEN @dia_da_semana = 3 THEN 'Terca'
-- 									WHEN @dia_da_semana = 4 THEN 'Quarta'
-- 									WHEN @dia_da_semana = 5 THEN 'Quinta'
-- 									WHEN @dia_da_semana = 6 THEN 'Sexta'
-- 									WHEN @dia_da_semana = 7 THEN 'Sabado' END

-- 	SET @mes_nome = CASE	WHEN @NumMes = 1  THEN 'Janeiro'
-- 							WHEN @NumMes = 2  THEN 'Fevereiro'
-- 							WHEN @NumMes = 3  THEN 'Marco'
-- 							WHEN @NumMes = 4  THEN 'Abril'
-- 							WHEN @NumMes = 5  THEN 'Maio'
-- 							WHEN @NumMes = 6  THEN 'Junho'
-- 							WHEN @NumMes = 7  THEN 'Julho'
-- 							WHEN @NumMes = 8  THEN 'Agosto'
-- 							WHEN @NumMes = 9  THEN 'Setembro'
-- 							WHEN @NumMes = 10 THEN 'Outubro'
-- 							WHEN @NumMes = 11 THEN 'Novembro'
-- 							WHEN @NumMes = 12 THEN 'Dezembro' END

-- 	SET @mes_nome_abrev = CASE	WHEN @NumMes = 1  THEN 'Jan'
-- 								WHEN @NumMes = 2  THEN 'Fev'
-- 								WHEN @NumMes = 3  THEN 'Mar'
-- 								WHEN @NumMes = 4  THEN 'Abr'
-- 								WHEN @NumMes = 5  THEN 'Mai'
-- 								WHEN @NumMes = 6  THEN 'Jun'
-- 								WHEN @NumMes = 7  THEN 'Jul'
-- 								WHEN @NumMes = 8  THEN 'Ago'
-- 								WHEN @NumMes = 9  THEN 'Set'
-- 								WHEN @NumMes = 10 THEN 'Out'
-- 								WHEN @NumMes = 11 THEN 'Nov'
-- 								WHEN @NumMes = 12 THEN 'Dez' END

-- 	SET @NumBimestre = CASE	WHEN @NumMes <= 2  THEN 1
-- 							WHEN @NumMes <= 4  THEN 2
-- 							WHEN @NumMes <= 6  THEN 3
-- 							WHEN @NumMes <= 8  THEN 4
-- 							WHEN @NumMes <= 10 THEN 5
-- 							WHEN @NumMes <= 12 THEN 6 END

-- 	SET @NumTrimestre = CASE WHEN @NumMes <= 3  THEN 1
-- 							 WHEN @NumMes <= 6  THEN 2
-- 							 WHEN @NumMes <= 9  THEN 3
-- 							 WHEN @NumMes <= 12 THEN 4 END

-- 	SET @NumSemestre = CASE	WHEN @NumMes <= 6  THEN 1
-- 							WHEN @NumMes <= 12 THEN 2 END

-- 	SELECT @NumSemanaMes = CASE	WHEN @NumDia < 8  THEN 1
-- 								WHEN @NumDia < 15 THEN 2
-- 								WHEN @NumDia < 22 THEN 3
-- 								WHEN @NumDia < 29 THEN 4
-- 								WHEN @NumDia < 32 THEN 5 END	

-- 	SET @NumSemanaAna = DATEPART(wk,@dataini)

-- 	SET @IdcDiaUtil = 1
-- 	SET @IdcFinalSemana = 0

-- 	IF @dia_da_semana = 1 or @dia_da_semana = 7 
-- 		SET @IdcFinalSemana = 1

-- 	IF @IdcFinalSemana = 1
-- 		SET @IdcDiaUtil = 0
-- 	ELSE IF @NumMes = 1 and @NumDia = 1 --confraterniza��o universal
-- 		SET @IdcDiaUtil = 0
-- 	ELSE IF @NumMes = 4 and @NumDia = 21 --tiradentes
-- 		SET @IdcDiaUtil = 0
-- 	ELSE IF @NumMes = 5 and @NumDia = 1 --trabalho
-- 		SET @IdcDiaUtil = 0
-- 	ELSE IF @NumMes = 9 and @NumDia = 7 --independ�ncia
-- 		SET @IdcDiaUtil = 0
-- 	ELSE IF @NumMes = 10 and @NumDia = 12 --nossa sra. aparecida
-- 		SET @IdcDiaUtil = 0
-- 	ELSE IF @NumMes = 11 and @NumDia = 2 --finados
-- 		SET @IdcDiaUtil = 0
-- 	ELSE IF @NumMes = 11 and @NumDia = 15 --proclama��o da rep�blica
-- 		SET @IdcDiaUtil = 0
-- 	ELSE IF @NumMes = 12 and @NumDia = 25 --natal
-- 		SET @IdcDiaUtil = 0

-- 	/*
-- 		feriados sem NumDia fixo devem ser atualizados manualmente
-- 		ex:
-- 		carnaval 
-- 		paix�o de cristo
-- 		corpus christi
-- 	*/

-- 	INSERT INTO DimTempo (  [NomPeriodicidade]
-- 							   ,[DatTempo]
-- 							   ,[NumAno]
-- 							   ,[NumMes]
-- 							   ,[NumDia]
-- 							   ,[NomMes]
-- 							   ,[SigMes]
-- 							   ,[IdcDiaSemana]
-- 							   ,[NomDiaSemana]
-- 							   ,[NumDiaAno]
-- 							   ,[NumBimestre]
-- 							   ,[NumTrimestre]
-- 							   ,[NumSemestre]
-- 							   ,[NumSemanaMes]
-- 							   ,[NumSemanaAna]
-- 							   ,[IdcDiaUtil]
-- 							   ,[IdcFinalSemana]
-- 							   ,[NomData]
-- 							  )
-- 	SELECT 
-- 	'Diaria'						AS NomPeriodicidade,
-- 	@dataini						AS DatTempo,
-- 	@NumAno							AS NumAno,
-- 	@NumMes							AS NumMes,
-- 	@NumDia							AS NumDia,
-- 	@mes_nome						AS NomMes,
-- 	@mes_nome_abrev					AS SigMes,
-- 	@dia_da_semana					AS IdcDiaSemana,
-- 	@dia_da_semana_nome				AS NomDiaSemana,
-- 	DATEPART(DAYOFYEAR,@dataini)	AS NumDiaAno,
-- 	@NumBimestre					AS NumBimestre,
-- 	@NumTrimestre					AS NumTrimestre,
-- 	@NumSemestre					AS NumSemestre,
-- 	@NumSemanaMes					AS NumSemanaMes,
-- 	@NumSemanaAna					AS NumSemanaAna,
-- 	@IdcDiaUtil						AS IdcDiaUtil,
-- 	@IdcFinalSemana					AS IdcFinalSemana,
-- 	LOWER(@dia_da_semana_nome 
-- 		+ ', dia ' 
-- 		+ CAST(@NumDia as varchar) 
-- 		+ ' de ' 
-- 		+ @mes_nome 
-- 		+ ' de ' 
-- 		+ CAST(@NumAno AS VARCHAR)) AS NomData

-- 	SET @dataini = DATEADD(DAY,1,@dataini)
-- END 

-- -- SELECT * FROM DimTempo WHERE DatTempo = CAST(GETDATE() AS DATE)

SELECT * FROM DimTempo