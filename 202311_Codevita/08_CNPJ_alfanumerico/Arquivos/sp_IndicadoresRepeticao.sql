/*
   proc sp_IndicadoresRepeticao
   popula 1 se o numero saiu e 0 se n�o saiu
   cria um mapa de indicadores
   exec sp_IndicadoresRepeticao
   select * from tblLoto_Mapa
*/



/*
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_IndicadoresRepeticao]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[sp_IndicadoresRepeticao];
GO
*/

CREATE PROCEDURE [dbo].[sp_IndicadoresRepeticao] 
AS
BEGIN
	SET NOCOUNT ON

	declare @Err			int
	declare @strCreateTable nvarchar(max)
	
	set @strCreateTable = ''
	
	
	declare @concurso       int,
			@DataSorteio	datetime,
			@bola01			int,
			@bola02			int,
			@bola03			int,
			@bola04			int,
			@bola05			int,
			@bola06			int,
			@bola07			int,
			@bola08			int,
			@bola09			int,
			@bola10			int,
			@bola11			int,
			@bola12			int,
			@bola13			int,
			@bola14			int,
			@bola15			int,

			@resol01	int,
			@resol02	int,
			@resol03	int,
			@resol04	int,
			@resol05	int,
			@resol06	int,
			@resol07	int,
			@resol08	int,
			@resol09	int,
			@resol10	int,
			@resol11	int,
			@resol12	int,
			@resol13	int,
			@resol14	int,
			@resol15	int,
			@resol16	int,
			@resol17	int,
			@resol18	int,
			@resol19	int,
			@resol20	int,
			@resol21	int,
			@resol22	int,
			@resol23	int,
			@resol24	int,
			@resol25	int,
			@Existe		int
	

	select @concurso = max(concurso) from tblLoto_Resultados

	declare resultado_cursor cursor for
	select Concurso, DataSorteio, bola01, bola02, bola03, bola04, bola05, bola06, bola07, bola08, bola09, bola10, bola11, bola12, bola13, bola14, bola15
	from tblLoto_Resultados where concurso <= @concurso order by Concurso

	open resultado_cursor
	fetch next from resultado_cursor into @concurso,@DataSorteio, @bola01, @bola02, @bola03, @bola04, @bola05,
	                                                              @bola06, @bola07, @bola08, @bola09, @bola10,
	                                                              @bola11,@bola12,@bola13,@bola14,@bola15
	while @@fetch_status = 0
	begin
	    -- verifica se ja existe na tabela
	    set @Existe = 0
		select @Existe = 1   from tblLoto_Mapa where Concurso = @concurso
		--print @concurso 
		--print @Existe  
		if (@Existe = 0 )
		begin			
			set @strCreateTable = 'INSERT INTO [dbo].[tblLoto_Mapa] ([concurso] ,[DataSorteio],[NR01],[NR02],[NR03],[NR04],[NR05],[NR06],[NR07],[NR08],[NR09],[NR10],[NR11],[NR12],[NR13],[NR14],[NR15],[NR16],[NR17],[NR18],[NR19],[NR20],[NR21],[NR22],[NR23],[NR24],[NR25]) VALUES('
			set @strCreateTable = @strCreateTable + convert(varchar,@concurso)+',''' + convert(varchar,@DataSorteio) + ''','
			set @resol01 = 0
			set @resol02 = 0
			set @resol03 = 0
			set @resol04 = 0
			set @resol05 = 0
			set @resol06 = 0
			set @resol07 = 0
			set @resol08 = 0
			set @resol09 = 0
			set @resol10 = 0
			set @resol11 = 0
			set @resol12 = 0
			set @resol13 = 0
			set @resol14 = 0
			set @resol15 = 0
			set @resol16 = 0
			set @resol17 = 0
			set @resol18 = 0
			set @resol19 = 0
			set @resol20 = 0
			set @resol21 = 0
			set @resol22 = 0
			set @resol23 = 0
			set @resol24 = 0
			set @resol25 = 0
			
			-- bola 01
			IF (@bola01 = 1)  BEGIN set @resol01 = 1  END
			IF (@bola01 = 2)  BEGIN set @resol02 = 1  END
			IF (@bola01 = 3)  BEGIN set @resol03 = 1  END
			IF (@bola01 = 4)  BEGIN set @resol04 = 1  END
			IF (@bola01 = 5)  BEGIN set @resol05 = 1  END
			IF (@bola01 = 6)  BEGIN set @resol06 = 1  END
			IF (@bola01 = 7)  BEGIN set @resol07 = 1  END
			IF (@bola01 = 8)  BEGIN set @resol08 = 1  END
			IF (@bola01 = 9)  BEGIN set @resol09 = 1  END
			IF (@bola01 = 10) BEGIN set @resol10 = 1  END
			IF (@bola01 = 11) BEGIN set @resol11 = 1  END
			IF (@bola01 = 12) BEGIN set @resol12 = 1  END
			IF (@bola01 = 13) BEGIN set @resol13 = 1  END
			IF (@bola01 = 14) BEGIN set @resol14 = 1  END
			IF (@bola01 = 15) BEGIN set @resol15 = 1  END
			IF (@bola01 = 16) BEGIN set @resol16 = 1  END
			IF (@bola01 = 17) BEGIN set @resol17 = 1  END
			IF (@bola01 = 18) BEGIN set @resol18 = 1  END
			IF (@bola01 = 19) BEGIN set @resol19 = 1  END
			IF (@bola01 = 20) BEGIN set @resol20 = 1  END
			IF (@bola01 = 21) BEGIN set @resol21 = 1  END
			IF (@bola01 = 22) BEGIN set @resol22 = 1  END
			IF (@bola01 = 23) BEGIN set @resol23 = 1  END
			IF (@bola01 = 24) BEGIN set @resol24 = 1  END
			IF (@bola01 = 25) BEGIN set @resol25 = 1  END

			
			-- bola 02
			IF (@bola01 = 1)  BEGIN set @resol01 = 1  END
			IF (@bola01 = 2)  BEGIN set @resol02 = 1  END
			IF (@bola01 = 3)  BEGIN set @resol03 = 1  END
			IF (@bola01 = 4)  BEGIN set @resol04 = 1  END
			IF (@bola01 = 5)  BEGIN set @resol05 = 1  END
			IF (@bola01 = 6)  BEGIN set @resol06 = 1  END
			IF (@bola01 = 7)  BEGIN set @resol07 = 1  END
			IF (@bola01 = 8)  BEGIN set @resol08 = 1  END
			IF (@bola01 = 9)  BEGIN set @resol09 = 1  END
			IF (@bola01 = 10) BEGIN set @resol10 = 1  END
			IF (@bola01 = 11) BEGIN set @resol11 = 1  END
			IF (@bola01 = 12) BEGIN set @resol12 = 1  END
			IF (@bola01 = 13) BEGIN set @resol13 = 1  END
			IF (@bola01 = 14) BEGIN set @resol14 = 1  END
			IF (@bola01 = 15) BEGIN set @resol15 = 1  END
			IF (@bola01 = 16) BEGIN set @resol16 = 1  END
			IF (@bola01 = 17) BEGIN set @resol17 = 1  END
			IF (@bola01 = 18) BEGIN set @resol18 = 1  END
			IF (@bola01 = 19) BEGIN set @resol19 = 1  END
			IF (@bola02 = 20) BEGIN set @resol20 = 1  END
			IF (@bola02 = 21) BEGIN set @resol21 = 1  END
			IF (@bola02 = 22) BEGIN set @resol22 = 1  END
			IF (@bola02 = 23) BEGIN set @resol23 = 1  END
			IF (@bola02 = 24) BEGIN set @resol24 = 1  END
			IF (@bola02 = 25) BEGIN set @resol25 = 1  END

			
			-- bola 02
			IF (@bola02 = 1)  BEGIN set @resol01 = 1  END
			IF (@bola02 = 2)  BEGIN set @resol02 = 1  END
			IF (@bola02 = 3)  BEGIN set @resol03 = 1  END
			IF (@bola02 = 4)  BEGIN set @resol04 = 1  END
			IF (@bola02 = 5)  BEGIN set @resol05 = 1  END
			IF (@bola02 = 6)  BEGIN set @resol06 = 1  END
			IF (@bola02 = 7)  BEGIN set @resol07 = 1  END
			IF (@bola02 = 8)  BEGIN set @resol08 = 1  END
			IF (@bola02 = 9)  BEGIN set @resol09 = 1  END
			IF (@bola02 = 10) BEGIN set @resol10 = 1  END
			IF (@bola02 = 11) BEGIN set @resol11 = 1  END
			IF (@bola02 = 12) BEGIN set @resol12 = 1  END
			IF (@bola02 = 13) BEGIN set @resol13 = 1  END
			IF (@bola02 = 14) BEGIN set @resol14 = 1  END
			IF (@bola02 = 15) BEGIN set @resol15 = 1  END
			IF (@bola02 = 16) BEGIN set @resol16 = 1  END
			IF (@bola02 = 17) BEGIN set @resol17 = 1  END
			IF (@bola02 = 18) BEGIN set @resol18 = 1  END
			IF (@bola02 = 19) BEGIN set @resol19 = 1  END
			IF (@bola02 = 20) BEGIN set @resol20 = 1  END
			IF (@bola02 = 21) BEGIN set @resol21 = 1  END
			IF (@bola02 = 22) BEGIN set @resol22 = 1  END
			IF (@bola02 = 23) BEGIN set @resol23 = 1  END
			IF (@bola02 = 24) BEGIN set @resol24 = 1  END
			IF (@bola02 = 25) BEGIN set @resol25 = 1  END
			
			
			-- bola 03
			IF (@bola03 = 1)  BEGIN set @resol01 = 1  END
			IF (@bola03 = 2)  BEGIN set @resol02 = 1  END
			IF (@bola03 = 3)  BEGIN set @resol03 = 1  END
			IF (@bola03 = 4)  BEGIN set @resol04 = 1  END
			IF (@bola03 = 5)  BEGIN set @resol05 = 1  END
			IF (@bola03 = 6)  BEGIN set @resol06 = 1  END
			IF (@bola03 = 7)  BEGIN set @resol07 = 1  END
			IF (@bola03 = 8)  BEGIN set @resol08 = 1  END
			IF (@bola03 = 9)  BEGIN set @resol09 = 1  END
			IF (@bola03 = 10) BEGIN set @resol10 = 1  END
			IF (@bola03 = 11) BEGIN set @resol11 = 1  END
			IF (@bola03 = 12) BEGIN set @resol12 = 1  END
			IF (@bola03 = 13) BEGIN set @resol13 = 1  END
			IF (@bola03 = 14) BEGIN set @resol14 = 1  END
			IF (@bola03 = 15) BEGIN set @resol15 = 1  END
			IF (@bola03 = 16) BEGIN set @resol16 = 1  END
			IF (@bola03 = 17) BEGIN set @resol17 = 1  END
			IF (@bola03 = 18) BEGIN set @resol18 = 1  END
			IF (@bola03 = 19) BEGIN set @resol19 = 1  END
			IF (@bola03 = 20) BEGIN set @resol20 = 1  END
			IF (@bola03 = 21) BEGIN set @resol21 = 1  END
			IF (@bola03 = 22) BEGIN set @resol22 = 1  END
			IF (@bola03 = 23) BEGIN set @resol23 = 1  END
			IF (@bola03 = 24) BEGIN set @resol24 = 1  END
			IF (@bola03 = 25) BEGIN set @resol25 = 1  END
			
			-- bola 04
			IF (@bola04 = 1)  BEGIN set @resol01 = 1  END
			IF (@bola04 = 2)  BEGIN set @resol02 = 1  END
			IF (@bola04 = 3)  BEGIN set @resol03 = 1  END
			IF (@bola04 = 4)  BEGIN set @resol04 = 1  END
			IF (@bola04 = 5)  BEGIN set @resol05 = 1  END
			IF (@bola04 = 6)  BEGIN set @resol06 = 1  END
			IF (@bola04 = 7)  BEGIN set @resol07 = 1  END
			IF (@bola04 = 8)  BEGIN set @resol08 = 1  END
			IF (@bola04 = 9)  BEGIN set @resol09 = 1  END
			IF (@bola04 = 10) BEGIN set @resol10 = 1  END
			IF (@bola04 = 11) BEGIN set @resol11 = 1  END
			IF (@bola04 = 12) BEGIN set @resol12 = 1  END
			IF (@bola04 = 13) BEGIN set @resol13 = 1  END
			IF (@bola04 = 14) BEGIN set @resol14 = 1  END
			IF (@bola04 = 15) BEGIN set @resol15 = 1  END
			IF (@bola04 = 16) BEGIN set @resol16 = 1  END
			IF (@bola04 = 17) BEGIN set @resol17 = 1  END
			IF (@bola04 = 18) BEGIN set @resol18 = 1  END
			IF (@bola04 = 19) BEGIN set @resol19 = 1  END
			IF (@bola04 = 20) BEGIN set @resol20 = 1  END
			IF (@bola04 = 21) BEGIN set @resol21 = 1  END
			IF (@bola04 = 22) BEGIN set @resol22 = 1  END
			IF (@bola04 = 23) BEGIN set @resol23 = 1  END
			IF (@bola04 = 24) BEGIN set @resol24 = 1  END
			IF (@bola04 = 25) BEGIN set @resol25 = 1  END
			
			-- bola 05
			IF (@bola05 = 1)  BEGIN set @resol01 = 1  END
			IF (@bola05 = 2)  BEGIN set @resol02 = 1  END
			IF (@bola05 = 3)  BEGIN set @resol03 = 1  END
			IF (@bola05 = 4)  BEGIN set @resol04 = 1  END
			IF (@bola05 = 5)  BEGIN set @resol05 = 1  END
			IF (@bola05 = 6)  BEGIN set @resol06 = 1  END
			IF (@bola05 = 7)  BEGIN set @resol07 = 1  END
			IF (@bola05 = 8)  BEGIN set @resol08 = 1  END
			IF (@bola05 = 9)  BEGIN set @resol09 = 1  END
			IF (@bola05 = 10) BEGIN set @resol10 = 1  END
			IF (@bola05 = 11) BEGIN set @resol11 = 1  END
			IF (@bola05 = 12) BEGIN set @resol12 = 1  END
			IF (@bola05 = 13) BEGIN set @resol13 = 1  END
			IF (@bola05 = 14) BEGIN set @resol14 = 1  END
			IF (@bola05 = 15) BEGIN set @resol15 = 1  END
			IF (@bola05 = 16) BEGIN set @resol16 = 1  END
			IF (@bola05 = 17) BEGIN set @resol17 = 1  END
			IF (@bola05 = 18) BEGIN set @resol18 = 1  END
			IF (@bola05 = 19) BEGIN set @resol19 = 1  END
			IF (@bola05 = 20) BEGIN set @resol20 = 1  END
			IF (@bola05 = 21) BEGIN set @resol21 = 1  END
			IF (@bola05 = 22) BEGIN set @resol22 = 1  END
			IF (@bola05 = 23) BEGIN set @resol23 = 1  END
			IF (@bola05 = 24) BEGIN set @resol24 = 1  END
			IF (@bola05 = 25) BEGIN set @resol25 = 1  END
			
			-- bola 06
			IF (@bola06 = 1)  BEGIN set @resol01 = 1  END
			IF (@bola06 = 2)  BEGIN set @resol02 = 1  END
			IF (@bola06 = 3)  BEGIN set @resol03 = 1  END
			IF (@bola06 = 4)  BEGIN set @resol04 = 1  END
			IF (@bola06 = 5)  BEGIN set @resol05 = 1  END
			IF (@bola06 = 6)  BEGIN set @resol06 = 1  END
			IF (@bola06 = 7)  BEGIN set @resol07 = 1  END
			IF (@bola06 = 8)  BEGIN set @resol08 = 1  END
			IF (@bola06 = 9)  BEGIN set @resol09 = 1  END
			IF (@bola06 = 10) BEGIN set @resol10 = 1  END
			IF (@bola06 = 11) BEGIN set @resol11 = 1  END
			IF (@bola06 = 12) BEGIN set @resol12 = 1  END
			IF (@bola06 = 13) BEGIN set @resol13 = 1  END
			IF (@bola06 = 14) BEGIN set @resol14 = 1  END
			IF (@bola06 = 15) BEGIN set @resol15 = 1  END
			IF (@bola06 = 16) BEGIN set @resol16 = 1  END
			IF (@bola06 = 17) BEGIN set @resol17 = 1  END
			IF (@bola06 = 18) BEGIN set @resol18 = 1  END
			IF (@bola06 = 19) BEGIN set @resol19 = 1  END
			IF (@bola06 = 20) BEGIN set @resol20 = 1  END
			IF (@bola06 = 21) BEGIN set @resol21 = 1  END
			IF (@bola06 = 22) BEGIN set @resol22 = 1  END
			IF (@bola06 = 23) BEGIN set @resol23 = 1  END
			IF (@bola06 = 24) BEGIN set @resol24 = 1  END
			IF (@bola06 = 25) BEGIN set @resol25 = 1  END
			
			-- bola 07
			IF (@bola07 = 1)  BEGIN set @resol01 = 1  END
			IF (@bola07 = 2)  BEGIN set @resol02 = 1  END
			IF (@bola07 = 3)  BEGIN set @resol03 = 1  END
			IF (@bola07 = 4)  BEGIN set @resol04 = 1  END
			IF (@bola07 = 5)  BEGIN set @resol05 = 1  END
			IF (@bola07 = 6)  BEGIN set @resol06 = 1  END
			IF (@bola07 = 7)  BEGIN set @resol07 = 1  END
			IF (@bola07 = 8)  BEGIN set @resol08 = 1  END
			IF (@bola07 = 9)  BEGIN set @resol09 = 1  END
			IF (@bola07 = 10) BEGIN set @resol10 = 1  END
			IF (@bola07 = 11) BEGIN set @resol11 = 1  END
			IF (@bola07 = 12) BEGIN set @resol12 = 1  END
			IF (@bola07 = 13) BEGIN set @resol13 = 1  END
			IF (@bola07 = 14) BEGIN set @resol14 = 1  END
			IF (@bola07 = 15) BEGIN set @resol15 = 1  END
			IF (@bola07 = 16) BEGIN set @resol16 = 1  END
			IF (@bola07 = 17) BEGIN set @resol17 = 1  END
			IF (@bola07 = 18) BEGIN set @resol18 = 1  END
			IF (@bola07 = 19) BEGIN set @resol19 = 1  END
			IF (@bola07 = 20) BEGIN set @resol20 = 1  END
			IF (@bola07 = 21) BEGIN set @resol21 = 1  END
			IF (@bola07 = 22) BEGIN set @resol22 = 1  END
			IF (@bola07 = 23) BEGIN set @resol23 = 1  END
			IF (@bola07 = 24) BEGIN set @resol24 = 1  END
			IF (@bola07 = 25) BEGIN set @resol25 = 1  END
			
			
			
			-- bola 08
			IF (@bola08 = 1)  BEGIN set @resol01 = 1  END
			IF (@bola08 = 2)  BEGIN set @resol02 = 1  END
			IF (@bola08 = 3)  BEGIN set @resol03 = 1  END
			IF (@bola08 = 4)  BEGIN set @resol04 = 1  END
			IF (@bola08 = 5)  BEGIN set @resol05 = 1  END
			IF (@bola08 = 6)  BEGIN set @resol06 = 1  END
			IF (@bola08 = 7)  BEGIN set @resol07 = 1  END
			IF (@bola08 = 8)  BEGIN set @resol08 = 1  END
			IF (@bola08 = 9)  BEGIN set @resol09 = 1  END
			IF (@bola08 = 10) BEGIN set @resol10 = 1  END
			IF (@bola08 = 11) BEGIN set @resol11 = 1  END
			IF (@bola08 = 12) BEGIN set @resol12 = 1  END
			IF (@bola08 = 13) BEGIN set @resol13 = 1  END
			IF (@bola08 = 14) BEGIN set @resol14 = 1  END
			IF (@bola08 = 15) BEGIN set @resol15 = 1  END
			IF (@bola08 = 16) BEGIN set @resol16 = 1  END
			IF (@bola08 = 17) BEGIN set @resol17 = 1  END
			IF (@bola08 = 18) BEGIN set @resol18 = 1  END
			IF (@bola08 = 19) BEGIN set @resol19 = 1  END
			IF (@bola08 = 20) BEGIN set @resol20 = 1  END
			IF (@bola08 = 21) BEGIN set @resol21 = 1  END
			IF (@bola08 = 22) BEGIN set @resol22 = 1  END
			IF (@bola08 = 23) BEGIN set @resol23 = 1  END
			IF (@bola08 = 24) BEGIN set @resol24 = 1  END
			IF (@bola08 = 25) BEGIN set @resol25 = 1  END
			
			
			-- bola 09
			IF (@bola09 = 1)  BEGIN set @resol01 = 1  END
			IF (@bola09 = 2)  BEGIN set @resol02 = 1  END
			IF (@bola09 = 3)  BEGIN set @resol03 = 1  END
			IF (@bola09 = 4)  BEGIN set @resol04 = 1  END
			IF (@bola09 = 5)  BEGIN set @resol05 = 1  END
			IF (@bola09 = 6)  BEGIN set @resol06 = 1  END
			IF (@bola09 = 7)  BEGIN set @resol07 = 1  END
			IF (@bola09 = 8)  BEGIN set @resol08 = 1  END
			IF (@bola09 = 9)  BEGIN set @resol09 = 1  END
			IF (@bola09 = 10) BEGIN set @resol10 = 1  END
			IF (@bola09 = 11) BEGIN set @resol11 = 1  END
			IF (@bola09 = 12) BEGIN set @resol12 = 1  END
			IF (@bola09 = 13) BEGIN set @resol13 = 1  END
			IF (@bola09 = 14) BEGIN set @resol14 = 1  END
			IF (@bola09 = 15) BEGIN set @resol15 = 1  END
			IF (@bola09 = 16) BEGIN set @resol16 = 1  END
			IF (@bola09 = 17) BEGIN set @resol17 = 1  END
			IF (@bola09 = 18) BEGIN set @resol18 = 1  END
			IF (@bola09 = 19) BEGIN set @resol19 = 1  END
			IF (@bola09 = 20) BEGIN set @resol20 = 1  END
			IF (@bola09 = 21) BEGIN set @resol21 = 1  END
			IF (@bola09 = 22) BEGIN set @resol22 = 1  END
			IF (@bola09 = 23) BEGIN set @resol23 = 1  END
			IF (@bola09 = 24) BEGIN set @resol24 = 1  END
			IF (@bola09 = 25) BEGIN set @resol25 = 1  END
			
			-- bola 10
			IF (@bola10 = 1)  BEGIN set @resol01 = 1  END
			IF (@bola10 = 2)  BEGIN set @resol02 = 1  END
			IF (@bola10 = 3)  BEGIN set @resol03 = 1  END
			IF (@bola10 = 4)  BEGIN set @resol04 = 1  END
			IF (@bola10 = 5)  BEGIN set @resol05 = 1  END
			IF (@bola10 = 6)  BEGIN set @resol06 = 1  END
			IF (@bola10 = 7)  BEGIN set @resol07 = 1  END
			IF (@bola10 = 8)  BEGIN set @resol08 = 1  END
			IF (@bola10 = 9)  BEGIN set @resol09 = 1  END
			IF (@bola10 = 10) BEGIN set @resol10 = 1  END
			IF (@bola10 = 11) BEGIN set @resol11 = 1  END
			IF (@bola10 = 12) BEGIN set @resol12 = 1  END
			IF (@bola10 = 13) BEGIN set @resol13 = 1  END
			IF (@bola10 = 14) BEGIN set @resol14 = 1  END
			IF (@bola10 = 15) BEGIN set @resol15 = 1  END
			IF (@bola10 = 16) BEGIN set @resol16 = 1  END
			IF (@bola10 = 17) BEGIN set @resol17 = 1  END
			IF (@bola10 = 18) BEGIN set @resol18 = 1  END
			IF (@bola10 = 19) BEGIN set @resol19 = 1  END
			IF (@bola10 = 20) BEGIN set @resol20 = 1  END
			IF (@bola10 = 21) BEGIN set @resol21 = 1  END
			IF (@bola10 = 22) BEGIN set @resol22 = 1  END
			IF (@bola10 = 23) BEGIN set @resol23 = 1  END
			IF (@bola10 = 24) BEGIN set @resol24 = 1  END
			IF (@bola10 = 25) BEGIN set @resol25 = 1  END
			
			-- bola 11
			IF (@bola11 = 1)  BEGIN set @resol01 = 1  END
			IF (@bola11 = 2)  BEGIN set @resol02 = 1  END
			IF (@bola11 = 3)  BEGIN set @resol03 = 1  END
			IF (@bola11 = 4)  BEGIN set @resol04 = 1  END
			IF (@bola11 = 5)  BEGIN set @resol05 = 1  END
			IF (@bola11 = 6)  BEGIN set @resol06 = 1  END
			IF (@bola11 = 7)  BEGIN set @resol07 = 1  END
			IF (@bola11 = 8)  BEGIN set @resol08 = 1  END
			IF (@bola11 = 9)  BEGIN set @resol09 = 1  END
			IF (@bola11 = 10) BEGIN set @resol10 = 1  END
			IF (@bola11 = 11) BEGIN set @resol11 = 1  END
			IF (@bola11 = 12) BEGIN set @resol12 = 1  END
			IF (@bola11 = 13) BEGIN set @resol13 = 1  END
			IF (@bola11 = 14) BEGIN set @resol14 = 1  END
			IF (@bola11 = 15) BEGIN set @resol15 = 1  END
			IF (@bola11 = 16) BEGIN set @resol16 = 1  END
			IF (@bola11 = 17) BEGIN set @resol17 = 1  END
			IF (@bola11 = 18) BEGIN set @resol18 = 1  END
			IF (@bola11 = 19) BEGIN set @resol19 = 1  END
			IF (@bola11 = 20) BEGIN set @resol20 = 1  END
			IF (@bola11 = 21) BEGIN set @resol21 = 1  END
			IF (@bola11 = 22) BEGIN set @resol22 = 1  END
			IF (@bola11 = 23) BEGIN set @resol23 = 1  END
			IF (@bola11 = 24) BEGIN set @resol24 = 1  END
			IF (@bola11 = 25) BEGIN set @resol25 = 1  END
			
			-- bola 12
			IF (@bola12 = 1)  BEGIN set @resol01 = 1  END
			IF (@bola12 = 2)  BEGIN set @resol02 = 1  END
			IF (@bola12 = 3)  BEGIN set @resol03 = 1  END
			IF (@bola12 = 4)  BEGIN set @resol04 = 1  END
			IF (@bola12 = 5)  BEGIN set @resol05 = 1  END
			IF (@bola12 = 6)  BEGIN set @resol06 = 1  END
			IF (@bola12 = 7)  BEGIN set @resol07 = 1  END
			IF (@bola12 = 8)  BEGIN set @resol08 = 1  END
			IF (@bola12 = 9)  BEGIN set @resol09 = 1  END
			IF (@bola12 = 10) BEGIN set @resol10 = 1  END
			IF (@bola12 = 11) BEGIN set @resol11 = 1  END
			IF (@bola12 = 12) BEGIN set @resol12 = 1  END
			IF (@bola12 = 13) BEGIN set @resol13 = 1  END
			IF (@bola12 = 14) BEGIN set @resol14 = 1  END
			IF (@bola12 = 15) BEGIN set @resol15 = 1  END
			IF (@bola12 = 16) BEGIN set @resol16 = 1  END
			IF (@bola12 = 17) BEGIN set @resol17 = 1  END
			IF (@bola12 = 18) BEGIN set @resol18 = 1  END
			IF (@bola12 = 19) BEGIN set @resol19 = 1  END
			IF (@bola12 = 20) BEGIN set @resol20 = 1  END
			IF (@bola12 = 21) BEGIN set @resol21 = 1  END
			IF (@bola12 = 22) BEGIN set @resol22 = 1  END
			IF (@bola12 = 23) BEGIN set @resol23 = 1  END
			IF (@bola12 = 24) BEGIN set @resol24 = 1  END
			IF (@bola12 = 25) BEGIN set @resol25 = 1  END
			
			-- bola 13
			IF (@bola13 = 1)  BEGIN set @resol01 = 1  END
			IF (@bola13 = 2)  BEGIN set @resol02 = 1  END
			IF (@bola13 = 3)  BEGIN set @resol03 = 1  END
			IF (@bola13 = 4)  BEGIN set @resol04 = 1  END
			IF (@bola13 = 5)  BEGIN set @resol05 = 1  END
			IF (@bola13 = 6)  BEGIN set @resol06 = 1  END
			IF (@bola13 = 7)  BEGIN set @resol07 = 1  END
			IF (@bola13 = 8)  BEGIN set @resol08 = 1  END
			IF (@bola13 = 9)  BEGIN set @resol09 = 1  END
			IF (@bola13 = 10) BEGIN set @resol10 = 1  END
			IF (@bola13 = 11) BEGIN set @resol11 = 1  END
			IF (@bola13 = 12) BEGIN set @resol12 = 1  END
			IF (@bola13 = 13) BEGIN set @resol13 = 1  END
			IF (@bola13 = 14) BEGIN set @resol14 = 1  END
			IF (@bola13 = 15) BEGIN set @resol15 = 1  END
			IF (@bola13 = 16) BEGIN set @resol16 = 1  END
			IF (@bola13 = 17) BEGIN set @resol17 = 1  END
			IF (@bola13 = 18) BEGIN set @resol18 = 1  END
			IF (@bola13 = 19) BEGIN set @resol19 = 1  END
			IF (@bola13 = 20) BEGIN set @resol20 = 1  END
			IF (@bola13 = 21) BEGIN set @resol21 = 1  END
			IF (@bola13 = 22) BEGIN set @resol22 = 1  END
			IF (@bola13 = 23) BEGIN set @resol23 = 1  END
			IF (@bola13 = 24) BEGIN set @resol24 = 1  END
			IF (@bola13 = 25) BEGIN set @resol25 = 1  END
			
			-- bola 14
			IF (@bola14 = 1)  BEGIN set @resol01 = 1  END
			IF (@bola14 = 2)  BEGIN set @resol02 = 1  END
			IF (@bola14 = 3)  BEGIN set @resol03 = 1  END
			IF (@bola14 = 4)  BEGIN set @resol04 = 1  END
			IF (@bola14 = 5)  BEGIN set @resol05 = 1  END
			IF (@bola14 = 6)  BEGIN set @resol06 = 1  END
			IF (@bola14 = 7)  BEGIN set @resol07 = 1  END
			IF (@bola14 = 8)  BEGIN set @resol08 = 1  END
			IF (@bola14 = 9)  BEGIN set @resol09 = 1  END
			IF (@bola14 = 10) BEGIN set @resol10 = 1  END
			IF (@bola14 = 11) BEGIN set @resol11 = 1  END
			IF (@bola14 = 12) BEGIN set @resol12 = 1  END
			IF (@bola14 = 13) BEGIN set @resol13 = 1  END
			IF (@bola14 = 14) BEGIN set @resol14 = 1  END
			IF (@bola14 = 15) BEGIN set @resol15 = 1  END
			IF (@bola14 = 16) BEGIN set @resol16 = 1  END
			IF (@bola14 = 17) BEGIN set @resol17 = 1  END
			IF (@bola14 = 18) BEGIN set @resol18 = 1  END
			IF (@bola14 = 19) BEGIN set @resol19 = 1  END
			IF (@bola14 = 20) BEGIN set @resol20 = 1  END
			IF (@bola14 = 21) BEGIN set @resol21 = 1  END
			IF (@bola14 = 22) BEGIN set @resol22 = 1  END
			IF (@bola14 = 23) BEGIN set @resol23 = 1  END
			IF (@bola14 = 24) BEGIN set @resol24 = 1  END
			IF (@bola14 = 25) BEGIN set @resol25 = 1  END
			
			-- bola 15
			IF (@bola15 = 1)  BEGIN set @resol01 = 1  END
			IF (@bola15 = 2)  BEGIN set @resol02 = 1  END
			IF (@bola15 = 3)  BEGIN set @resol03 = 1  END
			IF (@bola15 = 4)  BEGIN set @resol04 = 1  END
			IF (@bola15 = 5)  BEGIN set @resol05 = 1  END
			IF (@bola15 = 6)  BEGIN set @resol06 = 1  END
			IF (@bola15 = 7)  BEGIN set @resol07 = 1  END
			IF (@bola15 = 8)  BEGIN set @resol08 = 1  END
			IF (@bola15 = 9)  BEGIN set @resol09 = 1  END
			IF (@bola15 = 10) BEGIN set @resol10 = 1  END
			IF (@bola15 = 11) BEGIN set @resol11 = 1  END
			IF (@bola15 = 12) BEGIN set @resol12 = 1  END
			IF (@bola15 = 13) BEGIN set @resol13 = 1  END
			IF (@bola15 = 14) BEGIN set @resol14 = 1  END
			IF (@bola15 = 15) BEGIN set @resol15 = 1  END
			IF (@bola15 = 16) BEGIN set @resol16 = 1  END
			IF (@bola15 = 17) BEGIN set @resol17 = 1  END
			IF (@bola15 = 18) BEGIN set @resol18 = 1  END
			IF (@bola15 = 19) BEGIN set @resol19 = 1  END
			IF (@bola15 = 20) BEGIN set @resol20 = 1  END
			IF (@bola15 = 21) BEGIN set @resol21 = 1  END
			IF (@bola15 = 22) BEGIN set @resol22 = 1  END
			IF (@bola15 = 23) BEGIN set @resol23 = 1  END
			IF (@bola15 = 24) BEGIN set @resol24 = 1  END
			IF (@bola15 = 25) BEGIN set @resol25 = 1  END

			set @strCreateTable = @strCreateTable       +  convert(varchar,@resol01) + ',' +  convert(varchar,@resol02) + ',' +  convert(varchar,@resol03) + ',' +  convert(varchar,@resol04) + ',' +  convert(varchar,@resol05) + ',' + 
			                                               convert(varchar,@resol06) + ',' +  convert(varchar,@resol07) + ',' +  convert(varchar,@resol08) + ',' +  convert(varchar,@resol09) + ',' +  convert(varchar,@resol10) + ',' + 
														   convert(varchar,@resol11) + ',' +  convert(varchar,@resol12) + ',' +  convert(varchar,@resol13) + ',' +  convert(varchar,@resol14) + ',' +  convert(varchar,@resol15) + ',' + 
			                                               convert(varchar,@resol16) + ',' +  convert(varchar,@resol17) + ',' +  convert(varchar,@resol18) + ',' +  convert(varchar,@resol19) + ',' +  convert(varchar,@resol20) + ',' + 
			                                               convert(varchar,@resol21) + ',' +  convert(varchar,@resol22) + ',' +  convert(varchar,@resol23) + ',' +  convert(varchar,@resol24) + ',' +  convert(varchar,@resol25) +')'

			--print @strCreateTable

			exec(@strCreateTable)

		end  



		fetch next from resultado_cursor into @concurso,@DataSorteio, @bola01, @bola02, @bola03, @bola04, @bola05, 
		                                                              @bola06, @bola07, @bola08, @bola09, @bola10,
	                                                                  @bola11,@bola12,@bola13,@bola14,@bola15
	end
	close resultado_cursor
	deallocate resultado_cursor	

END
--GO

/*
-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: [sp_IndicadoresRepeticao] Succeeded'
ELSE PRINT 'Procedure Creation: [sp_IndicadoresRepeticao] Error on Creation'
GO
*/
