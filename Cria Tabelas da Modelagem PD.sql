if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Tb_Meso_Regiao') and o.name = 'FK_TB_MESO__REFERENCE_TB_UF')
alter table Tb_Meso_Regiao
   drop constraint FK_TB_MESO__REFERENCE_TB_UF
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Tb_Micro_Regiao') and o.name = 'FK_TB_MICRO_REFERENCE_TB_MESO_')
alter table Tb_Micro_Regiao
   drop constraint FK_TB_MICRO_REFERENCE_TB_MESO_
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Tb_Municipio') and o.name = 'FK_TB_MUNIC_REFERENCE_TB_UF')
alter table Tb_Municipio
   drop constraint FK_TB_MUNIC_REFERENCE_TB_UF
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Tb_Municipio') and o.name = 'FK_TB_MUNIC_REFERENCE_TB_MICRO')
alter table Tb_Municipio
   drop constraint FK_TB_MUNIC_REFERENCE_TB_MICRO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Tb_PIB_Municipal') and o.name = 'FK_TB_PIB_M_REFERENCE_TB_MUNIC')
alter table Tb_PIB_Municipal
   drop constraint FK_TB_PIB_M_REFERENCE_TB_MUNIC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Tb_PIB_Municipal') and o.name = 'FK_TB_PIB_M_REFERENCE_TB_ATIVI1')
alter table Tb_PIB_Municipal
   drop constraint FK_TB_PIB_M_REFERENCE_TB_ATIVI1
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Tb_PIB_Municipal') and o.name = 'FK_TB_PIB_M_REFERENCE_TB_ATIVI')
alter table Tb_PIB_Municipal
   drop constraint FK_TB_PIB_M_REFERENCE_TB_ATIVI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Tb_PIB_Municipal') and o.name = 'FK_TB_PIB_M_REFERENCE_TB_ATIVI3')
alter table Tb_PIB_Municipal
   drop constraint FK_TB_PIB_M_REFERENCE_TB_ATIVI3
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Tb_UF') and o.name = 'FK_TB_UF_REFERENCE_TB_GRAND')
alter table Tb_UF
   drop constraint FK_TB_UF_REFERENCE_TB_GRAND
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Tb_Grande_Regiao')
            and   type = 'U')
   drop table Tb_Grande_Regiao
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Tb_Meso_Regiao')
            and   type = 'U')
   drop table Tb_Meso_Regiao
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Tb_Micro_Regiao')
            and   type = 'U')
   drop table Tb_Micro_Regiao
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Tb_Municipio')
            and   type = 'U')
   drop table Tb_Municipio
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Tb_PIB_Municipal')
            and   type = 'U')
   drop table Tb_PIB_Municipal
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Tb_UF')
            and   type = 'U')
   drop table Tb_UF
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Tb_atividade_economica')
            and   type = 'U')
   drop table Tb_atividade_economica
go

/*==============================================================*/
/* Table: Tb_Grande_Regiao                                      */
/*==============================================================*/
create table Tb_Grande_Regiao (
   Co_Grande_Regiao     numeric(1)           not null,
   No_Grande_Regiao     varchar(12)          collate Latin1_General_CI_AS null,
   constraint PK_TB_GRANDE_REGIAO primary key (Co_Grande_Regiao)
)
go

/*==============================================================*/
/* Table: Tb_Meso_Regiao                                        */
/*==============================================================*/
create table Tb_Meso_Regiao (
   Co_Mesorregiao       numeric(4)           not null,
   Co_UF                numeric(2)           null,
   No_Mesorregiao       varchar(40)          collate Latin1_General_CI_AS null,
   constraint PK_TB_MESO_REGIAO primary key (Co_Mesorregiao)
)
go

/*==============================================================*/
/* Table: Tb_Micro_Regiao                                       */
/*==============================================================*/
create table Tb_Micro_Regiao (
   Co_Microrregiao      numeric(5)           not null,
   Co_Mesorregiao       numeric(4)           null,
   No_Microrregiao      varchar(40)          collate Latin1_General_CI_AS null,
   constraint PK_TB_MICRO_REGIAO primary key (Co_Microrregiao)
)
go

/*==============================================================*/
/* Table: Tb_Municipio                                          */
/*==============================================================*/
create table Tb_Municipio (
   Co_Municipio         numeric(7)           not null,
   Co_UF                numeric(2)           null,
   No_Municipio         varchar(40)          collate Latin1_General_CI_AS null,
   No_Regiao_Metropolitana varchar(86)          collate Latin1_General_CI_AS null,
   Co_Mesorregiao       numeric(4)           null,
   Co_Microrregiao      numeric(5)           null,
   Co_Regiao_Geografica_Imediata numeric(6)           null,
   No_Regiao_Geografica_Imediata varchar(66)          collate Latin1_General_CI_AS null,
   No_Municipio_Regiao_Geografica_Imediata varchar(10)          collate Latin1_General_CI_AS null,
   Co_Regiao_Geografica_Intermediaria numeric(4)           null,
   No_Regiao_Geografica_Intermediaria varchar(35)          collate Latin1_General_CI_AS null,
   No_Municipio_Região_Geografica_Intermediaria varchar(10)          collate Latin1_General_CI_AS null,
   Co_Concentracao_Urbana numeric(7)           null,
   No_Concentracao_Urbana varchar(67)          collate Latin1_General_CI_AS null,
   Ds_Tp_Concentracao_Urbana varchar(27)          collate Latin1_General_CI_AS null,
   Co_Arranjo_Populacional numeric(7)           null,
   No_Arranjo_Populacional varchar(86)          collate Latin1_General_CI_AS null,
   No_Hierarquia_Urbana varchar(32)          collate Latin1_General_CI_AS null,
   DS_Hierarquia_Urbana_principais_categorias varchar(19)          collate Latin1_General_CI_AS null,
   Co_Regiao_Rural      numeric(4)           null,
   No_Regiao_Rural      varchar(91)          collate Latin1_General_CI_AS null,
   Ds_Regiao_Rural_segundo_classificacao_nucleo varchar(43)          collate Latin1_General_CI_AS null,
   Ds_Amazonia_Legal    varchar(4)           collate Latin1_General_CI_AS null,
   Ds_Semiarido         varchar(4)           collate Latin1_General_CI_AS null,
   Ds_Cidade_Regiao_SP  varchar(4)           collate Latin1_General_CI_AS null,
   constraint PK_TB_MUNICIPIO primary key (Co_Municipio)
)
go

/*==============================================================*/
/* Table: Tb_PIB_Municipal                                      */
/*==============================================================*/
create table Tb_PIB_Municipal (
   Co_Municipio         numeric(7)           null,
   Co_atividade_economica_pri smallint             null,
   Tb__Co_atividade_economica_seg smallint             null,
   Tb__Co_atividade_economica_ter smallint             null,
   Vr_adicionado_bruto_Agropecuaria_precos_correntes numeric(18,3)        null,
   Vr_adicionado_bruto_Industria_precos_correntes numeric(18,3)        null,
   Vr_adicionado_bruto_Servicos_precos_correntes_exceto_Publica numeric(18,3)        null,
   Vr_adicionado_bruto_ADM_Pubica_precos_correntes numeric(18,3)        null,
   Vr_adicionado_bruto_total_precos_correntes numeric(18,3)        null,
   Vr_Impostos_liquidos_subsidios_sobre_produtos_precos_correntes numeric(18,3)        null,
   PIB_precos_correntes numeric(18,3)        null,
   PIB_per_capita_precos_correntes numeric(18,2)        null
)
go

/*==============================================================*/
/* Table: Tb_UF                                                 */
/*==============================================================*/
create table Tb_UF (
   Co_UF                numeric(2)           not null,
   Co_Grande_Regiao     numeric(1)           null,
   Ab_UF                char(2)              collate Latin1_General_CI_AS null,
   No_UF                varchar(19)          collate Latin1_General_CI_AS null,
   constraint PK_TB_UF primary key (Co_UF)
)
go

/*==============================================================*/
/* Table: Tb_atividade_economica                                */
/*==============================================================*/
create table Tb_atividade_economica (
   Co_atividade_economica smallint             not null,
   Ds_Atividade_economica_primeiro_maior_valor_adicionado_bruto varchar(94)          collate Latin1_General_CI_AS null,
   constraint PK_TB_ATIVIDADE_ECONOMICA primary key (Co_atividade_economica)
)
go

alter table Tb_Meso_Regiao
   add constraint FK_TB_MESO__REFERENCE_TB_UF foreign key (Co_UF)
      references Tb_UF (Co_UF)
go

alter table Tb_Micro_Regiao
   add constraint FK_TB_MICRO_REFERENCE_TB_MESO_ foreign key (Co_Mesorregiao)
      references Tb_Meso_Regiao (Co_Mesorregiao)
go

alter table Tb_Municipio
   add constraint FK_TB_MUNIC_REFERENCE_TB_UF foreign key (Co_UF)
      references Tb_UF (Co_UF)
go

alter table Tb_Municipio
   add constraint FK_TB_MUNIC_REFERENCE_TB_MICRO foreign key (Co_Microrregiao)
      references Tb_Micro_Regiao (Co_Microrregiao)
go

alter table Tb_PIB_Municipal
   add constraint FK_TB_PIB_M_REFERENCE_TB_MUNIC foreign key (Co_Municipio)
      references Tb_Municipio (Co_Municipio)
go

alter table Tb_PIB_Municipal
   add constraint FK_TB_PIB_M_REFERENCE_TB_ATIVI1 foreign key (Co_atividade_economica_pri)
      references Tb_atividade_economica (Co_atividade_economica)
go

alter table Tb_PIB_Municipal
   add constraint FK_TB_PIB_M_REFERENCE_TB_ATIVI foreign key (Tb__Co_atividade_economica_seg)
      references Tb_atividade_economica (Co_atividade_economica)
go

alter table Tb_PIB_Municipal
   add constraint FK_TB_PIB_M_REFERENCE_TB_ATIVI3 foreign key (Tb__Co_atividade_economica_ter)
      references Tb_atividade_economica (Co_atividade_economica)
go

alter table Tb_UF
   add constraint FK_TB_UF_REFERENCE_TB_GRAND foreign key (Co_Grande_Regiao)
      references Tb_Grande_Regiao (Co_Grande_Regiao)
go
