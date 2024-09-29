

INSERT INTO TB_Grande_Regiao
SELECT Distinct 
Co_Grande_Regiao, No_Grande_Regiao 
FROM PIB_Municipio



INSERT INTO TB_UF
SELECT DISTINCT
[Co_UF]
, [Co_Grande_Regiao]
, [Ab_UF]
, [No_UF]
From PIB_Municipio



INSERT INTO Tb_Meso_Regiao
SELECT DISTINCT
[Co_Mesorregiao]
, [Co_UF]
, [No_Mesorregiao]
From PIB_Municipio


INSERT INTO [dbo].[Tb_Micro_Regiao]
SELECT DISTINCT
[Co_Microrregiao]
, [Co_Mesorregiao]
, [No_Microrregiao]
From PIB_Municipio


INSERT INTO [dbo].[Tb_Municipio]
SELECT Distinct
      [Co_Municipio]
      ,[Co_UF]
      ,[No_Municipio]
      ,[No_Regiao_Metropolitana]
      ,[Co_Mesorregiao]
      ,[Co_Microrregiao]
      ,[Co_Regiao_Geografica_Imediata]
      ,[No_Regiao_Geografica_Imediata]
      ,[No_Municipio_Regiao_Geografica_Imediata]
      ,[Co_Regiao_Geografica_Intermediaria]
      ,[No_Regiao_Geografica_Intermediaria]
      ,[No_Municipio_Regi�o_Geografica_Intermediaria]
      ,[Co_Concentracao_Urbana]
      ,[No_Concentracao_Urbana]
      ,[Ds_Tp_Concentracao_Urbana]
      ,[Co_Arranjo_Populacional]
      ,[No_Arranjo_Populacional]
      ,[No_Hierarquia_Urbana]
      ,[DS_Hierarquia_Urbana_principais_categorias]
      ,[Co_Regiao_Rural]
      ,[No_Regiao_Rural]
      ,[Ds_Regiao_Rural_segundo_classificacao_nucleo]
      ,[Ds_Amazonia_Legal]
      ,[Ds_Semiarido]
      ,[Ds_Cidade_Regiao_SP]
  FROM [dbo].[PIB_Municipio]


  /*
C�digo para busca das atividades econ�micas individuais nos 3 campos ta tabela PIB_Municipal

SELECT distinct
      [Ds_Atividade_economica_primeiro_maior_valor_adicionado_bruto]
  FROM [TragaSeusPropriosDados].[dbo].[PIB_Municipio]
union 
SELECT distinct
      [Ds_Atividade_economica_segundo_maior_valor_adicionado_bruto]
  FROM [TragaSeusPropriosDados].[dbo].[PIB_Municipio]
union 
SELECT distinct
      [Ds_Atividade_economica__terceiro_maior_valor_adicionado_bruto]
  FROM [TragaSeusPropriosDados].[dbo].[PIB_Municipio]
*/

  INSERT INTO [dbo].[Tb_atividade_economica] VALUES 
(1,'Administra��o, defesa, educa��o e sa�de p�blicas e seguridade social')
,(2,'Agricultura, inclusive apoio � agricultura e a p�s colheita')
,(3,'Com�rcio e repara��o de ve�culos automotores e motocicletas')
,(4,'Constru��o')
,(5,'Demais servi�os')
,(6,'Eletricidade e g�s, �gua, esgoto, atividades de gest�o de res�duos e descontamina��o')
,(7,'Ind�strias de transforma��o')
,(8,'Ind�strias extrativas')
,(9,'Pecu�ria, inclusive apoio � pecu�ria')
,(10,'Produ��o florestal, pesca e aquicultura')



INSERT INTO [Tb_PIB_Municipal]
SELECT Distinct 
     [Co_Municipio]
      ,b.Co_atividade_economica 
      ,c.Co_atividade_economica
      ,d.Co_atividade_economica
      ,[Vr_adicionado_bruto_Agropecuaria_precos_correntes]
      ,[Vr_adicionado_bruto_Industria_precos_correntes]
      ,[Vr_adicionado_bruto_Servicos_precos_correntes_exceto_Publica]
      ,[Vr_adicionado_bruto_ADM_Pubica_precos_correntes]
      ,[Vr_adicionado_bruto_total_precos_correntes]
      ,[Vr_Impostos_liquidos_subsidios_sobre_produtos_precos_correntes]
      ,[PIB_precos_correntes]
      ,[PIB_per_capita_precos_correntes]
  FROM PIB_Municipio AS a
  JOIN [dbo].[Tb_atividade_economica] AS b 
      ON a.Ds_Atividade_economica_primeiro_maior_valor_adicionado_bruto = b.Ds_Atividade_economica_primeiro_maior_valor_adicionado_bruto
JOIN [dbo].[Tb_atividade_economica] AS c 
      ON a.Ds_Atividade_economica_segundo_maior_valor_adicionado_bruto = c.Ds_Atividade_economica_primeiro_maior_valor_adicionado_bruto
JOIN [dbo].[Tb_atividade_economica] AS d 
      ON a.Ds_Atividade_economica__terceiro_maior_valor_adicionado_bruto = d.Ds_Atividade_economica_primeiro_maior_valor_adicionado_bruto