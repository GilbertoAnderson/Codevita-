/*
	sp_combinacoes_repetidas
    identifica quantas vezes o jogo seria premiado se fosse jogado desde o inicio

	DBrasil Gilberto Anderson Julho 2021
	-- ........................................................
	exec sp_combinacoes_repetidas_site 
	select *  from Indicadores
	select *  from Sorteios
	
    select max(qtdeTotal)as qtde from Indicadores
	
    select qtdeTotal as qtde, concurso  from Indicadores
	order by qtdetotal  desc, concurso

*/



IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_combinacoes_repetidas_site]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].sp_combinacoes_repetidas_site;
GO


CREATE PROCEDURE [dbo].sp_combinacoes_repetidas_site
AS
BEGIN
	SET NOCOUNT ON

	
	declare @Concurso		int,
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

			@rConcurso		int,
			@rbola01		int,
			@rbola02		int,
			@rbola03		int,
			@rbola04		int,
			@rbola05		int,
			@rbola06		int,
			@rbola07		int,
			@rbola08		int,
			@rbola09		int,
			@rbola10		int,
			@rbola11		int,
			@rbola12		int,
			@rbola13		int,
			@rbola14		int,
			@rbola15		int,

	
			@Qtde06			int,
			@Qtde07			int,
			@Qtde08			int,
			@Qtde09			int,
			@Qtde10			int,
			@Qtde11			int,
			@Qtde12			int,
			@Qtde13			int,
			@Qtde14			int,
			@Qtde15			int,

	        @li_QtdeTotal   int,
			@count			int


	-- pode selecionar o ultimo e partir dai
	
	---- limpa os dados acima de 90000
	---delete from tblLoto_IndicadoresDezenas where concurso  >= 90000
	--select @Concurso = max(Concurso) from tblLoto_IndicadoresDezenas
	truncate table Indicadores
	
	declare resultado_cursor cursor for
	select Concurso, DataSorteio, Dez01, Dez02, Dez03, Dez04, Dez05, Dez06, Dez07, Dez08, Dez09, Dez10, Dez11, Dez12, Dez13, Dez14, Dez15
	from Sorteios
	order by Concurso

	open resultado_cursor
	fetch next from resultado_cursor into @Concurso, @DataSorteio, @bola01, @bola02, @bola03, @bola04, @bola05,
	                                                               @bola06, @bola07, @bola08, @bola09, @bola10,
	                                                               @bola11, @bola12, @bola13, @bola14, @bola15
	while @@fetch_status = 0
	begin
		-- vai zerar as variaveis de qtde
		set @Qtde06 = 0
		set @Qtde07 = 0
		set @Qtde08 = 0
		set @Qtde09 = 0
		set @Qtde10 = 0
		set @Qtde11 = 0
		set @Qtde12 = 0
		set @Qtde13 = 0
		set @Qtde14 = 0
		set @Qtde15 = 0

		-- vai comparar os numeros que sairam com os outros resultados e somar a qtde de numeros que são iguais
		declare compara_cursor cursor for
		select Concurso,  bola01, bola02, bola03, bola04, bola05, bola06, bola07, bola08, bola09, bola10, bola11, bola12, bola13, bola14, bola15
		from tblLoto_Resultados order by Concurso

		open compara_cursor
		
		fetch next from compara_cursor into @rConcurso, @rbola01, @rbola02, @rbola03, @rbola04, @rbola05, 
		                                                @rbola06, @rbola07, @rbola08, @rbola09, @rbola10,
	                                                    @rbola11, @rbola12, @rbola13, @rbola14, @rbola15
		while @@fetch_status = 0
		begin
			-- limpa variavel que vai atualizar
			set @count = 0

			-- inicia as comparações
			-- bola 01
			IF (@bola01 = @rbola01)  BEGIN set @count = @count + 1  END
			IF (@bola01 = @rbola02)  BEGIN set @count = @count + 1  END
			IF (@bola01 = @rbola03)  BEGIN set @count = @count + 1  END
			IF (@bola01 = @rbola04)  BEGIN set @count = @count + 1  END
			IF (@bola01 = @rbola05)  BEGIN set @count = @count + 1  END
			IF (@bola01 = @rbola06)  BEGIN set @count = @count + 1  END
			IF (@bola01 = @rbola07)  BEGIN set @count = @count + 1  END
			IF (@bola01 = @rbola08)  BEGIN set @count = @count + 1  END
			IF (@bola01 = @rbola09)  BEGIN set @count = @count + 1  END
			IF (@bola01 = @rbola10)  BEGIN set @count = @count + 1  END
			IF (@bola01 = @rbola11)  BEGIN set @count = @count + 1  END
			IF (@bola01 = @rbola12)  BEGIN set @count = @count + 1  END
			IF (@bola01 = @rbola13)  BEGIN set @count = @count + 1  END
			IF (@bola01 = @rbola14)  BEGIN set @count = @count + 1  END
			IF (@bola01 = @rbola15)  BEGIN set @count = @count + 1  END

			
			-- bola 02
			IF (@bola02 = @rbola01)  BEGIN set @count = @count + 1  END
			IF (@bola02 = @rbola02)  BEGIN set @count = @count + 1  END
			IF (@bola02 = @rbola03)  BEGIN set @count = @count + 1  END
			IF (@bola02 = @rbola04)  BEGIN set @count = @count + 1  END
			IF (@bola02 = @rbola05)  BEGIN set @count = @count + 1  END
			IF (@bola02 = @rbola06)  BEGIN set @count = @count + 1  END
			IF (@bola02 = @rbola07)  BEGIN set @count = @count + 1  END
			IF (@bola02 = @rbola08)  BEGIN set @count = @count + 1  END
			IF (@bola02 = @rbola09)  BEGIN set @count = @count + 1  END
			IF (@bola02 = @rbola10)  BEGIN set @count = @count + 1  END
			IF (@bola02 = @rbola11)  BEGIN set @count = @count + 1  END
			IF (@bola02 = @rbola12)  BEGIN set @count = @count + 1  END
			IF (@bola02 = @rbola13)  BEGIN set @count = @count + 1  END
			IF (@bola02 = @rbola14)  BEGIN set @count = @count + 1  END
			IF (@bola02 = @rbola15)  BEGIN set @count = @count + 1  END
			
			-- bola 03
			IF (@bola03 = @rbola01)  BEGIN set @count = @count + 1  END
			IF (@bola03 = @rbola02)  BEGIN set @count = @count + 1  END
			IF (@bola03 = @rbola03)  BEGIN set @count = @count + 1  END
			IF (@bola03 = @rbola04)  BEGIN set @count = @count + 1  END
			IF (@bola03 = @rbola05)  BEGIN set @count = @count + 1  END
			IF (@bola03 = @rbola06)  BEGIN set @count = @count + 1  END
			IF (@bola03 = @rbola07)  BEGIN set @count = @count + 1  END
			IF (@bola03 = @rbola08)  BEGIN set @count = @count + 1  END
			IF (@bola03 = @rbola09)  BEGIN set @count = @count + 1  END
			IF (@bola03 = @rbola10)  BEGIN set @count = @count + 1  END
			IF (@bola03 = @rbola11)  BEGIN set @count = @count + 1  END
			IF (@bola03 = @rbola12)  BEGIN set @count = @count + 1  END
			IF (@bola03 = @rbola13)  BEGIN set @count = @count + 1  END
			IF (@bola03 = @rbola14)  BEGIN set @count = @count + 1  END
			IF (@bola03 = @rbola15)  BEGIN set @count = @count + 1  END
			
			-- bola 04
			IF (@bola04 = @rbola01)  BEGIN set @count = @count + 1  END
			IF (@bola04 = @rbola02)  BEGIN set @count = @count + 1  END
			IF (@bola04 = @rbola03)  BEGIN set @count = @count + 1  END
			IF (@bola04 = @rbola04)  BEGIN set @count = @count + 1  END
			IF (@bola04 = @rbola05)  BEGIN set @count = @count + 1  END
			IF (@bola04 = @rbola06)  BEGIN set @count = @count + 1  END
			IF (@bola04 = @rbola07)  BEGIN set @count = @count + 1  END
			IF (@bola04 = @rbola08)  BEGIN set @count = @count + 1  END
			IF (@bola04 = @rbola09)  BEGIN set @count = @count + 1  END
			IF (@bola04 = @rbola10)  BEGIN set @count = @count + 1  END
			IF (@bola04 = @rbola11)  BEGIN set @count = @count + 1  END
			IF (@bola04 = @rbola12)  BEGIN set @count = @count + 1  END
			IF (@bola04 = @rbola13)  BEGIN set @count = @count + 1  END
			IF (@bola04 = @rbola14)  BEGIN set @count = @count + 1  END
			IF (@bola04 = @rbola15)  BEGIN set @count = @count + 1  END

			
			-- bola 05
			IF (@bola05 = @rbola01)  BEGIN set @count = @count + 1  END
			IF (@bola05 = @rbola02)  BEGIN set @count = @count + 1  END
			IF (@bola05 = @rbola03)  BEGIN set @count = @count + 1  END
			IF (@bola05 = @rbola04)  BEGIN set @count = @count + 1  END
			IF (@bola05 = @rbola05)  BEGIN set @count = @count + 1  END
			IF (@bola05 = @rbola06)  BEGIN set @count = @count + 1  END
			IF (@bola05 = @rbola07)  BEGIN set @count = @count + 1  END
			IF (@bola05 = @rbola08)  BEGIN set @count = @count + 1  END
			IF (@bola05 = @rbola09)  BEGIN set @count = @count + 1  END
			IF (@bola05 = @rbola10)  BEGIN set @count = @count + 1  END
			IF (@bola05 = @rbola11)  BEGIN set @count = @count + 1  END
			IF (@bola05 = @rbola12)  BEGIN set @count = @count + 1  END
			IF (@bola05 = @rbola13)  BEGIN set @count = @count + 1  END
			IF (@bola05 = @rbola14)  BEGIN set @count = @count + 1  END
			IF (@bola05 = @rbola15)  BEGIN set @count = @count + 1  END


			
			-- bola 06
			IF (@bola06 = @rbola01)  BEGIN set @count = @count + 1  END
			IF (@bola06 = @rbola02)  BEGIN set @count = @count + 1  END
			IF (@bola06 = @rbola03)  BEGIN set @count = @count + 1  END
			IF (@bola06 = @rbola04)  BEGIN set @count = @count + 1  END
			IF (@bola06 = @rbola05)  BEGIN set @count = @count + 1  END
			IF (@bola06 = @rbola06)  BEGIN set @count = @count + 1  END
			IF (@bola06 = @rbola07)  BEGIN set @count = @count + 1  END
			IF (@bola06 = @rbola08)  BEGIN set @count = @count + 1  END
			IF (@bola06 = @rbola09)  BEGIN set @count = @count + 1  END
			IF (@bola06 = @rbola10)  BEGIN set @count = @count + 1  END
			IF (@bola06 = @rbola11)  BEGIN set @count = @count + 1  END
			IF (@bola06 = @rbola12)  BEGIN set @count = @count + 1  END
			IF (@bola06 = @rbola13)  BEGIN set @count = @count + 1  END
			IF (@bola06 = @rbola14)  BEGIN set @count = @count + 1  END
			IF (@bola06 = @rbola15)  BEGIN set @count = @count + 1  END

			
			-- bola 07
			IF (@bola07 = @rbola01)  BEGIN set @count = @count + 1  END
			IF (@bola07 = @rbola02)  BEGIN set @count = @count + 1  END
			IF (@bola07 = @rbola03)  BEGIN set @count = @count + 1  END
			IF (@bola07 = @rbola04)  BEGIN set @count = @count + 1  END
			IF (@bola07 = @rbola05)  BEGIN set @count = @count + 1  END
			IF (@bola07 = @rbola06)  BEGIN set @count = @count + 1  END
			IF (@bola07 = @rbola07)  BEGIN set @count = @count + 1  END
			IF (@bola07 = @rbola08)  BEGIN set @count = @count + 1  END
			IF (@bola07 = @rbola09)  BEGIN set @count = @count + 1  END
			IF (@bola07 = @rbola10)  BEGIN set @count = @count + 1  END
			IF (@bola07 = @rbola11)  BEGIN set @count = @count + 1  END
			IF (@bola07 = @rbola12)  BEGIN set @count = @count + 1  END
			IF (@bola07 = @rbola13)  BEGIN set @count = @count + 1  END
			IF (@bola07 = @rbola14)  BEGIN set @count = @count + 1  END
			IF (@bola07 = @rbola15)  BEGIN set @count = @count + 1  END

			
			-- bola 01
			IF (@bola08 = @rbola01)  BEGIN set @count = @count + 1  END
			IF (@bola08 = @rbola02)  BEGIN set @count = @count + 1  END
			IF (@bola08 = @rbola03)  BEGIN set @count = @count + 1  END
			IF (@bola08 = @rbola04)  BEGIN set @count = @count + 1  END
			IF (@bola08 = @rbola05)  BEGIN set @count = @count + 1  END
			IF (@bola08 = @rbola06)  BEGIN set @count = @count + 1  END
			IF (@bola08 = @rbola07)  BEGIN set @count = @count + 1  END
			IF (@bola08 = @rbola08)  BEGIN set @count = @count + 1  END
			IF (@bola08 = @rbola09)  BEGIN set @count = @count + 1  END
			IF (@bola08 = @rbola10)  BEGIN set @count = @count + 1  END
			IF (@bola08 = @rbola11)  BEGIN set @count = @count + 1  END
			IF (@bola08 = @rbola12)  BEGIN set @count = @count + 1  END
			IF (@bola08 = @rbola13)  BEGIN set @count = @count + 1  END
			IF (@bola08 = @rbola14)  BEGIN set @count = @count + 1  END
			IF (@bola08 = @rbola15)  BEGIN set @count = @count + 1  END
					   			
			-- bola 09
			IF (@bola09 = @rbola01)  BEGIN set @count = @count + 1  END
			IF (@bola09 = @rbola02)  BEGIN set @count = @count + 1  END
			IF (@bola09 = @rbola03)  BEGIN set @count = @count + 1  END
			IF (@bola09 = @rbola04)  BEGIN set @count = @count + 1  END
			IF (@bola09 = @rbola05)  BEGIN set @count = @count + 1  END
			IF (@bola09 = @rbola06)  BEGIN set @count = @count + 1  END
			IF (@bola09 = @rbola07)  BEGIN set @count = @count + 1  END
			IF (@bola09 = @rbola08)  BEGIN set @count = @count + 1  END
			IF (@bola09 = @rbola09)  BEGIN set @count = @count + 1  END
			IF (@bola09 = @rbola10)  BEGIN set @count = @count + 1  END
			IF (@bola09 = @rbola11)  BEGIN set @count = @count + 1  END
			IF (@bola09 = @rbola12)  BEGIN set @count = @count + 1  END
			IF (@bola09 = @rbola13)  BEGIN set @count = @count + 1  END
			IF (@bola09 = @rbola14)  BEGIN set @count = @count + 1  END
			IF (@bola09 = @rbola15)  BEGIN set @count = @count + 1  END

			
			-- bola 10
			IF (@bola10 = @rbola01)  BEGIN set @count = @count + 1  END
			IF (@bola10 = @rbola02)  BEGIN set @count = @count + 1  END
			IF (@bola10 = @rbola03)  BEGIN set @count = @count + 1  END
			IF (@bola10 = @rbola04)  BEGIN set @count = @count + 1  END
			IF (@bola10 = @rbola05)  BEGIN set @count = @count + 1  END
			IF (@bola10 = @rbola06)  BEGIN set @count = @count + 1  END
			IF (@bola10 = @rbola07)  BEGIN set @count = @count + 1  END
			IF (@bola10 = @rbola08)  BEGIN set @count = @count + 1  END
			IF (@bola10 = @rbola09)  BEGIN set @count = @count + 1  END
			IF (@bola10 = @rbola10)  BEGIN set @count = @count + 1  END
			IF (@bola10 = @rbola11)  BEGIN set @count = @count + 1  END
			IF (@bola10 = @rbola12)  BEGIN set @count = @count + 1  END
			IF (@bola10 = @rbola13)  BEGIN set @count = @count + 1  END
			IF (@bola10 = @rbola14)  BEGIN set @count = @count + 1  END
			IF (@bola10 = @rbola15)  BEGIN set @count = @count + 1  END
			
			-- bola 11
			IF (@bola11 = @rbola01)  BEGIN set @count = @count + 1  END
			IF (@bola11 = @rbola02)  BEGIN set @count = @count + 1  END
			IF (@bola11 = @rbola03)  BEGIN set @count = @count + 1  END
			IF (@bola11 = @rbola04)  BEGIN set @count = @count + 1  END
			IF (@bola11 = @rbola05)  BEGIN set @count = @count + 1  END
			IF (@bola11 = @rbola06)  BEGIN set @count = @count + 1  END
			IF (@bola11 = @rbola07)  BEGIN set @count = @count + 1  END
			IF (@bola11 = @rbola08)  BEGIN set @count = @count + 1  END
			IF (@bola11 = @rbola09)  BEGIN set @count = @count + 1  END
			IF (@bola11 = @rbola10)  BEGIN set @count = @count + 1  END
			IF (@bola11 = @rbola11)  BEGIN set @count = @count + 1  END
			IF (@bola11 = @rbola12)  BEGIN set @count = @count + 1  END
			IF (@bola11 = @rbola13)  BEGIN set @count = @count + 1  END
			IF (@bola11 = @rbola14)  BEGIN set @count = @count + 1  END
			IF (@bola11 = @rbola15)  BEGIN set @count = @count + 1  END

			
			-- bola 12
			IF (@bola12 = @rbola01)  BEGIN set @count = @count + 1  END
			IF (@bola12 = @rbola02)  BEGIN set @count = @count + 1  END
			IF (@bola12 = @rbola03)  BEGIN set @count = @count + 1  END
			IF (@bola12 = @rbola04)  BEGIN set @count = @count + 1  END
			IF (@bola12 = @rbola05)  BEGIN set @count = @count + 1  END
			IF (@bola12 = @rbola06)  BEGIN set @count = @count + 1  END
			IF (@bola12 = @rbola07)  BEGIN set @count = @count + 1  END
			IF (@bola12 = @rbola08)  BEGIN set @count = @count + 1  END
			IF (@bola12 = @rbola09)  BEGIN set @count = @count + 1  END
			IF (@bola12 = @rbola10)  BEGIN set @count = @count + 1  END
			IF (@bola12 = @rbola11)  BEGIN set @count = @count + 1  END
			IF (@bola12 = @rbola12)  BEGIN set @count = @count + 1  END
			IF (@bola12 = @rbola13)  BEGIN set @count = @count + 1  END
			IF (@bola12 = @rbola14)  BEGIN set @count = @count + 1  END
			IF (@bola12 = @rbola15)  BEGIN set @count = @count + 1  END
			
			-- bola 13
			IF (@bola13 = @rbola01)  BEGIN set @count = @count + 1  END
			IF (@bola13 = @rbola02)  BEGIN set @count = @count + 1  END
			IF (@bola13 = @rbola03)  BEGIN set @count = @count + 1  END
			IF (@bola13 = @rbola04)  BEGIN set @count = @count + 1  END
			IF (@bola13 = @rbola05)  BEGIN set @count = @count + 1  END
			IF (@bola13 = @rbola06)  BEGIN set @count = @count + 1  END
			IF (@bola13 = @rbola07)  BEGIN set @count = @count + 1  END
			IF (@bola13 = @rbola08)  BEGIN set @count = @count + 1  END
			IF (@bola13 = @rbola09)  BEGIN set @count = @count + 1  END
			IF (@bola13 = @rbola10)  BEGIN set @count = @count + 1  END
			IF (@bola13 = @rbola11)  BEGIN set @count = @count + 1  END
			IF (@bola13 = @rbola12)  BEGIN set @count = @count + 1  END
			IF (@bola13 = @rbola13)  BEGIN set @count = @count + 1  END
			IF (@bola13 = @rbola14)  BEGIN set @count = @count + 1  END
			IF (@bola13 = @rbola15)  BEGIN set @count = @count + 1  END
			
			-- bola 14
			IF (@bola14 = @rbola01)  BEGIN set @count = @count + 1  END
			IF (@bola14 = @rbola02)  BEGIN set @count = @count + 1  END
			IF (@bola14 = @rbola03)  BEGIN set @count = @count + 1  END
			IF (@bola14 = @rbola04)  BEGIN set @count = @count + 1  END
			IF (@bola14 = @rbola05)  BEGIN set @count = @count + 1  END
			IF (@bola14 = @rbola06)  BEGIN set @count = @count + 1  END
			IF (@bola14 = @rbola07)  BEGIN set @count = @count + 1  END
			IF (@bola14 = @rbola08)  BEGIN set @count = @count + 1  END
			IF (@bola14 = @rbola09)  BEGIN set @count = @count + 1  END
			IF (@bola14 = @rbola10)  BEGIN set @count = @count + 1  END
			IF (@bola14 = @rbola11)  BEGIN set @count = @count + 1  END
			IF (@bola14 = @rbola12)  BEGIN set @count = @count + 1  END
			IF (@bola14 = @rbola13)  BEGIN set @count = @count + 1  END
			IF (@bola14 = @rbola14)  BEGIN set @count = @count + 1  END
			IF (@bola14 = @rbola15)  BEGIN set @count = @count + 1  END

			
			-- bola 15
			IF (@bola15 = @rbola01)  BEGIN set @count = @count + 1  END
			IF (@bola15 = @rbola02)  BEGIN set @count = @count + 1  END
			IF (@bola15 = @rbola03)  BEGIN set @count = @count + 1  END
			IF (@bola15 = @rbola04)  BEGIN set @count = @count + 1  END
			IF (@bola15 = @rbola05)  BEGIN set @count = @count + 1  END
			IF (@bola15 = @rbola06)  BEGIN set @count = @count + 1  END
			IF (@bola15 = @rbola07)  BEGIN set @count = @count + 1  END
			IF (@bola15 = @rbola08)  BEGIN set @count = @count + 1  END
			IF (@bola15 = @rbola09)  BEGIN set @count = @count + 1  END
			IF (@bola15 = @rbola10)  BEGIN set @count = @count + 1  END
			IF (@bola15 = @rbola11)  BEGIN set @count = @count + 1  END
			IF (@bola15 = @rbola12)  BEGIN set @count = @count + 1  END
			IF (@bola15 = @rbola13)  BEGIN set @count = @count + 1  END
			IF (@bola15 = @rbola14)  BEGIN set @count = @count + 1  END
			IF (@bola15 = @rbola15)  BEGIN set @count = @count + 1  END

			


			-- atualiza as variaveis totalizadoras
			if @count =  6 set @Qtde06 = @Qtde06 + 1
			if @count =  7 set @Qtde07 = @Qtde07 + 1
			if @count =  8 set @Qtde08 = @Qtde08 + 1
			if @count =  9 set @Qtde09 = @Qtde09 + 1
			if @count = 10 set @Qtde10 = @Qtde10 + 1
			if @count = 11 set @Qtde11 = @Qtde11 + 1
			if @count = 12 set @Qtde12 = @Qtde12 + 1
			if @count = 13 set @Qtde13 = @Qtde13 + 1
			if @count = 14 set @Qtde14 = @Qtde14 + 1
			if @count = 15 set @Qtde15 = @Qtde15 + 1


			--print convert(varchar,@Concurso) + '/' + convert(varchar,@rConcurso)
	  
		    fetch next from compara_cursor into @rConcurso, @rbola01, @rbola02, @rbola03, @rbola04, @rbola05, 
		                                                    @rbola06, @rbola07, @rbola08, @rbola09, @rbola10,
	                                                        @rbola11, @rbola12, @rbola13, @rbola14, @rbola15
		end
		close compara_cursor
		deallocate compara_cursor	
		--set @li_QtdeTotal =  @Qtde06 + @Qtde07 + @Qtde08 + @Qtde09 +  @Qtde10 + @Qtde11 + @Qtde12 + @Qtde13 + @Qtde14 + @Qtde15	
		
		set @li_QtdeTotal =  @Qtde11 + @Qtde12 + @Qtde13 + @Qtde14 + @Qtde15	
		-- vai gravar a qtde de vezes que combinou 11,12,13,14 e 15 vezes
		insert into Indicadores(Concurso, DataSorteio, NR01,NR02,NR03,NR04,NR05,NR06,NR07,NR08,NR09,NR10,NR11,NR12,NR13,NR14,NR15,Qtde06,Qtde07,Qtde08,Qtde09,Qtde10,Qtde11,Qtde12,Qtde13,Qtde14,Qtde15,QtdeTotal) 
		values(@Concurso, @DataSorteio, @bola01, @bola02, @bola03, @bola04, @bola05, @bola06, @bola07, @bola08, @bola09, @bola10, @bola11, @bola12, @bola13, @bola14, @bola15, @Qtde06, @Qtde07, @Qtde08, @Qtde09, @Qtde10, @Qtde11, @Qtde12, @Qtde13,@Qtde14,@Qtde15, @li_QtdeTotal)

	
	    fetch next from resultado_cursor into @Concurso, @DataSorteio, @bola01, @bola02, @bola03, @bola04, @bola05,
	                                                               @bola06, @bola07, @bola08, @bola09, @bola10,
	                                                               @bola11, @bola12, @bola13, @bola14, @bola15
	
	end
	close resultado_cursor
	deallocate resultado_cursor	

END