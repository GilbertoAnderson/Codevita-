/*
   proc sp_IndicadoresRepeticao
   DBrasil dezembro 2024
   Gilberto Anderson
   grava os ultimos 30 ciclos de repeticao de cada dezena para usar no grafico de linhas
   
   exec sp_IndicadoresRepeticao 

   select * from tblLoto_RepeticaoDezenas
   order by Numero, Concurso desc
   

   select * from tblLoto_IndicadoresRepeticao

*/


/*
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_IndicadoresRepeticao ]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[sp_IndicadoresRepeticao ];
GO
*/

CREATE PROCEDURE [dbo].[sp_IndicadoresRepeticao ]
AS
BEGIN
	SET NOCOUNT ON
		
	-- ......................................................... limpa a base antes de inserir novos indicadores
	truncate table tblLoto_IndicadoresRepeticao


	-- ......................................................... grava dezena por dezena
	declare @dezena int,
			@qtde 	int,
			@campo  int,
			@pos_01 int,
			@pos_02 int,
			@pos_03 int,
			@pos_04 int,
			@pos_05 int,
			@pos_06 int,
			@pos_07 int,
			@pos_08 int,
			@pos_09 int,
			@pos_10 int,
			@pos_11 int,
			@pos_12 int,
			@pos_13 int,
			@pos_14 int,
			@pos_15 int,
			@pos_16 int,
			@pos_17 int,
			@pos_18 int,
			@pos_19 int,
			@pos_20 int,
			@pos_21 int,
			@pos_22 int,
			@pos_23 int,
			@pos_24 int,
			@pos_25 int,
			@pos_26 int,
			@pos_27 int,
			@pos_28 int,
			@pos_29 int,
			@pos_30 int
			
	
	set  @dezena = 1 
	WHILE @dezena <= 25
	BEGIN
		
        set @campo = 30
           
		declare resultado_cursor cursor for
		select top(30) QtdeRepeticao from tblLoto_RepeticaoDezenas
		where numero = @dezena
		order by Concurso desc
		
		open resultado_cursor
		fetch next from resultado_cursor into @qtde 
		while @@fetch_status = 0
		begin
			if @campo =  1 begin set @pos_01 = @qtde  end 
			if @campo =  2 begin set @pos_02 = @qtde  end
			if @campo =  3 begin set @pos_03 = @qtde  end
			if @campo =  4 begin set @pos_04 = @qtde  end
			if @campo =  5 begin set @pos_05 = @qtde  end
			if @campo =  6 begin set @pos_06 = @qtde  end
			if @campo =  7 begin set @pos_07 = @qtde  end
			if @campo =  8 begin set @pos_08 = @qtde  end
			if @campo =  9 begin set @pos_09 = @qtde  end
			if @campo = 10 begin set @pos_10 = @qtde  end
			if @campo = 11 begin set @pos_11 = @qtde  end
			if @campo = 12 begin set @pos_12 = @qtde  end
			if @campo = 13 begin set @pos_13 = @qtde  end
			if @campo = 14 begin set @pos_14 = @qtde  end
			if @campo = 15 begin set @pos_15 = @qtde  end
			if @campo = 16 begin set @pos_16 = @qtde  end
			if @campo = 17 begin set @pos_17 = @qtde  end
			if @campo = 18 begin set @pos_18 = @qtde  end
			if @campo = 19 begin set @pos_19 = @qtde  end
			if @campo = 20 begin set @pos_20 = @qtde  end
			if @campo = 21 begin set @pos_21 = @qtde  end
			if @campo = 22 begin set @pos_22 = @qtde  end
			if @campo = 23 begin set @pos_23 = @qtde  end
			if @campo = 24 begin set @pos_24 = @qtde  end
			if @campo = 25 begin set @pos_25 = @qtde  end
			if @campo = 26 begin set @pos_26 = @qtde  end
			if @campo = 27 begin set @pos_27 = @qtde  end
			if @campo = 28 begin set @pos_28 = @qtde  end
			if @campo = 29 begin set @pos_29 = @qtde  end
			if @campo = 30 begin set @pos_30 = @qtde  end
			
			print @dezena
			print @campo
			print @qtde
			
			set @campo =  @campo - 1
			fetch next from resultado_cursor into @qtde 
		end
		insert into tblLoto_IndicadoresRepeticao(id,[01],[02],[03],[04],[05],[06],[07],[08],[09],[10]
		                                           ,[11],[12],[13],[14],[15],[16],[17],[18],[19],[20]
		                                           ,[21],[22],[23],[24],[25],[26],[27],[28],[29],[30])
		                                values(@dezena, @pos_01, @pos_02, @pos_03, @pos_04, @pos_05, @pos_06, @pos_07, @pos_08, @pos_09, @pos_10 
	                                                  , @pos_11, @pos_12, @pos_13, @pos_14, @pos_15, @pos_16, @pos_17, @pos_18, @pos_19, @pos_20 
	                                                  , @pos_21, @pos_22, @pos_23, @pos_24, @pos_25, @pos_26, @pos_27, @pos_28, @pos_29, @pos_30 )
	                                                  
		-- ............................................................. cancela o cursor
		close resultado_cursor
		deallocate resultado_cursor	
		
		set  @dezena = @dezena + 1 
		
	END
END
	
	