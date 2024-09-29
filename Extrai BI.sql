select
  a.*
, (a.[PIB_precos_correntes]/b.[PIB_precos_correntes]-1)*100                       as PC_Crescimento
, (a.[PIB_per_capita_precos_correntes]/b.[PIB_per_capita_precos_correntes]-1)*100 as PC_CrescimentoPerCapita
, case when (a.[Vr_adicionado_bruto_Agropecuaria_precos_correntes]= 0) then 0 else (a.[Vr_adicionado_bruto_Agropecuaria_precos_correntes]/b.[Vr_adicionado_bruto_Agropecuaria_precos_correntes]-1)*100 end as PC_VrAdicionalAgro
, (a.[Vr_adicionado_bruto_ADM_Pubica_precos_correntes]/b.[Vr_adicionado_bruto_ADM_Pubica_precos_correntes]-1)*100 as PC_CrescimentoADMPlublica
, (a.[Vr_adicionado_bruto_Industria_precos_correntes]/b.[Vr_adicionado_bruto_Industria_precos_correntes]-1)*100 as PC_Industria
, (a.[Vr_adicionado_bruto_Servicos_precos_correntes_exceto_Publica]/b.[Vr_adicionado_bruto_Servicos_precos_correntes_exceto_Publica]-1)*100 as PC_CrescimentoServicos
, (a.[Vr_Impostos_liquidos_subsidios_sobre_produtos_precos_correntes]/b.[Vr_Impostos_liquidos_subsidios_sobre_produtos_precos_correntes]-1)*100 as PC_CrescimentoImpostos
, c.IDHM as idh_Medio
, c.IDHM_Renda as idh_Renda
, c.IDHM_Longevidade as idh_Longevidade
, c.IDHM_Educação as idh_educacao
, d.populacao
from
(Select * from PIB_Municipio where Ano = 2021) a
join (select * From Pib_Municipio where Ano = 2016) b on a.Co_Municipio = b.Co_Municipio
join (select * From IDH_Municipio ) c on a.Co_Municipio = c.Co_Municipio
join (select CO_Municipio, Qt_populacao as populacao From [dbo].[TB_Populacao_Municipio]) d on a.Co_Municipio = d.Co_Municipio