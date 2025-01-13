/*
   sp_AgrupaRepeticaoDezenas
   insere a qtde de repeticao de cada dezena de acordo com a ordem dos sorteios
   exec sp_AgrupaRepeticaoDezenas  [previsao para sorteio desejado], [Recuo - qtde de sorteios anteriores]
   exec sp_AgrupaRepeticaoDezenas 10,10
   select * from tblLoto_RepeticaoDezenas-- aqui guardamos os insumos de calculo
   
select  max(concurso) from tblLoto_Resultados
*/




IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_AgrupaRepeticaoDezenas]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[sp_AgrupaRepeticaoDezenas];
GO


CREATE PROCEDURE [dbo].[sp_AgrupaRepeticaoDezenas]
(
	@SorteioDesejado    int,
	@Recuo              int 
)

AS
BEGIN
	SET NOCOUNT ON

	-- limpa a tabela para iniciar zerada
	--TRUNCATE TABLE tblLoto_RepeticaoDezenas

	declare @Err			int
	declare @strCreateTable nvarchar(max)
	declare @concursoAtual	int
	
	set @strCreateTable = ''
	 
	 
	 declare
			@resultado01	varchar(2),
			@resultado02	varchar(2),
			@resultado03	varchar(2),
			@resultado04	varchar(2),
			@resultado05	varchar(2),
			@resultado06	varchar(2),
			@resultado07	varchar(2),
			@resultado08	varchar(2),
			@resultado09	varchar(2),
			@resultado10	varchar(2),
			@resultado11	varchar(2),
			@resultado12	varchar(2),
			@resultado13	varchar(2),
			@resultado14	varchar(2),
			@resultado15	varchar(2),
			@resultado16	varchar(2),
			@resultado17	varchar(2),
			@resultado18	varchar(2),
			@resultado19	varchar(2),
			@resultado20	varchar(2),
			@resultado21	varchar(2),
			@resultado22	varchar(2),
			@resultado23	varchar(2),
			@resultado24	varchar(2),
			@resultado25	varchar(2),

			@perc01			decimal(5,2),
			@perc02			decimal(5,2),
			@perc03			decimal(5,2),
			@perc04			decimal(5,2),
			@perc05			decimal(5,2),
			@perc06			decimal(5,2),
			@perc07			decimal(5,2),
			@perc08			decimal(5,2),
			@perc09			decimal(5,2),
			@perc10			decimal(5,2),
			@perc11			decimal(5,2),
			@perc12			decimal(5,2),
			@perc13			decimal(5,2),
			@perc14			decimal(5,2),
			@perc15			decimal(5,2),
			@perc16			decimal(5,2),
			@perc17			decimal(5,2),
			@perc18			decimal(5,2),
			@perc19			decimal(5,2),
			@perc20			decimal(5,2),
			@perc21			decimal(5,2),
			@perc22			decimal(5,2),
			@perc23			decimal(5,2),
			@perc24			decimal(5,2),
			@perc25			decimal(5,2),
			@perc 			decimal(5,2),
	
			@Concurso			int,
			@resultado			int,
			@Numero				int,
			@Acao				varchar(1),
			@QtdeRepeticao		int,
			@Sequencia			int,
			@ConcursoInicial    int,
			@ConcursoFinal		int,

			@UltimoAcao     	varchar(1),
			@UltimaRepeticao    int,
			@QtdeMaior			int,
			@QtdeTotal			int,
			@cnt INT

	select @ConcursoInicial = @SorteioDesejado - ( @Recuo + 1)
	select @ConcursoFinal   = @SorteioDesejado - 1 
	--if(@ConcursoInicial < 1) begin set @ConcursoInicial = 1 end
	
	--select @ConcursoFinal    = max(Concurso) from tblLoto_MapaTexto
	--select @ConcursoInicial  = max(Concurso) from tblLoto_RepeticaoDezena
	if  @ConcursoInicial   is null 
	begin 
		set @ConcursoInicial  = 0 
	end 

	set @cnt= 1;
	WHILE @cnt <= 25
	BEGIN
	-- inicia o loop


		set @Numero			= @cnt
		set @Acao 		    = '' 
		set @UltimoAcao     = ''
		set @QtdeRepeticao	= 0
		set @Sequencia		= 0
				 
		declare resultado_cursor cursor for
		select Concurso, NR01,NR02,NR03,NR04,NR05,
		                 NR06,NR07,NR08,NR09,NR10,
						 NR11,NR12,NR13,NR14,NR15,
						 NR16,NR17,NR18,NR19,NR20,
						 NR21,NR22,NR23,NR24,NR25	
		from tblLoto_MapaTexto 
		where Concurso >= @ConcursoInicial
		  and Concurso <=  @ConcursoFinal
		order by Concurso

		open resultado_cursor
		fetch next from resultado_cursor into @Concurso,@resultado01, @resultado02, @resultado03, @resultado04, @resultado05,
														@resultado06, @resultado07, @resultado08, @resultado09, @resultado10,
														@resultado11, @resultado12, @resultado13, @resultado14, @resultado15,
														@resultado16, @resultado17, @resultado18, @resultado19, @resultado20,
														@resultado21, @resultado22, @resultado23, @resultado24, @resultado25
	
		while @@fetch_status = 0
		begin		
		    set @Acao = 'A'  --- aparece
			IF( @cnt =  1 and trim(@resultado01) <> '' ) BEGIN set @Acao = 'E' END -- nao aparece
			IF( @cnt =  2 and trim(@resultado02) <> '' ) BEGIN set @Acao = 'E' END
			IF( @cnt =  3 and trim(@resultado03) <> '' ) BEGIN set @Acao = 'E' END
			IF( @cnt =  4 and trim(@resultado04) <> '' ) BEGIN set @Acao = 'E' END
			IF( @cnt =  5 and trim(@resultado05) <> '' ) BEGIN set @Acao = 'E' END
			IF( @cnt =  6 and trim(@resultado06) <> '' ) BEGIN set @Acao = 'E' END
			IF( @cnt =  7 and trim(@resultado07) <> '' ) BEGIN set @Acao = 'E' END
			IF( @cnt =  8 and trim(@resultado08) <> '' ) BEGIN set @Acao = 'E' END
			IF( @cnt =  9 and trim(@resultado09) <> '' ) BEGIN set @Acao = 'E' END
			IF( @cnt = 10 and trim(@resultado10) <> '' ) BEGIN set @Acao = 'E' END
			IF( @cnt = 11 and trim(@resultado11) <> '' ) BEGIN set @Acao = 'E' END
			IF( @cnt = 12 and trim(@resultado12) <> '' ) BEGIN set @Acao = 'E' END
			IF( @cnt = 13 and trim(@resultado13) <> '' ) BEGIN set @Acao = 'E' END
			IF( @cnt = 14 and trim(@resultado14) <> '' ) BEGIN set @Acao = 'E' END
			IF( @cnt = 15 and trim(@resultado15) <> '' ) BEGIN set @Acao = 'E' END
			IF( @cnt = 16 and trim(@resultado16) <> '' ) BEGIN set @Acao = 'E' END
			IF( @cnt = 17 and trim(@resultado17) <> '' ) BEGIN set @Acao = 'E' END
			IF( @cnt = 18 and trim(@resultado18) <> '' ) BEGIN set @Acao = 'E' END
			IF( @cnt = 19 and trim(@resultado19) <> '' ) BEGIN set @Acao = 'E' END
			IF( @cnt = 20 and trim(@resultado20) <> '' ) BEGIN set @Acao = 'E' END
			IF( @cnt = 21 and trim(@resultado21) <> '' ) BEGIN set @Acao = 'E' END
			IF( @cnt = 22 and trim(@resultado22) <> '' ) BEGIN set @Acao = 'E' END
			IF( @cnt = 23 and trim(@resultado23) <> '' ) BEGIN set @Acao = 'E' END
			IF( @cnt = 24 and trim(@resultado24) <> '' ) BEGIN set @Acao = 'E' END
			IF( @cnt = 25 and trim(@resultado25) <> '' ) BEGIN set @Acao = 'E' END
			-- .................... se ultimo Numero = 2 inicia o processo
			if (@UltimoAcao = '') 
			begin
			   set @UltimoAcao = @Acao 
			end
	   
			if (@UltimoAcao = @Acao) 
			begin
				set @QtdeRepeticao = @QtdeRepeticao + 1
			end
			else
			begin
				-- grava os dados
				set @Sequencia = @Sequencia + 1
				insert into tblLoto_RepeticaoDezenas(Concurso, Numero, OrdemSequencial, Acao, QtdeRepeticao) 
				values(@Concurso, @cnt, @Sequencia, @UltimoAcao, @QtdeRepeticao)
				-- limpa as variaveis
				set @UltimoAcao = @Acao 
				set @QtdeRepeticao = 1
			end
			
		fetch next from resultado_cursor into @Concurso,@resultado01, @resultado02, @resultado03, @resultado04, @resultado05,
														@resultado06, @resultado07, @resultado08, @resultado09, @resultado10,
														@resultado11, @resultado12, @resultado13, @resultado14, @resultado15,
														@resultado16, @resultado17, @resultado18, @resultado19, @resultado20,
														@resultado21, @resultado22, @resultado23, @resultado24, @resultado25

		end
		close resultado_cursor
		deallocate resultado_cursor	
		
		-- .............................................. grava a ultima acao se for a mesma da anterior
        if (@UltimoAcao = @Acao) 
		begin
			set @Sequencia = @Sequencia + 1
			insert into tblLoto_RepeticaoDezenas(Concurso, Numero, OrdemSequencial, Acao, QtdeRepeticao) 
			values(@Concurso, @cnt, @Sequencia, @UltimoAcao, @QtdeRepeticao)
		end
		
		
	-- avanca o loop
		set @cnt = @cnt + 1
		set @UltimoAcao = ''
		set @QtdeRepeticao	= 0
		set @Sequencia		= 0
	END
END
/*
 TRUNCATE TABLE tblLoto_RepeticaoDezenas
   exec sp_AgrupaRepeticaoDezenas 10,10

 select top 10 * from tblLoto_MapaTexto 
 select * from tblLoto_RepeticaoDezenas
select sum(QtdeRepeticao) 
from tblLoto_RepeticaoDezenas
where numero = 3
conc numero seq acao qtde
2	  1	     1	  A	  1
8	  1	     2	  E	  7

*/