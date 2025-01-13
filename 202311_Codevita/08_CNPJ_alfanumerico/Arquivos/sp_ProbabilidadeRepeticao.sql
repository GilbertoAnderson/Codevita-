/*
   proc sp_ProbabilidadeRepeticao
   calcula o percentual de acerto de cada dezena em um determinado sorteio
   exec sp_ProbabilidadeRepeticao [previsao para sorteio desejado], [Recuo - qtde de sorteios anteriores]
   
   exec sp_AgrupaRepeticaoDezenas 
   exec sp_ProbabilidadeRepeticao 

   select * from tblLoto_RepeticaoDezenas order by concurso desc
   
   -- aqui guardamos os insumos de calculo
   select * from tblLoto_MapaPercentual 
   order by concurso desc
     where concurso = 3256 -- aqui quardamos o resultado
*/



/*
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_ProbabilidadeRepeticao]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[sp_ProbabilidadeRepeticao];
GO
*/

CREATE PROCEDURE [dbo].[sp_ProbabilidadeRepeticao]

AS
BEGIN
	SET NOCOUNT ON

	
	 -- .................... declara variaveis
	 declare

			@perc01				decimal(8,2),
			@perc02				decimal(8,2),
			@perc03				decimal(8,2),
			@perc04				decimal(8,2),
			@perc05				decimal(8,2),
			@perc06				decimal(8,2),
			@perc07				decimal(8,2),
			@perc08				decimal(8,2),
			@perc09				decimal(8,2),
			@perc10				decimal(8,2),
			@perc11				decimal(8,2),
			@perc12				decimal(8,2),
			@perc13				decimal(8,2),
			@perc14				decimal(8,2),
			@perc15				decimal(8,2),
			@perc16				decimal(8,2),
			@perc17				decimal(8,2),
			@perc18				decimal(8,2),
			@perc19				decimal(8,2),
			@perc20				decimal(8,2),
			@perc21				decimal(8,2),
			@perc22				decimal(8,2),
			@perc23				decimal(8,2),
			@perc24				decimal(8,2),
			@perc25				decimal(8,2),
			@perc 				decimal(8,2),	
			@acao01				varchar(1),
			@acao02				varchar(1),
			@acao03				varchar(1),
			@acao04				varchar(1),
			@acao05				varchar(1),
			@acao06				varchar(1),
			@acao07				varchar(1),
			@acao08				varchar(1),
			@acao09				varchar(1),
			@acao10				varchar(1),
			@acao11				varchar(1),
			@acao12				varchar(1),
			@acao13				varchar(1),
			@acao14				varchar(1),
			@acao15				varchar(1),
			@acao16				varchar(1),
			@acao17				varchar(1),
			@acao18				varchar(1),
			@acao19				varchar(1),
			@acao20				varchar(1),
			@acao21				varchar(1),
			@acao22				varchar(1),
			@acao23				varchar(1),
			@acao24				varchar(1),
			@acao25				varchar(1),
			@UltimoAcao     	varchar(1),

			@QtdeMaior			decimal(8,2),
			@QtdeTotal			decimal(8,2),
			@UltimaRepeticao    int,
			@cnt				int,
			
			@Concurso           int
			
			
    select @Concurso = max(Concurso) from tblLoto_RepeticaoDezenas

    --- popula valores variaveis iniciais
	--set @Recuo = @SorteioDesejado - @Recuo   
	--if ( @Recuo < 1 ) begin  set @Recuo = 1 end 
    
	set @cnt = 1

	set  @perc01 = 0
	set  @perc02 = 0
	set  @perc03 = 0
	set  @perc04 = 0
	set  @perc05 = 0
	set  @perc06 = 0
	set  @perc07 = 0
	set  @perc08 = 0
	set  @perc09 = 0
	set  @perc10 = 0
	set  @perc11 = 0
	set  @perc12 = 0
	set  @perc13 = 0
	set  @perc14 = 0
	set  @perc15 = 0
	set  @perc16 = 0
	set  @perc17 = 0
	set  @perc18 = 0
	set  @perc19 = 0
	set  @perc20 = 0
	set  @perc21 = 0
	set  @perc22 = 0
	set  @perc23 = 0
	set  @perc24 = 0
	set  @perc25 = 0

	-- limpa os dados deste sorteio se houverem



	WHILE @cnt <= 25
	BEGIN
	-- inicia o loop
	    -- ..................................................................................pega a ultima Acao e a ultima repeticao 
		select top 1 @UltimoAcao = Acao , @UltimaRepeticao = QtdeRepeticao from tblLoto_RepeticaoDezenas
		where Numero  = @cnt 
		order by OrdemSequencial desc
		/*
		print '@cnt             = ' + convert(varchar,@cnt)
		print '@UltimoAcao      = ' + @UltimoAcao
		print '@UltimaRepeticao = ' + convert(varchar,@UltimaRepeticao)
*/
		-- ...................................................................................calula a probabilidade da proxima acao
		select @qtdeMaior = SUM(1) from tblLoto_RepeticaoDezenas
		where Numero  = @cnt 
		  and QtdeRepeticao > @UltimaRepeticao
		  and Acao =  @UltimoAcao 
		--print '@qtdeMaior = ' + convert(varchar,@qtdeMaior)
		if (@qtdeMaior is null) begin set @qtdeMaior = 0 end

		select @QtdeTotal = SUM(1) from tblLoto_RepeticaoDezenas
		where Numero  = @cnt 
		  and Acao =  @UltimoAcao 
		/*print '@QtdeTotal = ' + convert(varchar,@QtdeTotal)
		print '@Percentual = ' + convert(varchar,(@qtdeMaior* 100/@QtdeTotal) )
        */
		 
		set @perc = (@qtdeMaior* 100/@QtdeTotal) 
		-- ........................ se esta ausente o percentual e a diferenca
		if (@UltimoAcao = 'A') 
		begin
			
			set @perc = 100.00 - @perc
		end
		--print '@perc = ' + convert(varchar,@perc)
		
	    
		IF( @cnt =  1 ) BEGIN 
			set @perc01 = @perc 
			set @acao01 = @UltimoAcao
		END
		IF( @cnt =  2 ) BEGIN 
			set @perc02 = @perc 
			set @acao02 = @UltimoAcao
		END
		IF( @cnt =  3 ) BEGIN 
			set @perc03 = @perc 
			set @acao03 = @UltimoAcao
		END
		IF( @cnt =  4 ) BEGIN 
			set @perc04 = @perc
			set @acao04 = @UltimoAcao 
		END
		IF( @cnt =  5 ) BEGIN 
			set @perc05 = @perc		 
			set @acao05 = @UltimoAcao
		END
		IF( @cnt =  6 ) BEGIN 
			set @perc06 = @perc
			set @acao06 = @UltimoAcao
		END
		IF( @cnt =  7 ) BEGIN 
			set @perc07 = @perc
			set @acao07 = @UltimoAcao
		END
		IF( @cnt =  8 ) BEGIN 
			set @perc08 = @perc
			set @acao08 = @UltimoAcao
		END
		IF( @cnt =  9 ) BEGIN  
			set @perc09 = @perc
			set @acao09 = @UltimoAcao
		END
		IF( @cnt = 10 ) BEGIN  
			set @perc10 = @perc
			set @acao10 = @UltimoAcao
		END
		IF( @cnt = 11 ) BEGIN  
			set @perc11 = @perc 
			set @acao11 = @UltimoAcao
		END
		IF( @cnt = 12 ) BEGIN  
			set @perc12 = @perc 
			set @acao12 = @UltimoAcao
		END
		IF( @cnt = 13 ) BEGIN  
			set @perc13 = @perc
			set @acao13 = @UltimoAcao
		END
		IF( @cnt = 14 ) BEGIN  
			set @perc14 = @perc
			set @acao14 = @UltimoAcao
		END
		IF( @cnt = 15 ) BEGIN  
			set @perc15 = @perc
			set @acao15 = @UltimoAcao
		END
		IF( @cnt = 16 ) BEGIN  
			set @perc16 = @perc
			set @acao16 = @UltimoAcao
		END
		IF( @cnt = 17 ) BEGIN  
			set @perc17 = @perc
			set @acao17 = @UltimoAcao
		END
		IF( @cnt = 18 ) BEGIN  
			set @perc18 = @perc
			set @acao18 = @UltimoAcao
		END
		IF( @cnt = 19 ) BEGIN  
			set @perc19 = @perc
			set @acao19 = @UltimoAcao
		END
		IF( @cnt = 20 ) BEGIN  
			set @perc20 = @perc 
			set @acao20 = @UltimoAcao
		END
		IF( @cnt = 21 ) BEGIN  
			set @perc21 = @perc
			set @acao21 = @UltimoAcao
		END
		IF( @cnt = 22 ) BEGIN  
			set @perc22 = @perc
			set @acao22 = @UltimoAcao
		END
		IF( @cnt = 23 ) BEGIN  
			set @perc23 = @perc
			set @acao23 = @UltimoAcao
		END
		IF( @cnt = 24 ) BEGIN  
			set @perc24 = @perc
			set @acao24 = @UltimoAcao
		END
		IF( @cnt = 25 ) BEGIN  
			set @perc25 = @perc
			set @acao25 = @UltimoAcao
		END
		set @cnt = @cnt + 1
	END
	
	-- remove e insere o dado basico na tabela
	if (select COUNT(1) from tblLoto_MapaPercentual where concurso = @Concurso) >= 1 begin
		delete from tblLoto_MapaPercentual where concurso = @Concurso
	end 

	insert into tblLoto_MapaPercentual(concurso, recuo, DataSorteio, NR01,NR02,NR03,NR04,NR05,NR06,NR07,NR08,NR09,NR10,NR11,NR12,NR13,NR14,NR15,NR16,NR17,NR18,NR19,NR20,NR21,NR22,NR23,NR24,NR25,
	ACAO01,ACAO02,ACAO03,ACAO04,ACAO05,ACAO06,ACAO07,ACAO08,ACAO09,ACAO10,ACAO11,ACAO12,ACAO13,ACAO14,ACAO15,ACAO16,ACAO17,ACAO18,ACAO19,ACAO20,ACAO21,ACAO22,ACAO23,ACAO24,ACAO25) 
	values(@Concurso, @Concurso-1 , GETDATE(), @perc01,  @perc02,  @perc03,  @perc04,  @perc05,  @perc06,  @perc07,  @perc08,  @perc09, @perc10, @perc11, @perc12, @perc13, @perc14, @perc15,@perc16,@perc17, @perc18, @perc19, @perc20, @perc21, @perc22, @perc23, @perc24, @perc25,
	@acao01 ,@acao02 ,@acao03 ,@acao04 ,@acao05 ,@acao06 ,@acao07 ,@acao08 ,@acao09 ,@acao10 ,@acao11 ,@acao12 ,@acao13 ,@acao14 ,@acao15 ,@acao16 ,@acao17 ,@acao18 ,@acao19 ,@acao20 ,@acao21 ,@acao22 ,@acao23 ,@acao24 ,@acao25)
	--print @cnt 
	--set @cnt = @cnt + 1
	
END

--exec sp_ProbabilidadeRepeticao 2870,2869
-- select * from tblLoto_MapaPercentual where concurso  = 2870

