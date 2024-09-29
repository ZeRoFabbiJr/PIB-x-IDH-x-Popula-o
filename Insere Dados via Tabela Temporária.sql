drop table if exists #temp
create table #temp (campo varchar (2000))

bulk insert #temp
   from 'C:\PublicoBD\PIB.txt'
   with (codepage = 'ACP')

select * from #temp 
order by 1

INSERT INTO PIB_Municipio
SELECT DISTINCT
trim(substring(campo,1,4))            [Ano]
, trim(substring(campo,6,1))          [ID_Grande_Regiao]
, trim(substring(campo,8,12))         [No_Grande_Regiao]
, trim(substring(campo,21,2))         [ID_UF]
, trim(substring(campo,24,2))         [Ab_UF]
, trim(substring(campo,27,19))        [No_UF]
, trim(substring(campo,47,7))         [ID_Municipio] 
, trim(substring(campo,55,40))        [No_Municipio]
, trim(substring(campo,96,86))        [No_Regiao_Metropolitana]
, trim(substring(campo,183,4))        [ID_Mesorregiao]
, trim(substring(campo,188,40))       [No_Mesorregiao]
, trim(substring(campo,229,5))        [ID_Microrregiao] 
, trim(substring(campo,235,40))       [No_Microrregiao]
, trim(substring(campo,276,6))        [ID_Regiao_Geografica_Imediata]
, trim(substring(campo,283,66))       [No_Regiao_Geografica_Imediata]
, trim(substring(campo,350,10))       [No_Municipio_Regiao_Geografica_Imediata]
, trim(substring(campo,361,4))        [ID_Regiao_Geografica_Intermediaria]
, trim(substring(campo,366,35))       [No_Regiao_Geografica_Intermediaria]
, trim(substring(campo,402,10))       [No_Municipio_Região_Geografica_Intermediaria]
, CASE WHEN trim(substring(campo,413,7)) = '' THEN NULL ELSE trim(substring(campo,413,7)) END [ID_Concentracao_Urbana] --- Passar Vazio para Nulo
, trim(substring(campo,421,67))       [No_Concentracao_Urbana]
, trim(substring(campo,489,27))       [Ds_Tp_Concentracao_Urbana]
, CASE WHEN trim(substring(campo,517,7)) = '' THEN NULL ELSE trim(substring(campo,517,7)) END [ID_Arranjo_Populacional] --- Passar Vazio para Nulo
, trim(substring(campo,525,86))       [No_Arranjo_Populacional]
, trim(substring(campo,612,32))       [No_Hierarquia_Urbana]
, trim(substring(campo,645,19))       [DS_Hierarquia_Urbana_principais_categorias]
, trim(substring(campo,665,4))        [ID_Regiao_Rural]
, trim(substring(campo,670,91))       [No_Regiao_Rural]
, trim(substring(campo,762,43))       [Ds_Regiao_Rural_segundo_classificacao_nucleo]
, trim(substring(campo,806,4))        [Ds_Amazonia_Legal]
, trim(substring(campo,811,4))        [Ds_Semiarido]
, trim(substring(campo,816,4))        [Ds_Cidade_Regiao_SP]
, trim(substring(campo,821,18))       [Vr_adicionado_bruto_Agropecuaria_precos_correntes]
, trim(substring(campo,840,18))       [Vr_adicionado_bruto_Industria_precos_correntes]
, trim(substring(campo,859,18))       [Vr_adicionado_bruto_Servicos_precos_correntes_exceto_Publica]
, trim(substring(campo,878,18))       [Vr_adicionado_bruto_ADM_Pubica_precos_correntes]
, trim(substring(campo,897,18))       [Vr_adicionado_bruto_total_precos_correntes]
, trim(substring(campo,916,18))       [Vr_Impostos_liquidos_subsidios_sobre_produtos_precos_corrente]
, trim(substring(campo,935,18))       [PIB_precos_correntes]
, trim(substring(campo,954,18))       [PIB_per_capita_precos_correntes]
, trim(substring(campo,973,94))       [Ds_Atividade_economica_primeiro_maior_valor_adicionado_bruto]
, trim(substring(campo,1068,94))      [Ds_Atividade_economica_segundo_maior_valor_adicionado_bruto]
, trim(substring(campo,1163,94))      [Ds_Atividade_economica__terceiro_maior_valor_adicionado_bruto]
FROM #temp

SELECT TOP 100 * FROM PIB_Municipio