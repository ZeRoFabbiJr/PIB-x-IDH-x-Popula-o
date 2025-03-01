drop table if exists PIB_Municipio

create table PIB_Municipio(
Ano numeric(4,0),
Co_Grande_Regiao numeric(1,0),
No_Grande_Regiao varchar(12),
Co_UF numeric (2,0),
Ab_UF char(2),
No_UF varchar(19),
Co_Municipio numeric(7,0),
No_Municipio varchar(40),
No_Regiao_Metropolitana varchar(86),
Co_Mesorregiao numeric (4,0),
No_Mesorregiao varchar(40),
Co_Microrregiao numeric(5,0),
No_Microrregiao varchar(40),
Co_Regiao_Geografica_Imediata numeric(6,0), 
No_Regiao_Geografica_Imediata varchar(66),
No_Municipio_Regiao_Geografica_Imediata varchar(10),
Co_Regiao_Geografica_Intermediaria numeric(4,0),
No_Regiao_Geografica_Intermediaria varchar(35),
No_Municipio_Regi�o_Geografica_Intermediaria varchar(10),
Co_Concentracao_Urbana numeric(7,0),
No_Concentracao_Urbana varchar(67),
Ds_Tp_Concentracao_Urbana varchar(27),
Co_Arranjo_Populacional numeric(7,0),
No_Arranjo_Populacional varchar(86),
No_Hierarquia_Urbana varchar(32),
DS_Hierarquia_Urbana_principais_categorias varchar(19),
Co_Regiao_Rural numeric(4,0),
No_Regiao_Rural varchar(91),
Ds_Regiao_Rural_segundo_classificacao_nucleo varchar(43),
Ds_Amazonia_Legal varchar(4),
Ds_SemiarCoo varchar(4),
Ds_CCoade_Regiao_SP varchar(4),
Vr_adicionado_bruto_Agropecuaria_precos_correntes numeric(18,3),
Vr_adicionado_bruto_Industria_precos_correntes numeric(18,3),
Vr_adicionado_bruto_Servicos_precos_correntes_exceto_Publica numeric(18,3),
Vr_adicionado_bruto_ADM_Pubica_precos_correntes numeric(18,3),
Vr_adicionado_bruto_total_precos_correntes numeric(18,3),
Vr_Impostos_liquCoos_subsCoios_sobre_produtos_precos_correntes numeric(18,3),
PIB_precos_correntes numeric(18,3),
PIB_per_capita_precos_correntes numeric(18,2),
Ds_AtivCoade_economica_primeiro_maior_valor_adicionado_bruto varchar(94),
Ds_AtivCoade_economica_segundo_maior_valor_adicionado_bruto varchar(94),
Ds_AtivCoade_economica__terceiro_maior_valor_adicionado_bruto varchar(94)
)
