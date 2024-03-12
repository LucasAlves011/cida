--<DS_SCRIPT>
-- DESCRIÇÃO..: OP 32516 Replicação da OP 28570 - Criando integração de NFSe no JIntegra
-- RESPONSAVEL: Diego Costa
-- DATA.......: 02/10/2015
-- APLICAÇÃO..: MVEDI
--</DS_SCRIPT>
--<USUARIO=MVINTEGRA>

Create Table mvintegra.imv_nota_fiscal_eletronica
    (cd_imv_nota_fiscal_eletronica  Number(20,0) Not Null,
    tp_fluxo                       Varchar2(1) Not Null,
    tp_status                      Varchar2(1) Not Null,
    cd_erro                        Varchar2(5),
    ds_erro                        Varchar2(4000),
    ds_sugestao                    Varchar2(4000),
    dt_gerado                      Date Not Null,
    dt_processado                  Date,
    tp_movimento                   Varchar2(1),
    tp_registro                    Varchar2(3) Not Null,
    cd_multi_empresa               Number(4,0) Not Null,
    cd_multi_empresa_integra       Varchar2(50),
    cd_registro_principal          Number(20,0),
    cd_registro_pai                Number(20,0),
    cd_sistema_origem              Varchar2(500),
    cd_atendimento                 Number(10,0),
    tp_conta                       Varchar2(1),
    cd_convenio                    Number(3,0),
    cd_remessa                     Number(8,0),
    cd_conta_hospitalar            Number(8,0),
    cd_conta_ambulatorial          Number(8,0),
    cd_lote                        Number(14,0),
    dt_lote_gerado                 Date,
    ds_usuario                     Varchar2(30),
    nr_protocolo                   Varchar2(50),
    dt_protocolo                   Date,
    cd_nota_fiscal                 Number(10,0),
    nr_id_nota_fiscal              Number(10,0),
    cd_formulario_nota_fiscal      Number(4,0),
    cd_serie                       Varchar2(4),
    tp_nota_fiscal                 Varchar2(1),
    dt_emissao                     Date,
    dt_competencia                 Date,
    dt_saida                       Date,
    dt_cancelamento                Date,
    cd_motivo_cancelamento         Number(3,0),
    ds_situacao_nota_fiscal        Varchar2(1),
    nr_nota_fiscal_convertida      Number(20,0),
    dt_nota_fiscal_convertida      Date,
    cd_verificacao_nota_fiscal     Varchar2(400),
    ds_endereco_eletronico_nota    Varchar2(4000),
    dt_canc_nota_convertida        Date,
    cd_nota_fiscal_substituida     Number(15,0),
    cd_serie_nota_substituida      Varchar2(5),
    tp_nota_fiscal_substituida     Number(1,0),
    tp_natureza_operacao           Number(2,0),
    nr_processo_judicial           Varchar2(30),
    cd_regime_especial_tributacao  Number(2,0),
    sn_optante_simples_nacional    Varchar2(1),
    sn_incentivo_fiscal            Varchar2(1),
    nr_cpf_cnpj_prestador          Varchar2(14),
    nr_insc_municipal_prestador    Varchar2(15),
    nr_insc_estadual_prestador     Varchar2(15),
    ds_razao_social_prestador      Varchar2(150),
    ds_tipo_endereco_prestador     Number(12,0),
    ds_endereco_prestador          Varchar2(125),
    nr_numero_endereco_prestador   Varchar2(10),
    ds_comp_endereco_prestador     Varchar2(60),
    ds_bairro_prestador            Varchar2(60),
    cd_cidade_prestador            Number(7,0),
    ds_uf_prestador                Varchar2(2),
    cd_pais_prestador              Number(2,0),
    nr_cep_prestador               Varchar2(8),
    ds_email_prestador             Varchar2(80),
    nr_telefone_prestador          Varchar2(20),
    tp_pessoa_tomador              Varchar2(1),
    nr_cpf_cnpj_tomador            Varchar2(14),
    nr_insc_municipal_tomador      Varchar2(15),
    nr_insc_estadual_tomador       Varchar2(15),
    ds_razao_social_tomador        Varchar2(150),
    ds_tipo_endereco_tomador       Number(12,0),
    ds_endereco_tomador            Varchar2(125),
    nr_numero_endereco_tomador     Varchar2(10),
    ds_comp_endereco_tomador       Varchar2(60),
    ds_bairro_tomador              Varchar2(60),
    cd_cidade_tomador              Number(7,0),
    ds_uf_tomador                  Varchar2(2),
    cd_pais_tomador                Number(2,0),
    nr_cep_tomador                 Varchar2(8),
    ds_email_tomador               Varchar2(80),
    nr_telefone_tomador            Varchar2(20),
    nr_cpf_cnpj_intermediario      Varchar2(14),
    nr_insc_munic_intermediario    Varchar2(15),
    nr_insc_estad_intermediario    Varchar2(15),
    ds_razao_soc_intermediario     Varchar2(150),
    ds_tipo_end_intermediario      Number(12,0),
    ds_endereco_intermediario      Varchar2(125),
    nr_endereco_intermediario      Varchar2(10),
    ds_comp_end_intermediario      Varchar2(60),
    ds_bairro_intermediario        Varchar2(60),
    cd_cidade_intermediario        Number(7,0),
    ds_uf_intermediario            Varchar2(2),
    cd_pais_intermediario          Number(2,0),
    nr_cep_intermediario           Varchar2(8),
    ds_email_intermediario         Varchar2(80),
    nr_telefone_intermediario      Varchar2(20),
    cd_servico                     Number(4,0),
    cd_servico_prestado            Varchar2(5),
    cd_cnae                        Varchar2(7),
    cd_tributacao_municipio        Varchar2(20),
    cd_municipio_incidencia        Number(7,0),
    ds_servico                     Varchar2(200),
    vl_servico                     Number(14,4),
    tp_tributo_retido              Varchar2(1),
    vl_deducoes                    Number(14,4),
    vl_aliquota_pis                Number(5,2),
    vl_pis                         Number(14,4),
    vl_aliquota_confis             Number(5,2),
    vl_confins                     Number(14,4),
    vl_aliquota_inss               Number(5,2),
    vl_inss                        Number(14,4),
    vl_aliquota_ir                 Number(5,2),
    vl_ir                          Number(14,4),
    vl_aliquota_csll               Number(5,0),
    vl_csll                        Number(14,4),
    sn_iss_retido                  Varchar2(1),
    vl_aliquota_iss                Number(5,2),
    vl_iss                         Number(14,4),
    vl_iss_retido                  Number(14,4),
    vl_outras_retencoes            Number(14,4),
    cd_responsavel_retencao        Varchar2(1),
    vl_desconto_incondicionado     Number(14,4),
    vl_desconto_condicionado       Number(14,4),
    vl_base_calculo                Number(14,4),
    vl_liquido_nota                Number(14,4),
    ds_tipo_mensagem               Varchar2(100),
    cd_imv_log_requisicao          Number(25,0))
  Tablespace  mv2000_d
/

-- Grants for Table
Grant Alter On mvintegra.imv_nota_fiscal_eletronica To mv2000
/
Grant Delete On mvintegra.imv_nota_fiscal_eletronica To mv2000
/
Grant Delete On mvintegra.imv_nota_fiscal_eletronica To dbasgu
/
Grant Insert On mvintegra.imv_nota_fiscal_eletronica To mv2000
/
Grant Insert On mvintegra.imv_nota_fiscal_eletronica To dbasgu
/
Grant Select On mvintegra.imv_nota_fiscal_eletronica To mv2000
/
Grant Select On mvintegra.imv_nota_fiscal_eletronica To dbasgu
/
Grant Update On mvintegra.imv_nota_fiscal_eletronica To mv2000
/
Grant Update On mvintegra.imv_nota_fiscal_eletronica To dbasgu
/
Grant References On mvintegra.imv_nota_fiscal_eletronica To dbaps
/
Grant References On mvintegra.imv_nota_fiscal_eletronica To dbasgu
/
Grant On Commit Refresh On mvintegra.imv_nota_fiscal_eletronica To mv2000
/
Grant Query Rewrite On mvintegra.imv_nota_fiscal_eletronica To mv2000
/
Grant Debug On mvintegra.imv_nota_fiscal_eletronica To mv2000
/
Grant Flashback On mvintegra.imv_nota_fiscal_eletronica To mv2000
/




-- Indexes for MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA

Create Index mvintegra.ind_imv_nota_fisc_eletron_2_ix On mvintegra.imv_nota_fiscal_eletronica
  (
    tp_fluxo                        Asc,
    tp_status                       Asc,
    tp_registro                     Asc,
    ds_situacao_nota_fiscal         Asc,
    ds_tipo_mensagem                Asc
  )
  Tablespace  mv2000_i
/

Create Index mvintegra.ind_imv_nota_fisc_eletron_1_ix On mvintegra.imv_nota_fiscal_eletronica
  (
    cd_registro_principal           Asc
  )
  Tablespace  mv2000_i
/



-- Constraints for MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA

Alter Table mvintegra.imv_nota_fiscal_eletronica
Add Constraint cnt_imv_nota_fiscal_eletron_pk Primary Key (
  cd_imv_nota_fiscal_eletronica)
Using Index
  Tablespace  mv2000_i
/


-- Comments for MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA

Comment On Table mvintegra.imv_nota_fiscal_eletronica Is 'Tabela de integração com dados do faturamento'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_atendimento Is 'Código do Antedimento do Paciente'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_cidade_intermediario Is 'Cidade do logradouro da empresa tomadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_cidade_prestador Is 'Cidade do logradouro da empresa prestadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_cidade_tomador Is 'Cidade do logradouro da empresa tomadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_cnae Is 'CNAE 2.0'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_conta_ambulatorial Is 'Código da conta ambulatiorial'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_conta_hospitalar Is 'Código da conta hospitalar'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_convenio Is 'Código do Convênio do atendimento'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_erro Is 'Código de erro'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_formulario_nota_fiscal Is 'Código do formulário da Nota Fiscal'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_imv_log_requisicao Is 'Código da mensagem de entrada'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_imv_nota_fiscal_eletronica Is 'Código identificador do registro (sequencial)'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_lote Is 'Código do lote de RPS'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_motivo_cancelamento Is 'Código do motivo de cancelamento da Nota Fiscal'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_multi_empresa Is 'Código da multi-empresa'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_multi_empresa_integra Is 'Código de-para da multi-empresa'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_municipio_incidencia Is 'Municipio de incidencia do imposto ISS'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_nota_fiscal Is 'Código da Nota fiscal'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_nota_fiscal_substituida Is 'Número do RPS que esta sendo substituída'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_pais_intermediario Is 'País do logradouro da empresa tomadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_pais_prestador Is 'País do logradouro da empresa prestadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_pais_tomador Is 'País do logradouro da empresa tomadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_regime_especial_tributacao Is '1-Microempresa Municipal;2-Estimativa;3-Sociedade de Profissionais;4-Cooperativa;5-Microempresário Individual (MEI);6-Microempresário e Empresa de Pequeno Porte (ME EPP)'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_registro_pai Is 'Código identificador do registro pai da mensagem'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_registro_principal Is 'Código identificador do registro principal da mensagem'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_remessa Is 'Código da remessa no faturamento'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_responsavel_retencao Is 'Resposável pela retenção do ISS. Informado somente se IssRetido igual a “1 – Sim”, A opção “2 – Intermediário” somente poderá ser selecionada se intermediário informado: 1 – Tomador;2 – Intermediário'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_serie Is 'Número de Série'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_serie_nota_substituida Is 'Número do equipamento emissor do RPS ou série do RPS que esta sendo substituída'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_servico Is 'Código do serviço executado'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_servico_prestado Is 'Código do serviço prestado'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_sistema_origem Is 'Nome do sistema que enviou a mensagem'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_tributacao_municipio Is 'Código do serviço prestado próprio do município'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.cd_verificacao_nota_fiscal Is 'Código de verifificação da Nota Fiscal Convertida'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.ds_bairro_intermediario Is 'Bairro do logradouro da empresa tomadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.ds_bairro_prestador Is 'Bairro do logradouro da empresa prestadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.ds_bairro_tomador Is 'Bairro do logradouro da empresa tomadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.ds_comp_end_intermediario Is 'Complemento do logradouro da empresa tomadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.ds_comp_endereco_prestador Is 'Complemento do logradouro da empresa prestadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.ds_comp_endereco_tomador Is 'Complemento do logradouro da empresa tomadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.ds_email_intermediario Is 'Email da empresa tomadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.ds_email_prestador Is 'eMAIL da empresa prestadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.ds_email_tomador Is 'Email da empresa tomadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.ds_endereco_eletronico_nota Is 'Endereço eletronico da nota fiscal no orgão emissor'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.ds_endereco_intermediario Is 'Logradouro da empresa tomadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.ds_endereco_prestador Is 'Logradouro da empresa prestadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.ds_endereco_tomador Is 'Logradouro da empresa tomadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.ds_erro Is 'Descrição da mensagem de erro ocorrido no processamento da mensagem'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.ds_razao_soc_intermediario Is 'Razao Social da empresa tomadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.ds_razao_social_prestador Is 'Razao Social da empresa prestadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.ds_razao_social_tomador Is 'Razao Social da empresa tomadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.ds_servico Is 'Descrição do Serviço Executado'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.ds_situacao_nota_fiscal Is '1 – Normal;2-Cancelada'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.ds_sugestao Is 'Sugestão de correção de erro'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.ds_tipo_end_intermediario Is 'Tipo de Logradouro da empresa tomadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.ds_tipo_endereco_prestador Is 'Tipo de Logradouro da empresa prestadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.ds_tipo_endereco_tomador Is 'Tipo de Logradouro da empresa tomadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.ds_tipo_mensagem Is 'Tipo da mensagem do registro'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.ds_uf_intermediario Is 'Estado (UF) do logradouro da empresa tomadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.ds_uf_prestador Is 'Estado (UF) do logradouro da empresa prestadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.ds_uf_tomador Is 'Estado (UF) do logradouro da empresa tomadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.ds_usuario Is 'Usuário responsável pela geração do Lote de RPS'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.dt_canc_nota_convertida Is 'Data de Cancelamento da Nota Fiscal Convertida'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.dt_cancelamento Is 'Data de Cancelamento da Nota Fiscal'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.dt_competencia Is 'Dia, mês e ano da prestação de serviço (AAAAMMDD)'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.dt_emissao Is 'Data de Emissão da Nota Fiscal'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.dt_gerado Is 'Data de geração do registro na tabela'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.dt_lote_gerado Is 'Data da Geração do Lote de RPS'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.dt_nota_fiscal_convertida Is 'Data da Nota Fiscal Convertida'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.dt_processado Is 'Data de processamento do registro'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.dt_protocolo Is 'Data/hora que o protocolo foi informado'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.dt_saida Is 'Data de Saída da Nota Fiscal'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.nr_cep_intermediario Is 'CEP do logradouro da empresa tomadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.nr_cep_prestador Is 'CEP do logradouro da empresa prestadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.nr_cep_tomador Is 'CEP do logradouro da empresa tomadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.nr_cpf_cnpj_intermediario Is 'CNPJ da empresa tomadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.nr_cpf_cnpj_prestador Is 'CNPJ da empresa prestadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.nr_cpf_cnpj_tomador Is 'CNPJ da empresa tomadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.nr_endereco_intermediario Is 'Numero do logradouro da empresa tomadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.nr_id_nota_fiscal Is 'Código sequencial da Nota Fiscal'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.nr_insc_estad_intermediario Is 'Inscrição Estaduial da empresa tomadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.nr_insc_estadual_prestador Is 'Inscrição Estaduial da empresa prestadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.nr_insc_estadual_tomador Is 'Inscrição Estaduial da empresa tomadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.nr_insc_munic_intermediario Is 'Inscrição Municipal da empresa tomadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.nr_insc_municipal_prestador Is 'Inscrição Municipal da empresa prestadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.nr_insc_municipal_tomador Is 'Inscrição Municipal da empresa tomadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.nr_nota_fiscal_convertida Is 'Numero da Nota Fiscal Convertida'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.nr_numero_endereco_prestador Is 'Numero do logradouro da empresa prestadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.nr_numero_endereco_tomador Is 'Numero do logradouro da empresa tomadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.nr_processo_judicial Is 'Número do processo judicial ou administrativo de suspensão da exigibilidade. Obrigatório e informado somente quando declarada a suspensão da exigibilidade do tributo'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.nr_protocolo Is 'Número do protocolo do lote'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.nr_telefone_intermediario Is 'Telefone da empresa tomadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.nr_telefone_prestador Is 'Telefone da empresa prestadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.nr_telefone_tomador Is 'Telefone da empresa tomadora do serviço'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.sn_incentivo_fiscal Is 'Indica se a empresa tem incentivo fiscal'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.sn_iss_retido Is 'Informa se o ISS deve ser retido'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.sn_optante_simples_nacional Is 'Indica se a empresa é optante pelo Simples Nacional'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.tp_conta Is 'Tipo da conta/remessa - A-Ambulatorial e H-Hospitalar'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.tp_fluxo Is 'Tipo de fluxo do registro (E - Entrada / S - Saída)'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.tp_movimento Is 'Tipo do movimento do registro (I - Inclusão / A - Alteração / E - Exclusão)'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.tp_natureza_operacao Is '1-Exigível;2-Não incidência;3-Isenção;4-Exportação;5-Imunidade;6-Exigibilidade Suspensa por Decisão Judicial;7-Exigibilidade Suspensa por Processo Administrativo'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.tp_nota_fiscal Is 'Tipo da nota Fiscal: 1 – Recibo Provisório de Serviços;2 – RPS Nota Fiscal Conjugada (Mista);3 – Cupom'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.tp_nota_fiscal_substituida Is 'Tipo do RPS que esta sendo substituído'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.tp_pessoa_tomador Is 'Tipo de Pessoa Tomadora do Serviço. F-Fisica, J-Juridica'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.tp_registro Is 'Tipo do registro (001 - Informações da remessa / 002 – Informações da conta do faturamento / 003 – Informações do item faturado / 004 – Informações de lançamentos médicos (equipe cirúrgica)) '
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.tp_status Is 'Status do registro (A - Aguardando / E - Erro / T - Transmitido / P - Em processamento)'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.tp_tributo_retido Is 'Tipo do tributo retido'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.vl_aliquota_confis Is 'Percentual da aloquota do CONFINS'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.vl_aliquota_csll Is 'Percentual da aliquota do CSLL'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.vl_aliquota_inss Is 'Percentual da aliquota do INSS'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.vl_aliquota_ir Is 'Percentual da aliquota do IR'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.vl_aliquota_iss Is 'Aliquota do ISS'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.vl_aliquota_pis Is 'Percentual da aliquota do PIS'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.vl_base_calculo Is 'Valor para base de calculo do imposto, formula: (Valor dos serviços - Valor das deduções - descontos incondicionados)'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.vl_confins Is 'Valor da retenção do COFINS'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.vl_csll Is 'Valor da retenção do CSLL'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.vl_deducoes Is 'Valor das deduções para Redução da Base de Cálculo'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.vl_desconto_condicionado Is 'Valor do desconto condicionado'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.vl_desconto_incondicionado Is 'Valor do desconto incondicionado'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.vl_inss Is 'Valor da retenção do INSS'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.vl_ir Is 'Valor da retenção do IR'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.vl_iss_retido Is 'Valor do ISS a ser retido.'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.vl_liquido_nota Is 'Valor Liquido da Nota. Formula: (ValorServicos - ValorPIS - ValorCOFINS - ValorINSS - ValorIR - ValorCSLL - OutrasRetençoes - ValorISSRetido - DescontoIncondicionado - DescontoCondicionado)'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.vl_outras_retencoes Is 'Outras retenções na fonte. Informação declaratória'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.vl_pis Is 'Valor da retenção do PIS'
/
Comment On Column mvintegra.imv_nota_fiscal_eletronica.vl_servico Is 'valor do Serviço Executado'
/



--<DS_SCRIPT>
-- DESCRIÇÃO..: OP 35910 - Replicação de Criação da coluna cd_IEST na tabela de formulário da empresa.
-- RESPONSAVEL: Diego Costa
-- DATA.......: 12/01/2016
-- APLICAÇÃO..: FFCV
--</DS_SCRIPT>
--<USUARIO=DBAMV>

ALTER TABLE DBAMV.EMPRESA_FORMULARIO ADD CD_IEST VARCHAR2(2000)
/

COMMENT ON COLUMN DBAMV.EMPRESA_FORMULARIO.CD_IEST IS 'Inscrição estadual'
/--<DS_SCRIPT>
-- DESCRIÇÃO..: OP 35910 - Replicação de Criação da coluna DS_EMAIL na tabela de formulário da empresa
-- RESPONSAVEL: Diego Costa
-- DATA.......: 12/01/2016
-- APLICAÇÃO..: FFCV
--</DS_SCRIPT>
--<USUARIO=DBAMV>

ALTER TABLE DBAMV.EMPRESA_FORMULARIO ADD DS_EMAIL VARCHAR2(2000)
/

COMMENT ON COLUMN DBAMV.EMPRESA_FORMULARIO.DS_EMAIL IS 'Email da empresa'
/--<DS_SCRIPT>
-- DESCRIÇÃO..: OP 44193 - Inclusao de coluna para processo de nota fiscal eletrônica
-- RESPONSAVEL: Diego Costa
-- DATA.......: 30/12/2016
-- APLICAÇÃO..: FFCV/MVIntegra
--</DS_SCRIPT>
--<USUARIO=MVINTEGRA>

ALTER TABLE mvintegra.imv_nota_fiscal_eletronica
 ADD (DS_MOTIVO_CANCELAMENTO VARCHAR2(2000))
/

COMMENT ON COLUMN mvintegra.imv_nota_fiscal_eletronica.DS_MOTIVO_CANCELAMENTO IS 'Descrição do motivo de cancelamento da nota fiscal'
/

COMMENT ON COLUMN mvintegra.imv_nota_fiscal_eletronica.DS_INFORMACAO_ADICIONAIS IS 'Informações adcionais e observações da nota fiscal'
/

COMMENT ON COLUMN mvintegra.imv_nota_fiscal_eletronica.CD_MOT_SITUACAO IS 'Motivo situação de cancelamento da nota fiscal'
/

COMMENT ON COLUMN mvintegra.imv_nota_fiscal_eletronica.VL_ISS IS 'Valor do ISS'
/--<DS_SCRIPT>
-- DESCRIÇÃO..: OP 44193 - Inclusao de campos na tabela de integração da nota fiscal SEFAZ.
-- RESPONSAVEL: Diego Costa
-- DATA.......: 13/02/2017
-- APLICAÇÃO..: FFCV
--</DS_SCRIPT>
--<USUARIO=MVINTEGRA>

ALTER TABLE mvintegra.imv_nota_fiscal_eletronica MODIFY cd_pais_prestador NUMBER
/

COMMENT ON COLUMN mvintegra.imv_nota_fiscal_eletronica.cd_pais_prestador IS 'Codigo pais prestador'
/

ALTER TABLE mvintegra.imv_nota_fiscal_eletronica MODIFY cd_pais_tomador NUMBER
/

ALTER TABLE mvintegra.imv_nota_fiscal_eletronica
ADD (cd_siafi_tomador VARCHAR2(200))
/

COMMENT ON COLUMN mvintegra.imv_nota_fiscal_eletronica.cd_siafi_tomador IS 'Codigo SIAFI para a cidade do tomador'
/

ALTER TABLE mvintegra.imv_nota_fiscal_eletronica
ADD (cd_tom_tomador VARCHAR2(5))
/

COMMENT ON COLUMN mvintegra.imv_nota_fiscal_eletronica.cd_tom_tomador IS 'Codigo TOM para a cidade do tomador'
/

ALTER TABLE mvintegra.imv_nota_fiscal_eletronica
ADD (cd_siafi_prestador VARCHAR2(200))
/

COMMENT ON COLUMN mvintegra.imv_nota_fiscal_eletronica.cd_siafi_prestador IS 'Codigo SIAFI para a cidade do prestador'
/


ALTER TABLE mvintegra.imv_nota_fiscal_eletronica
ADD (cd_tom_prestador VARCHAR2(5))
/

COMMENT ON COLUMN mvintegra.imv_nota_fiscal_eletronica.cd_tom_prestador IS 'Codigo TOM para a cidade do prestador'
/


ALTER TABLE mvintegra.imv_nota_fiscal_eletronica
ADD (ds_natureza_operacao_sefaz VARCHAR2(60))
/

COMMENT ON COLUMN mvintegra.imv_nota_fiscal_eletronica.ds_natureza_operacao_sefaz IS 'Descrição da natureza e operação da SEFAZ: VENDA | COMPRA'
/


ALTER TABLE mvintegra.imv_nota_fiscal_eletronica
ADD (tp_pagamento VARCHAR2(50))
/

COMMENT ON COLUMN mvintegra.imv_nota_fiscal_eletronica.tp_pagamento IS 'Tipo de pagamento. Para SEFAZ são esses valores: 0 – pagamento à vista; 1 – pagamento à prazo; 2 - outros.'
/


ALTER TABLE mvintegra.imv_nota_fiscal_eletronica
ADD (cd_modelo_nf VARCHAR2(50))
/

COMMENT ON COLUMN mvintegra.imv_nota_fiscal_eletronica.cd_modelo_nf IS 'Código do modelo de nota fiscal. Para SEFAZ: NFE, NFC,...'
/

ALTER TABLE mvintegra.imv_nota_fiscal_eletronica
ADD (ds_chave_acesso VARCHAR2(50))
/

COMMENT ON COLUMN mvintegra.imv_nota_fiscal_eletronica.ds_chave_acesso IS 'Chave de acesso. Na SEFAZ: Código numérico que compõe a Chave de Acesso. Número aleatório gerado pelo emitente para cada NF-e para evitar acessos indevidos da NF-e. '
/

ALTER TABLE mvintegra.imv_nota_fiscal_eletronica
ADD (tp_operacao VARCHAR2(50))
/

COMMENT ON COLUMN mvintegra.imv_nota_fiscal_eletronica.tp_operacao IS 'Tipo de operação. Na SEFAZ: 0-entrada | 1-saída'
/

ALTER TABLE mvintegra.imv_nota_fiscal_eletronica
ADD (cd_uf_prestador number)
/

COMMENT ON COLUMN mvintegra.imv_nota_fiscal_eletronica.cd_uf_prestador IS 'Código IBGE para estado do prestador'
/

ALTER TABLE mvintegra.imv_nota_fiscal_eletronica
ADD (cd_uf_tomador number)
/

COMMENT ON COLUMN mvintegra.imv_nota_fiscal_eletronica.cd_uf_tomador IS 'Código IBGE para estado do tomador'
/

ALTER TABLE mvintegra.imv_nota_fiscal_eletronica
ADD (cd_uf_intermediario number)
/

COMMENT ON COLUMN mvintegra.imv_nota_fiscal_eletronica.cd_uf_intermediario IS 'Código IBGE para estado do intermediario'
/


-- Criar configuração na tabela dbamv.config_nota_fiscal_por_tipo
ALTER TABLE mvintegra.imv_nota_fiscal_eletronica
ADD (tp_impressao VARCHAR2(1))
/

COMMENT ON COLUMN mvintegra.imv_nota_fiscal_eletronica.tp_impressao IS 'Tipo layout de impressão da DANFE para a SEFAZ: 1-Retrato | 2-Paisagem'
/


ALTER TABLE mvintegra.imv_nota_fiscal_eletronica
ADD (tp_emissao VARCHAR2(1))
/

COMMENT ON COLUMN mvintegra.imv_nota_fiscal_eletronica.tp_emissao IS 'Na SEFAZ: 1 – Normal; 2 – Contingência FS; 3 – Contingência SCAN; 4 – Contingência DPEC; 5 – Contingência FS-DA'
/


ALTER TABLE mvintegra.imv_nota_fiscal_eletronica
ADD (nr_digito_verif_chave_acesso number)
/

COMMENT ON COLUMN mvintegra.imv_nota_fiscal_eletronica.nr_digito_verif_chave_acesso IS 'Informar o DV da Chave de Acesso da NF-e, o DV será calculado com a aplicação do algoritmo módulo 11 (base 2,9) da Chave de Acesso. (vide item 5 do Manual de Integração)'
/


ALTER TABLE mvintegra.imv_nota_fiscal_eletronica
ADD (tp_ambiente VARCHAR2(1))
/

COMMENT ON COLUMN mvintegra.imv_nota_fiscal_eletronica.tp_ambiente IS 'Tipo de ambiente: 1-Produção | 2-Homologação'
/


ALTER TABLE mvintegra.imv_nota_fiscal_eletronica
ADD (sn_nota_fiscal_mvs VARCHAR2(1))
/

COMMENT ON COLUMN mvintegra.imv_nota_fiscal_eletronica.sn_nota_fiscal_mvs IS 'Indica se a nota fiscal é do MVSaude'
/


ALTER TABLE mvintegra.imv_nota_fiscal_eletronica
ADD (tp_processo_emissao VARCHAR2(1))
/

COMMENT ON COLUMN mvintegra.imv_nota_fiscal_eletronica.tp_processo_emissao IS 'Identificador do processo de emissão da NF-e: 0 - emissão de NF-e com aplicativo do contribuinte; 1 - emissão de NF-e avulsa pelo Fisco; 2 - emissão de NF-e avulsa, pelo contribuinte com seu certificado digital, através do site do Fisco; 3- emissão NF-e pelo contribuinte com aplicativo fornecido pelo Fisco.'
/


ALTER TABLE mvintegra.imv_nota_fiscal_eletronica
ADD (ds_versao_processamento VARCHAR2(50))
/

COMMENT ON COLUMN mvintegra.imv_nota_fiscal_eletronica.ds_versao_processamento IS 'Identificador da versão do processo de emissão (informar a versão do aplicativo emissor de NF-e)'
/

ALTER TABLE mvintegra.imv_nota_fiscal_eletronica
ADD (nr_item number)
/

COMMENT ON COLUMN mvintegra.imv_nota_fiscal_eletronica.nr_item IS 'Número do item da nota'
/

ALTER TABLE mvintegra.imv_nota_fiscal_eletronica ADD (ds_cidade_prestador VARCHAR2(100))
/

COMMENT ON COLUMN mvintegra.imv_nota_fiscal_eletronica.ds_cidade_prestador IS 'Descrição da cidade do prestador'
/

ALTER TABLE MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA ADD (CD_ID_DEST  NUMBER)
/

ALTER TABLE MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA ADD (TP_CONSUMIDOR_FINAL  VARCHAR2(1))
/

ALTER TABLE MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA ADD (DS_PAIS_PRESTADOR  VARCHAR2(60))
/

ALTER TABLE MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA ADD (DS_PAIS_TOMADOR  VARCHAR2(60))
/

ALTER TABLE MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA ADD (TP_IND_IE_DESTINATARIO  NUMBER(1))
/

ALTER TABLE MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA ADD (NR_CFOP  VARCHAR2(8))
/

ALTER TABLE MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA ADD (VL_BASE_CALCULO_ITEM  NUMBER(14,4))
/

ALTER TABLE MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA ADD (VL_TOTAL_ITEM  NUMBER(14,4))
/

ALTER TABLE MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA ADD (VL_ISS_ITEM  NUMBER(14,4))
/

ALTER TABLE MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA ADD (VL_ISS_RETIDO_ITEM  NUMBER(14,4))
/

ALTER TABLE MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA ADD (QR_CODE  VARCHAR2(400))
/

ALTER TABLE MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA ADD (CD_CST_PIS  VARCHAR2(2))
/

ALTER TABLE MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA ADD (CD_CST_COFINS  VARCHAR2(2))
/


COMMENT ON COLUMN MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA.CD_ID_DEST IS 'Identificacao do Local destino da operação SEFAZ; 1 - Interna; 2 - Interestadual; 3 - Exterior;'
/

COMMENT ON COLUMN MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA.TP_CONSUMIDOR_FINAL IS 'Indica operacao com consumidor final: 0- Normal; 1 - Final'
/

COMMENT ON COLUMN MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA.DS_PAIS_PRESTADOR IS 'Nome do pais do prestador'
/

COMMENT ON COLUMN MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA.DS_PAIS_TOMADOR IS 'Nome do pais do tomador'
/

COMMENT ON COLUMN MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA.TP_IND_IE_DESTINATARIO IS 'Indicador da Inscricao Estadual do tomador: 1 - Contribuinte ICMS (Informar IE); 2 - Contribuinte isento(não informar IE); 9 - Não contribuinte(não informar IE);'
/

COMMENT ON COLUMN MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA.NR_CFOP IS 'CFOP do servico'
/

COMMENT ON COLUMN MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA.VL_BASE_CALCULO_ITEM IS 'Base de calculo do item individualmente.'
/

COMMENT ON COLUMN MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA.VL_TOTAL_ITEM IS 'Valor total do item'
/

COMMENT ON COLUMN MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA.VL_ISS_ITEM IS 'valor do ISS não retido especifico do ITEM'
/

COMMENT ON COLUMN MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA.VL_ISS_RETIDO_ITEM IS 'valor do ISS retido especifico do ITEM'
/

COMMENT ON COLUMN MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA.QR_CODE IS 'QR CODE da nota fiscal modelo 65 SEFAZ; NFC'
/

COMMENT ON COLUMN MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA.CD_CST_PIS IS 'Codigo Situacao Tributaria do PIS '
/

COMMENT ON COLUMN MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA.CD_CST_COFINS IS 'Codigo Situacao Tributaria do COFINS'
/

ALTER TABLE mvintegra.imv_nota_fiscal_eletronica
ADD (ds_cidade_tomador VARCHAR2(200))
/
COMMENT ON COLUMN mvintegra.imv_nota_fiscal_eletronica.ds_cidade_tomador IS 'Descricação da cidade do tomador'
/--<DS_SCRIPT>
-- DESCRIÇÃO..: OP 44193 - Inclusao de campos na tabela de integração da nota fiscal SEFAZ.
-- RESPONSAVEL: Diego Costa
-- DATA.......: 13/02/2017
-- APLICAÇÃO..: FFCV
--</DS_SCRIPT>
--<USUARIO=DBAMV>

ALTER TABLE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
 ADD (SN_INFORMAR_IMP_NAO_RETIDO_NFE VARCHAR2(1))
/

COMMENT ON COLUMN DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO.SN_INFORMAR_IMP_NAO_RETIDO_NFE IS 'Indica se deve ser informado na NFE os tributos não retidos.'
/

declare
  nCdMultiEmpresa NUMBER := Nvl(dbamv.pkg_mv2000.le_empresa, 1);
BEGIN

  FOR rReg IN (SELECT cd_multi_empresa FROM dbamv.multi_empresas) LOOP

    dbamv.pkg_mv2000.atribui_empresa(rReg.cd_multi_empresa);

    UPDATE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
       SET SN_INFORMAR_IMP_NAO_RETIDO_NFE = nvl(dbamv.pkg_mv2000.le_configuracao('FFCV','SN_INFORMAR_IMP_NAO_RETIDO_NFE'),'N')
     WHERE SN_INFORMAR_IMP_NAO_RETIDO_NFE IS NULL;

     COMMIT;
   END LOOP;

   dbamv.pkg_mv2000.atribui_empresa(nCdMultiEmpresa);
END;
/

COMMIT
/

ALTER TABLE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
MODIFY (SN_INFORMAR_IMP_NAO_RETIDO_NFE NOT NULL)
/

ALTER TABLE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
MODIFY (SN_INFORMAR_IMP_NAO_RETIDO_NFE DEFAULT 'N')
/

ALTER TABLE dbamv.CONFIG_NOTA_FISCAL_POR_TIPO
  ADD CONSTRAINT cnt_conf_not_fis_por_tip_33_ck CHECK (
    SN_INFORMAR_IMP_NAO_RETIDO_NFE in ('S','N')
  )
/

ALTER TABLE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
 ADD (SN_DESCRICAO_AGRUPADA_ITEM VARCHAR2(1))
/

COMMENT ON COLUMN DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO.SN_DESCRICAO_AGRUPADA_ITEM IS 'Indica se a descrição dos itnes devem ser agrupados em uma única linha. Usada para layouts ABRASF 1.0'
/

UPDATE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
   SET SN_DESCRICAO_AGRUPADA_ITEM = 'S'
 WHERE SN_DESCRICAO_AGRUPADA_ITEM IS NULL
/

COMMIT
/

ALTER TABLE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
MODIFY (SN_DESCRICAO_AGRUPADA_ITEM NOT NULL)
/

ALTER TABLE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
MODIFY (SN_DESCRICAO_AGRUPADA_ITEM DEFAULT 'S')
/

ALTER TABLE dbamv.CONFIG_NOTA_FISCAL_POR_TIPO
  ADD CONSTRAINT cnt_conf_not_fis_por_tip_34_ck CHECK (
    SN_DESCRICAO_AGRUPADA_ITEM in ('S','N')
  )
/

ALTER TABLE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
  ADD (QT_DIGITOS_DESCRICAO number)
/

COMMENT ON COLUMN DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO.QT_DIGITOS_DESCRICAO IS 'Quantidade máxima dígitos para descrição do itens na nota. Utilizado na geração dos dados na tabela imv_nota_fiscal_eletronica (mensagem Envio)'
/

ALTER TABLE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
  ADD (QT_MAXIMA_LINHAS_ITENS number)
/

COMMENT ON COLUMN DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO.QT_MAXIMA_LINHAS_ITENS IS 'Quantidade máxima de linhas para itens de uma nota fiscal. Utilizado na geração dos dados na tabela imv_nota_fiscal_eletronica (mensagem Envio)  '
/

ALTER TABLE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
  ADD (VL_TAMANHO_LINHA number)
/

COMMENT ON COLUMN DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO.VL_TAMANHO_LINHA IS 'Indica o tamanho de uma linha, na montagem da descrição do espelho da nota da prefeitura. Usado para definir quebra de linha.'
/
--<DS_SCRIPT>
-- DESCRIÇÃO..: OP 44193 - Inclusão de campos na tabela empresa formulario
-- RESPONSAVEL: Diego Costa
-- DATA.......: 26/07/2017
-- APLICAÇÃO..: FFCV
--</DS_SCRIPT>
--<USUARIO=DBAMV>
ALTER TABLE dbamv.empresa_formulario ADD (ds_multi_empresa VARCHAR2(200))
/

ALTER TABLE dbamv.empresa_formulario ADD (sn_incentivador_cultural VARCHAR2(1))
/

ALTER TABLE dbamv.empresa_formulario ADD (sn_optante_pelo_simples VARCHAR2(1))
/

ALTER TABLE dbamv.empresa_formulario ADD (tp_natureza_operacao VARCHAR2(2))
/

ALTER TABLE dbamv.empresa_formulario ADD (tp_regime_especial_tributacao VARCHAR2(1))
/

ALTER TABLE dbamv.empresa_formulario ADD (tp_geracao VARCHAR2(100))
/

ALTER TABLE dbamv.empresa_formulario ADD (tp_padrao_utilizado VARCHAR2(100))
/

ALTER TABLE dbamv.empresa_formulario ADD (ds_item_lista_servico VARCHAR2(100))
/

ALTER TABLE dbamv.empresa_formulario ADD (cd_tributacao_municipal VARCHAR2(100))
/--<DS_SCRIPT>
-- DESCRICAO...: Funcao criado para retorna apenas caracteres numericos
-- RESPONSAVEL.: AndrÃ© Cardoso
-- DATA........: 31/08/2017
-- APLICACAO...: MVINTEGRA
--</DS_SCRIPT>
--<USUARIO=MVINTEGRA>

CREATE OR REPLACE FUNCTION mvintegra.fnc_imvw_retorna_numeros(PI_VALOR_ENTRADA IN VARCHAR2 ) RETURN VARCHAR2 IS
    RESP VARCHAR2(400);
  BEGIN
    --inicializar variÃ¡vel de resposta
    RESP := '';
    --Remover do VARCHAR de entrada todos os caracteres nÃ£o numÃ©ricos
    IF NOT PI_VALOR_ENTRADA IS NULL THEN
      FOR I IN 1..LENGTH(PI_VALOR_ENTRADA) LOOP
        IF SUBSTR(PI_VALOR_ENTRADA,I,1) IN ('0','1','2','3','4','5','6','7','8','9') THEN
          RESP := RESP || SUBSTR(PI_VALOR_ENTRADA,I,1);
        END IF;
      END LOOP;
    END IF;
    RETURN RESP;
  END;
/

GRANT EXECUTE ON mvintegra.prc_imvw_sai_rps TO dbamv
/
GRANT EXECUTE ON mvintegra.fnc_imvw_retorna_numeros TO mv2000
/

--<DS_SCRIPT>
-- DESCRIÇÃO..: OP 44193 - Inclusao de campos na tabela de integração da nota fiscal SEFAZ.
-- RESPONSAVEL: Diego Costa
-- DATA.......: 13/02/2017
-- APLICAÇÃO..: FFCV
--</DS_SCRIPT>
--<USUARIO=DBAMV>

ALTER TABLE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
 ADD (SN_INFORMAR_IMP_NAO_RETIDO_NFE VARCHAR2(1))
/

COMMENT ON COLUMN DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO.SN_INFORMAR_IMP_NAO_RETIDO_NFE IS 'Indica se deve ser informado na NFE os tributos não retidos.'
/

declare
  nCdMultiEmpresa NUMBER := Nvl(dbamv.pkg_mv2000.le_empresa, 1);
BEGIN

  FOR rReg IN (SELECT cd_multi_empresa FROM dbamv.multi_empresas) LOOP

    dbamv.pkg_mv2000.atribui_empresa(rReg.cd_multi_empresa);

    UPDATE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
       SET SN_INFORMAR_IMP_NAO_RETIDO_NFE = nvl(dbamv.pkg_mv2000.le_configuracao('FFCV','SN_INFORMAR_IMP_NAO_RETIDO_NFE'),'N')
     WHERE SN_INFORMAR_IMP_NAO_RETIDO_NFE IS NULL;

     COMMIT;
   END LOOP;

   dbamv.pkg_mv2000.atribui_empresa(nCdMultiEmpresa);
END;
/

COMMIT
/

ALTER TABLE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
MODIFY (SN_INFORMAR_IMP_NAO_RETIDO_NFE NOT NULL)
/

ALTER TABLE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
MODIFY (SN_INFORMAR_IMP_NAO_RETIDO_NFE DEFAULT 'N')
/

ALTER TABLE dbamv.CONFIG_NOTA_FISCAL_POR_TIPO
  ADD CONSTRAINT cnt_conf_not_fis_por_tip_33_ck CHECK (
    SN_INFORMAR_IMP_NAO_RETIDO_NFE in ('S','N')
  )
/

ALTER TABLE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
 ADD (SN_DESCRICAO_AGRUPADA_ITEM VARCHAR2(1))
/

COMMENT ON COLUMN DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO.SN_DESCRICAO_AGRUPADA_ITEM IS 'Indica se a descrição dos itnes devem ser agrupados em uma única linha. Usada para layouts ABRASF 1.0'
/

UPDATE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
   SET SN_DESCRICAO_AGRUPADA_ITEM = 'S'
 WHERE SN_DESCRICAO_AGRUPADA_ITEM IS NULL
/

COMMIT
/

ALTER TABLE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
MODIFY (SN_DESCRICAO_AGRUPADA_ITEM NOT NULL)
/

ALTER TABLE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
MODIFY (SN_DESCRICAO_AGRUPADA_ITEM DEFAULT 'S')
/

ALTER TABLE dbamv.CONFIG_NOTA_FISCAL_POR_TIPO
  ADD CONSTRAINT cnt_conf_not_fis_por_tip_34_ck CHECK (
    SN_DESCRICAO_AGRUPADA_ITEM in ('S','N')
  )
/

ALTER TABLE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
  ADD (QT_DIGITOS_DESCRICAO number)
/

COMMENT ON COLUMN DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO.QT_DIGITOS_DESCRICAO IS 'Quantidade máxima dígitos para descrição do itens na nota. Utilizado na geração dos dados na tabela imv_nota_fiscal_eletronica (mensagem Envio)'
/

ALTER TABLE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
  ADD (QT_MAXIMA_LINHAS_ITENS number)
/

COMMENT ON COLUMN DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO.QT_MAXIMA_LINHAS_ITENS IS 'Quantidade máxima de linhas para itens de uma nota fiscal. Utilizado na geração dos dados na tabela imv_nota_fiscal_eletronica (mensagem Envio)  '
/

ALTER TABLE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
  ADD (VL_TAMANHO_LINHA number)
/

COMMENT ON COLUMN DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO.VL_TAMANHO_LINHA IS 'Indica o tamanho de uma linha, na montagem da descrição do espelho da nota da prefeitura. Usado para definir quebra de linha.'
/

--<DS_SCRIPT>
-- DESCRICAO...: Funcao criado para retorna apenas caracteres numericos
-- RESPONSAVEL.: André Cardoso
-- DATA........: 31/08/2017
-- APLICACAO...: MVINTEGRA
--</DS_SCRIPT>
--<USUARIO=MVINTEGRA>

CREATE OR REPLACE FUNCTION mvintegra.fnc_imvw_retorna_numeros(PI_VALOR_ENTRADA IN VARCHAR2 ) RETURN VARCHAR2 IS
    RESP VARCHAR2(400);
  BEGIN
    --inicializar variável de resposta
    RESP := '';
    --Remover do VARCHAR de entrada todos os caracteres não numéricos
    IF NOT PI_VALOR_ENTRADA IS NULL THEN
      FOR I IN 1..LENGTH(PI_VALOR_ENTRADA) LOOP
        IF SUBSTR(PI_VALOR_ENTRADA,I,1) IN ('0','1','2','3','4','5','6','7','8','9') THEN
          RESP := RESP || SUBSTR(PI_VALOR_ENTRADA,I,1);
        END IF;
      END LOOP;
    END IF;
    RETURN RESP;
  END;
/

GRANT EXECUTE ON mvintegra.prc_imvw_sai_rps TO dbamv
/
GRANT EXECUTE ON mvintegra.fnc_imvw_retorna_numeros TO mv2000
/

--<DS_SCRIPT>
-- DESCRIÇÃO..: Op 31792 - Ampliação de tamanho de campo
-- RESPONSAVEL: JDCS - Jadsan Santos
-- DATA.......: 15/07/2015
-- APLICAÇÃO..: GLOBAL
--</DS_SCRIPT>
--<USUARIO=DBAMV>

ALTER TABLE dbamv.pais MODIFY ( cd_pais NUMBER(4) )
/

ALTER TABLE dbamv.uf MODIFY ( cd_pais NUMBER(4) )
/

ALTER TABLE dbamv.estado MODIFY ( cd_pais NUMBER(4) )
/

ALTER TABLE dbamv.cidadanias MODIFY ( cd_pais NUMBER(4) )
/

ALTER TABLE dbamv.cidade MODIFY ( cd_pais NUMBER(4) )
/

ALTER TABLE dbamv.convenio MODIFY ( cd_pais NUMBER(4) )
/

ALTER TABLE dbamv.log_paciente_atendime MODIFY ( cd_pais NUMBER(4) )
/

ALTER TABLE dbamv.mvs_nota_fiscal MODIFY ( cd_pais NUMBER(4) )
/

ALTER TABLE dbamv.nota_fiscal MODIFY ( cd_pais NUMBER(4) )
/

ALTER TABLE dbamv.paciente MODIFY ( cd_pais NUMBER(4) )
/

ALTER TABLE dbamv.pais ADD ( cd_pais_bacen VARCHAR2(10) )
/

COMMENT ON COLUMN dbamv.pais.cd_pais_bacen IS 'Código de identificação do país no banco central'
/

--<DS_SCRIPT>
-- DESCRIÇÃO..: OP 43292 - Função auxiliar para identificar o tipo da nota fiscal
-- RESPONSAVEL: Diego Costa
-- DATA.......: 01/11/2016
-- APLICAÇÃO..: FFCV
--</DS_SCRIPT>
--<USUARIO=DBAMV>

CREATE OR REPLACE FUNCTION dbamv.fnc_ffcv_tipo_nota_fiscal(nCdNotaFiscal number) RETURN VARCHAR2 IS
    PRAGMA AUTONOMOUS_TRANSACTION;--Garantir que consulta não vai dar trigger mutante

  CURSOR cNotaFiscal IS
    SELECT cd_atendimento, tp_nota_fiscal
      FROM dbamv.nota_fiscal
     WHERE cd_nota_fiscal = nCdNotaFiscal;

  rNotaFiscal cNotaFiscal%ROWTYPE;
BEGIN
  OPEN  cNotaFiscal;
  FETCH cNotaFiscal INTO rNotaFiscal;
  CLOSE cNotaFiscal;

  IF rNotaFiscal.tp_nota_fiscal IS NULL THEN
    RETURN NULL;
  ELSE
    IF rNotaFiscal.tp_nota_fiscal = 'A' THEN
      RETURN 'A';
    ELSE
      IF rNotaFiscal.cd_atendimento IS NULL THEN
        RETURN 'C';
      ELSE
        RETURN 'P';
      END IF;
    END IF;
  END IF;
END;
/

GRANT EXECUTE ON dbamv.fnc_ffcv_tipo_nota_fiscal TO mv2000
/

GRANT EXECUTE ON dbamv.fnc_ffcv_tipo_nota_fiscal TO mvintegra
/

CREATE OR REPLACE PUBLIC SYNONYM fnc_ffcv_tipo_nota_fiscal for dbamv.fnc_ffcv_tipo_nota_fiscal
/



--<DS_SCRIPT>
-- DESCRIÇÃO..: OP 43292 - Função para retornar o tipo de agrupamento da descrição dos itens da nota fiscal
-- RESPONSAVEL: Diego Costa
-- DATA.......: 28/11/2016
-- APLICAÇÃO..: FFCV
--</DS_SCRIPT>
--<USUARIO=DBAMV>

CREATE OR REPLACE FUNCTION dbamv.fnc_ffcv_agrupamento_desc_nf(pnCdNotaFiscal NUMBER) RETURN VARCHAR2 IS

  CURSOR cTipoAgrupamento (pTpNotaFiscal VARCHAR2) IS
    SELECT tp_descricao_itens_nfe, ds_descricao_itens_nfe
      FROM dbamv.config_nota_fiscal cnf
         , dbamv.config_nota_fiscal_por_tipo ctp
     WHERE cnf.cd_config_nota_fiscal = ctp.cd_config_nota_fiscal
       AND cnf.cd_multi_empresa = dbamv.pkg_mv2000.le_empresa
       AND ctp.tp_nota_fiscal = pTpNotaFiscal;

  vTpNotaFiscal VARCHAR2(1);
  rTipoAgrupamento cTipoAgrupamento%ROWTYPE;
  vRetorno VARCHAR2(4000);
BEGIN
  vTpNotaFiscal := dbamv.fnc_ffcv_tipo_nota_fiscal(pnCdNotaFiscal);

  OPEN cTipoAgrupamento(vTpNotaFiscal);
  FETCH cTipoAgrupamento INTO rTipoAgrupamento;
  CLOSE cTipoAgrupamento;

  IF rTipoAgrupamento.tp_descricao_itens_nfe IS NULL THEN
    vRetorno := 'GF';
  ELSE
    IF rTipoAgrupamento.tp_descricao_itens_nfe = 'TL' THEN
      vRetorno := rTipoAgrupamento.ds_descricao_itens_nfe;
    ELSE
      vRetorno := rTipoAgrupamento.tp_descricao_itens_nfe;
    END IF;
  END IF;

  RETURN vRetorno;
END;
/

GRANT EXECUTE ON dbamv.fnc_ffcv_agrupamento_desc_nf TO mv2000
/
GRANT EXECUTE ON dbamv.fnc_ffcv_agrupamento_desc_nf TO mvintegra
/


--<DS_SCRIPT>
-- DESCRIÇÃO..: OP 43292 - Alteração para utilizar configurações da tela de configuraçao da nota fiscal
-- RESPONSAVEL: Diego Costa
-- DATA.......: 28/11/2016
-- APLICAÇÃO..: FFCV
--</DS_SCRIPT>
--<USUARIO=DBAMV>
CREATE OR REPLACE FUNCTION dbamv.fnc_retorna_ds_servico_rps_imv(pCd_nota_fiscal NUMBER) return varchar2 is
  --
  cursor cGrupoFaturamento is
    SELECT distinct GRU_FAT.DS_GRU_FAT DS_GRU_FAT
          ,replace(replace(replace(TO_CHAR(ITNOTA_FISCAL.VL_GRU_FAT,'999,999,999,999,999.99'),'.','a'),',','.'),'a',',') DS_VL_GRU_FAT
    FROM   DBAMV.ITNOTA_FISCAL       ITNOTA_FISCAL
          ,DBAMV.GRU_FAT             GRU_FAT
    WHERE  ITNOTA_FISCAL.CD_NOTA_FISCAL = pCd_nota_fiscal
      AND  GRU_FAT.CD_GRU_FAT           = ITNOTA_FISCAL.CD_GRU_FAT
    ORDER BY GRU_FAT.DS_GRU_FAT;

  cursor cGrupoFaturamentoDecode is
    SELECT decode(gru_fat.tp_gru_fat,'SH','PRESTACAO DE SERVICOS HOSPITALARES',
                                     'SD','PRESTACAO DE SERVICOS HOSPITALARES',
                                     'OU','PRESTACAO DE SERVICOS HOSPITALARES')     DS_PREST_SERV,
           decode(gru_fat.tp_gru_fat,'MD','MATERIAIS E MEDICAMENTOS',
                                     'MT','MATERIAIS E MEDICAMENTOS',
                                     'MM','MATERIAIS E MEDICAMENTOS',
                                     'OP','MATERIAIS E MEDICAMENTOS')               DS_MAT_MED,
           decode(gru_fat.tp_gru_fat,'SP','HONORARIOS MEDICOS TRANSF. A TERCEIROS') DS_HONO_MED
    FROM   DBAMV.ITNOTA_FISCAL       ITNOTA_FISCAL
          ,DBAMV.GRU_FAT             GRU_FAT
    WHERE  ITNOTA_FISCAL.CD_NOTA_FISCAL = pCd_nota_fiscal
    AND    GRU_FAT.CD_GRU_FAT           = ITNOTA_FISCAL.CD_GRU_FAT
    ORDER BY decode(gru_fat.tp_gru_fat,'SH','PRESTACAO DE SERVICOS HOSPITALARES',
                                       'SD','PRESTACAO DE SERVICOS HOSPITALARES',
                                       'OU','PRESTACAO DE SERVICOS HOSPITALARES'),
             decode(gru_fat.tp_gru_fat,'MD','MATERIAIS E MEDICAMENTOS',
                                       'MT','MATERIAIS E MEDICAMENTOS',
                                       'MM','MATERIAIS E MEDICAMENTOS',
                                       'OP','MATERIAIS E MEDICAMENTOS'),
             decode(gru_fat.tp_gru_fat,'SP','HONORARIOS MEDICOS TRANSF. A TERCEIROS');
  --

  cursor cGrupoProcedimento is
    select distinct gru_pro.ds_gru_pro
           from dbamv.itfat_nota_fiscal itfat,
                dbamv.pro_fat,
                dbamv.gru_pro
          where itfat.cd_nota_fiscal = pCd_nota_fiscal
            and itfat.cd_pro_fat     = pro_fat.cd_pro_fat
            and gru_pro.cd_gru_pro   = pro_fat.cd_gru_pro;
  --
  cursor cProcedimentoFaturamento is
    SELECT distinct PRO_FAT.DS_PRO_FAT    DS_PRO_FAT
    FROM   DBAMV.ITFAT_NOTA_FISCAL   ITFAT_NOTA_FISCAL
	  ,DBAMV.PRO_FAT             PRO_FAT
    WHERE  ITFAT_NOTA_FISCAL.CD_NOTA_FISCAL = pCd_nota_fiscal
    AND    PRO_FAT.CD_PRO_FAT               = ITFAT_NOTA_FISCAL.CD_PRO_FAT
    order by PRO_FAT.DS_PRO_FAT;

  --

  vTp_convenio    varchar2(1);
  vTp_nota_fiscal varchar2(1);
  vDs_servico     varchar2(60);
  vServico        varchar2(2300);
  vChave          varchar2(100);
  vcGrupoFaturamentoDecode  cGrupoFaturamentoDecode%rowtype;
  vcGrupoFaturamento  cGrupoFaturamento%rowtype;
  vAuxiliar       varchar2(100);
begin
  --
  vChave := dbamv.fnc_ffcv_agrupamento_desc_nf(pCd_nota_fiscal);
  --
  vServico := '';
  --
  if vChave = 'GF' then
    --
    -- GRUPO DE FATURAMENTO
    --
    open cGrupoFaturamento;
    loop
    --
      fetch cGrupoFaturamento into vcGrupoFaturamento;
      if cGrupoFaturamento%notfound then
        close cGrupoFaturamento;
        exit;
      end if;
      vServico := vServico || ltrim(rtrim(vcGrupoFaturamento.DS_GRU_FAT));
      vServico := vServico || '  R$ ' || ltrim(rtrim(vcGrupoFaturamento.DS_VL_GRU_FAT)) || '|';
    --
    end loop;
    --
  elsif vChave = 'GD' then
    --
    -- GRUPO DE FATURAMENTO DECODIFICADO
    --
    open cGrupoFaturamentoDecode;
    loop
    --
      fetch cGrupoFaturamentoDecode into vcGrupoFaturamentoDecode;
      if cGrupoFaturamentoDecode%notfound then
        close cGrupoFaturamentoDecode;
        exit;
      end if;
      if ltrim(rtrim(vcGrupoFaturamentoDecode.DS_PREST_SERV)) is not null then
        vServico := vServico || ltrim(rtrim(vcGrupoFaturamentoDecode.DS_PREST_SERV)) || '|';
      end if;
      if ltrim(rtrim(vcGrupoFaturamentoDecode.DS_MAT_MED)) is not null then
        vServico := vServico || ltrim(rtrim(vcGrupoFaturamentoDecode.DS_MAT_MED)) || '|';
      end if;
      if ltrim(rtrim(vcGrupoFaturamentoDecode.DS_HONO_MED)) is not null then
        vServico := vServico || ltrim(rtrim(vcGrupoFaturamentoDecode.DS_HONO_MED)) || '|';
      end if;
    --
    end loop;
    --
  elsif vChave = 'GP' then
    --
    -- GRUPO DE PROCEDIMENTO
    --
    open cGrupoProcedimento;
    loop
    --
      fetch cGrupoProcedimento into vDs_servico;
      if cGrupoProcedimento%notfound then
        close cGrupoProcedimento;
        exit;
      end if;
      vServico := vServico || ltrim(rtrim(vDs_servico)) || '|';
    --
    end loop;
    --
  elsif vChave = 'PF' then
    --
    -- PROCEDIMENTOS DO FATURAMENTO
    --
    open cProcedimentoFaturamento;
    loop
    --
      fetch cProcedimentoFaturamento into vDs_servico;
      if cProcedimentoFaturamento%notfound then
        close cProcedimentoFaturamento;
        exit;
      end if;
      vServico := vServico || ltrim(rtrim(vDs_servico)) || '|';
    --
    end loop;
    --
  elsif vChave is not null then
    --
    -- TEXTO FIXO INFORMADO NA CONFIGURAÇÃO
    --
    -- pda 166623 - 11/10/2006 - Amalia Araújo - Colocando o caractere de concatenação (pipe).
    vServico := vChave || '|';
    -- pda 166623 - fim
  end if;
  --
  return ltrim(rtrim(vServico));
  --
exception
  when OTHERS then
    --
    return sqlerrm;
    --
end;
/

GRANT EXECUTE ON dbamv.fnc_retorna_ds_servico_rps_imv TO dbaps
/
GRANT EXECUTE ON dbamv.fnc_retorna_ds_servico_rps_imv TO dbasgu
/
GRANT EXECUTE ON dbamv.fnc_retorna_ds_servico_rps_imv TO mv2000
/
GRANT EXECUTE ON dbamv.fnc_retorna_ds_servico_rps_imv TO mvintegra
/

--<DS_SCRIPT>
-- DESCRICAO...: OP 25113 - Criação de campo para contemplar identificação de código externo do pais
-- RESPONSAVEL.: André Piana
-- DATA........: 11/11/2014
-- APLICACAO...: GLOBAL
--</DS_SCRIPT>
--<USUARIO=DBAMV>

ALTER TABLE DBAMV.PAIS ADD CD_PAIS_EXTERNO VARCHAR2(20)
/
-- Comentarios campos padrão
COMMENT ON COLUMN DBAMV.PAIS.CD_PAIS_EXTERNO IS 'Código de identificação do país externo'
/

--<DS_SCRIPT>
-- DESCRIÇÃO..: OP 33810 - Adicionado nova coluna CD_TOM para atender as prefeituras de Arapongas e Apucarana com o novo layout da NFSe.
-- RESPONSAVEL: Diego Almeida
-- DATA.......: 06/11/2015
-- APLICAÇÃO..: FFCV
--</DS_SCRIPT>
--<USUARIO=DBAMV>

ALTER TABLE DBAMV.CIDADE
ADD CD_TOM VARCHAR2(5)
/

COMMENT ON COLUMN DBAMV.CIDADE.CD_TOM IS 'Armazena o Código TOM, gerado pela Receita Federal, para cada cidade'
/

--<DS_SCRIPT>
-- DESCRIÇÃO..: OP 33812  - Replicação de criação de coluna SIAFI, na tabela de cidade, para deixar estrutura igual ao SOUL.
-- RESPONSAVEL: Diego Costa
-- DATA.......: 01/12/2015
-- APLICAÇÃO..: FFCV
--</DS_SCRIPT>
--<USUARIO=DBAMV>

-- ALTERANDO A TABELA DE NOTA FISCAL
ALTER TABLE dbamv.cidade ADD (CD_SIAFI VARCHAR2(200))
/

--<DS_SCRIPT>
-- DESCRIÇÃO..: OP 44193 - Inclusão de campos na tabela empresa formulario
-- RESPONSAVEL: Diego Costa
-- DATA.......: 26/07/2017
-- APLICAÇÃO..: FFCV
--</DS_SCRIPT>
--<USUARIO=DBAMV>
ALTER TABLE dbamv.empresa_formulario ADD (ds_multi_empresa VARCHAR2(200))
/

ALTER TABLE dbamv.empresa_formulario ADD (sn_incentivador_cultural VARCHAR2(1))
/

ALTER TABLE dbamv.empresa_formulario ADD (sn_optante_pelo_simples VARCHAR2(1))
/

ALTER TABLE dbamv.empresa_formulario ADD (tp_natureza_operacao VARCHAR2(2))
/

ALTER TABLE dbamv.empresa_formulario ADD (tp_regime_especial_tributacao VARCHAR2(1))
/

ALTER TABLE dbamv.empresa_formulario ADD (tp_geracao VARCHAR2(100))
/

ALTER TABLE dbamv.empresa_formulario ADD (tp_padrao_utilizado VARCHAR2(100))
/

ALTER TABLE dbamv.empresa_formulario ADD (ds_item_lista_servico VARCHAR2(100))
/

ALTER TABLE dbamv.empresa_formulario ADD (cd_tributacao_municipal VARCHAR2(100))
/

--<DS_SCRIPT>
-- DESCRIÇÃO..: OP 35910 - Replicação de Criação da coluna DS_EMAIL na tabela de formulário da empresa
-- RESPONSAVEL: Diego Costa
-- DATA.......: 12/01/2016
-- APLICAÇÃO..: FFCV
--</DS_SCRIPT>
--<USUARIO=DBAMV>

ALTER TABLE DBAMV.EMPRESA_FORMULARIO ADD DS_EMAIL VARCHAR2(2000)
/

COMMENT ON COLUMN DBAMV.EMPRESA_FORMULARIO.DS_EMAIL IS 'Email da empresa'
/

--<DS_SCRIPT>
-- DESCRIÇÃO..: OP 43292 - Correcão na descrição da nota fsical de convênio.
-- RESPONSAVEL: Diego Costa
-- DATA.......: 31/10/2016
-- APLICAÇÃO..: FFCV
--</DS_SCRIPT>
--<USUARIO=DBAMV>

CREATE TABLE dbamv.config_nota_fiscal_por_tipo (
  cd_config_nota_fiscal         NUMBER         NOT NULL,
  tp_nota_fiscal                VARCHAR2(1)    NOT NULL,
  sn_obriga_cliente             VARCHAR2(1)    DEFAULT 'S' NOT NULL,
  sn_validar_cliente            VARCHAR2(1)    DEFAULT 'S' NOT NULL,
  sn_obriga_tipo_pessoa         VARCHAR2(1)    DEFAULT 'S' NOT NULL,
  sn_validar_tipo_pessoa        VARCHAR2(1)    DEFAULT 'S' NOT NULL,
  sn_obriga_logradouro          VARCHAR2(1)    DEFAULT 'S' NOT NULL,
  sn_validar_logradouro         VARCHAR2(1)    DEFAULT 'S' NOT NULL,
  sn_obriga_endereco            VARCHAR2(1)    DEFAULT 'S' NOT NULL,
  sn_validar_endereco           VARCHAR2(1)    DEFAULT 'S' NOT NULL,
  sn_obriga_complemento         VARCHAR2(1)    DEFAULT 'S' NOT NULL,
  sn_validar_complemento        VARCHAR2(1)    DEFAULT 'S' NOT NULL,
  sn_obriga_numero              VARCHAR2(1)    DEFAULT 'S' NOT NULL,
  sn_validar_numero             VARCHAR2(1)    DEFAULT 'S' NOT NULL,
  sn_obriga_bairro              VARCHAR2(1)    DEFAULT 'S' NOT NULL,
  sn_validar_bairro             VARCHAR2(1)    DEFAULT 'S' NOT NULL,
  sn_obriga_cidade              VARCHAR2(1)    DEFAULT 'S' NOT NULL,
  sn_validar_cidade             VARCHAR2(1)    DEFAULT 'S' NOT NULL,
  sn_obriga_email               VARCHAR2(1)    DEFAULT 'S' NOT NULL,
  sn_validar_email              VARCHAR2(1)    DEFAULT 'S' NOT NULL,
  sn_obriga_cep                 VARCHAR2(1)    DEFAULT 'S' NOT NULL,
  sn_validar_cep                VARCHAR2(1)    DEFAULT 'S' NOT NULL,
  sn_obriga_telefone            VARCHAR2(1)    DEFAULT 'S' NOT NULL,
  sn_validar_telefone           VARCHAR2(1)    DEFAULT 'S' NOT NULL,
  sn_obriga_cnpj_cpf            VARCHAR2(1)    DEFAULT 'S' NOT NULL,
  sn_validar_cnpj_cpf           VARCHAR2(1)    DEFAULT 'S' NOT NULL,
  ds_cnpj_cpf_padrao            VARCHAR2(14)   NULL,
  ds_cnpj_cpf_padrao_estraing   VARCHAR2(14)   NULL,
  cd_cidade_padrao_estrangeiro  NUMBER         NULL,
  nm_cidade_padrao_estrangeiro  VARCHAR2(200)  NULL,
  nm_uf_padrao_estrangeiro      VARCHAR2(30)   NULL,
  cd_pais_padrao_estrangeiro    NUMBER         NULL,
  ds_pais_padrao_estrangeiro    VARCHAR2(200)  NULL,
  vl_aliquota_aproximado_trib   NUMBER         NULL,
  ds_texto_vl_aproximado_trib   VARCHAR2(500)  NULL,
  sn_incluir_remessa            VARCHAR2(1)    DEFAULT 'N' NOT NULL,
  ds_convenio_excessao_remessa  VARCHAR2(2000) NULL,
  sn_incluir_paciente           VARCHAR2(1)    DEFAULT 'N' NOT NULL,
  ds_convenio_excessao_paciente VARCHAR2(2000) NULL,
  sn_incluir_atendimento        VARCHAR2(1)    DEFAULT 'N' NOT NULL,
  ds_convenio_excessao_atendime VARCHAR2(2000) NULL,
  tp_descricao_itens_nfe        VARCHAR2(2)    DEFAULT 'GF' NOT NULL,
  ds_descricao_itens_nfe        VARCHAR2(2000) NULL
)
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_conf_not_fis_por_tipo_1_ck CHECK (
    tp_nota_fiscal in ('P','C','A')
  )
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_conf_not_fis_por_tipo_2_ck CHECK (
    sn_obriga_cliente in ('S','N')
  )
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_conf_not_fis_por_tipo_3_ck CHECK (
    sn_validar_cliente in ('S','N')
  )
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_conf_not_fis_por_tipo_4_ck CHECK (
    sn_obriga_tipo_pessoa in ('S','N')
  )
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_conf_not_fis_por_tipo_5_ck CHECK (
    sn_validar_tipo_pessoa in ('S','N')
  )
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_conf_not_fis_por_tipo_6_ck CHECK (
    sn_obriga_logradouro IN ('S','N')
  )
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_conf_not_fis_por_tipo_7_ck CHECK (
    sn_validar_logradouro IN ('S','N')
  )
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_conf_not_fis_por_tipo_8_ck CHECK (
    sn_obriga_endereco IN ('S','N')
  )
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_conf_not_fis_por_tipo_9_ck CHECK (
    sn_validar_endereco IN ('S','N')
  )
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_conf_not_fis_por_tip_10_ck CHECK (
    sn_obriga_numero IN ('S','N')
  )
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_conf_not_fis_por_tip_11_ck CHECK (
    sn_validar_numero IN ('S','N')
  )
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_conf_not_fis_por_tip_12_ck CHECK (
    sn_obriga_bairro IN ('S','N')
  )
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_conf_not_fis_por_tip_13_ck CHECK (
    sn_validar_bairro IN ('S','N')
  )
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_conf_not_fis_por_tip_14_ck CHECK (
    sn_obriga_cidade IN ('S','N')
  )
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_conf_not_fis_por_tip_15_ck CHECK (
    sn_validar_cidade IN ('S','N')
  )
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_conf_not_fis_por_tip_16_ck CHECK (
    sn_obriga_email IN ('S','N')
  )
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_conf_not_fis_por_tip_17_ck CHECK (
    sn_validar_email IN ('S','N')
  )
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_conf_not_fis_por_tip_18_ck CHECK (
    sn_obriga_cep IN ('S','N')
  )
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_conf_not_fis_por_tip_19_ck CHECK (
    sn_validar_cep IN ('S','N')
  )
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_conf_not_fis_por_tip_20_ck CHECK (
    sn_obriga_telefone IN ('S','N')
  )
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_conf_not_fis_por_tip_21_ck CHECK (
    sn_validar_telefone IN ('S','N')
  )
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_conf_not_fis_por_tip_22_ck CHECK (
    sn_obriga_cnpj_cpf IN ('S','N')
  )
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_conf_not_fis_por_tip_23_ck CHECK (
    sn_validar_cnpj_cpf IN ('S','N')
  )
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_conf_not_fis_por_tip_24_ck CHECK (
    sn_obriga_complemento IN ('S','N')
  )
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_conf_not_fis_por_tip_25_ck CHECK (
    sn_validar_complemento IN ('S','N')
  )
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_conf_not_fis_por_tip_26_ck CHECK (
    sn_incluir_remessa IN ('S','N')
  )
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_conf_not_fis_por_tip_27_ck CHECK (
    sn_incluir_paciente IN ('S','N')
  )
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_conf_not_fis_por_tip_28_ck CHECK (
    sn_incluir_atendimento IN ('S','N')
  )
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_conf_not_fis_por_tip_29_ck CHECK (
    tp_descricao_itens_nfe in ('GF','PF','GP', 'TL')
  )
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_config_nota_fiscal_tipo_pk PRIMARY KEY (
    cd_config_nota_fiscal,
    tp_nota_fiscal
  )
  USING INDEX
    TABLESPACE mv2000_i
/

ALTER TABLE dbamv.config_nota_fiscal_por_tipo
  ADD CONSTRAINT cnt_config_nf_config_nf_tp_fk FOREIGN KEY (
    cd_config_nota_fiscal
  ) REFERENCES dbamv.config_nota_fiscal (
    cd_config_nota_fiscal
  )
/

COMMENT ON TABLE dbamv.config_nota_fiscal_por_tipo IS 'Armazena configurações de nota fiscal por tipo de nota fiscal[P-Particular | C-Convênio | A-Avulsa]'
/

COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.cd_config_nota_fiscal IS 'Código da configuração da nota fiscal, faz parte da chave primária e relaciona a configuração por tipo com a configuração global'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.tp_nota_fiscal IS 'Tipifica para que tipo de nota fiscal a configuração é valida [P-Particular | C-Convênio | A-Avulsa]'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.sn_obriga_cliente IS 'Indica se o campo de dados do cliente é obrigatório. Se tiver valor S, o campo vai ser automaticamente validado.'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.sn_validar_cliente IS 'Indica se o campo dados do cliente estiver preenchido, ele será validado. Se o campo estiver como obrigatório, ele será validado independete dessa configuração.'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.sn_obriga_tipo_pessoa IS 'Indica se o campo tipo de pessoa é obrigatório. Se tiver valor S, o campo vai ser automaticamente validado.'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.sn_validar_tipo_pessoa IS 'Indica se o campo tipo de pessoa estiver preenchido, ele será validado. Se o campo estiver como obrigatório, ele será validado independete dessa configuração.'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.sn_obriga_logradouro IS 'Indica se o campo logradouro é obrigatório. Se tiver valor S, o campo vai ser automaticamente validado.'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.sn_validar_logradouro IS 'Indica se o campo logradouro estiver preenchido, ele será validado. Se o campo estiver como obrigatório, ele será validado independete dessa configuração.'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.sn_obriga_endereco IS 'Indica se o campo endereço é obrigatório. Se tiver valor S, o campo vai ser automaticamente validado.'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.sn_validar_endereco IS 'Indica se o campo endereço estiver preenchido, ele será validado. Se o campo estiver como obrigatório, ele será validado independete dessa configuração.'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.sn_obriga_complemento IS 'Indica se o campo complemento é obrigatório. Se tiver valor S, o campo vai ser automaticamente validado.'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.sn_validar_complemento IS 'Indica se o campo complemento estiver preenchido, ele será validado. Se o campo estiver como obrigatório, ele será validado independete dessa configuração.'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.sn_obriga_numero IS 'Indica se o campo número é obrigatório. Se tiver valor S, o campo vai ser automaticamente validado.'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.sn_validar_numero IS 'Indica se o campo número estiver preenchido, ele será validado. Se o campo estiver como obrigatório, ele será validado independete dessa configuração.'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.sn_obriga_bairro IS 'Indica se o campo bairro é obrigatório. Se tiver valor S, o campo vai ser automaticamente validado.'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.sn_validar_bairro IS 'Indica se o campo bairro estiver preenchido, ele será validado. Se o campo estiver como obrigatório, ele será validado independete dessa configuração.'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.sn_obriga_cidade IS 'Indica se o campo cidade é obrigatório. Se tiver valor S, o campo vai ser automaticamente validado.'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.sn_validar_cidade IS 'Indica se o campo cidade estiver preenchido, ele será validado. Se o campo estiver como obrigatório, ele será validado independete dessa configuração.'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.sn_obriga_email IS 'Indica se o campo e-amil é obrigatório. Se tiver valor S, o campo vai ser automaticamente validado.'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.sn_validar_email IS 'Indica se o campo e-mail estiver preenchido, ele será validado. Se o campo estiver como obrigatório, ele será validado independete dessa configuração.'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.sn_obriga_cep IS 'Indica se o campo CEP é obrigatório. Se tiver valor S, o campo vai ser automaticamente validado.'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.sn_validar_cep IS 'Indica se o campo CEP estiver preenchido, ele será validado. Se o campo estiver como obrigatório, ele será validado independete dessa configuração.'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.sn_obriga_telefone IS 'Indica se o campo telefone é obrigatório. Se tiver valor S, o campo vai ser automaticamente validado.'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.sn_validar_telefone IS 'Indica se o campo telefone estiver preenchido, ele será validado. Se o campo estiver como obrigatório, ele será validado independete dessa configuração.'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.sn_obriga_cnpj_cpf IS 'Indica se o campo CNPJ/CPF é obrigatório. Se tiver valor S, o campo vai ser automaticamente validado.'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.sn_validar_cnpj_cpf IS 'Indica se o campo CNPJ/CPF estiver preenchido, ele será validado. Se o campo estiver como obrigatório, ele será validado independete dessa configuração.'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.ds_cnpj_cpf_padrao IS 'Valor para atribuir como padrão ao campo CNPJ/CPF, caso o paciente, convênio ou fornecedor não possua esse documento informado.'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.ds_cnpj_cpf_padrao_estraing IS 'Valor para atribuir como padrão ao campo CNPJ/CPF, quando o tomador for estrangeiro.'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.cd_cidade_padrao_estrangeiro IS 'Valor para atribuir como cidade padrão, quando o tomador for estrangeiro.'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.nm_uf_padrao_estrangeiro IS 'Valor para atribuir como UF padrão, quando o tomador for estrangeiro.'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.cd_pais_padrao_estrangeiro IS 'Valor para atribuir como código de país padrão, quando o tomador for estrangeiro.'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.ds_pais_padrao_estrangeiro IS 'Valor para atribuir como nome de país padrão, quando o tomador for estrangeiro.'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.vl_aliquota_aproximado_trib IS 'Valor da aliquota para calcular valor aproximado dos tributos, da lei 12.741'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.ds_texto_vl_aproximado_trib IS 'Texto para ser utilizado na descrição do valor aproximado dos tributos'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.sn_incluir_remessa IS 'Indica se deve incluir os números da remessa no corpo da nota'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.ds_convenio_excessao_remessa IS 'Convênios que não devem incluir os números das remessas no corpo da nota. Deve ser informado o número separado por vírgula. Exemplo: 12,30,51,6,7'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.sn_incluir_paciente IS 'Indica se deve incluir o nome do paciente no corpo da nota'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.ds_convenio_excessao_paciente IS 'Convênios que não devem incluir o nome do paciente no corpo da nota. Deve ser informado o número separado por vírgula. Exemplo: 12,30,51,6,7'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.sn_incluir_atendimento IS 'Indica se deve incluir o atendimento no corpo da nota'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.ds_convenio_excessao_atendime IS 'Convênios que não devem incluir o atendimento no corpo da nota. Deve ser informado o número separado por vírgula. Exemplo: 12,30,51,6,7'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.tp_descricao_itens_nfe IS 'Identifica a forma de agrupamento dos itens da nota fiscal: [GF - Grupo de Faturamento | GP - Grupo de procedimento | PF - Procedimento na Fatura | TL - Texto livre'
/
COMMENT ON COLUMN dbamv.config_nota_fiscal_por_tipo.ds_descricao_itens_nfe IS 'Quando o tp_descricao_itens_nfe for TX, o texto dessa variável será utilizado como texto do item da nota fiscal.'
/

GRANT DELETE,INSERT,SELECT,UPDATE ON dbamv.config_nota_fiscal_por_tipo TO mv2000
/

GRANT INSERT,SELECT,UPDATE ON dbamv.config_nota_fiscal_por_tipo TO mvintegra
/

--<DS_SCRIPT>
-- DESCRIÇÃO..: OP 44193 - Inclusao de campos na tabela de integração da nota fiscal SEFAZ.
-- RESPONSAVEL: Diego Costa
-- DATA.......: 13/02/2017
-- APLICAÇÃO..: FFCV
--</DS_SCRIPT>
--<USUARIO=DBAMV>

ALTER TABLE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
 ADD (SN_INFORMAR_IMP_NAO_RETIDO_NFE VARCHAR2(1))
/

COMMENT ON COLUMN DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO.SN_INFORMAR_IMP_NAO_RETIDO_NFE IS 'Indica se deve ser informado na NFE os tributos não retidos.'
/

declare
  nCdMultiEmpresa NUMBER := Nvl(dbamv.pkg_mv2000.le_empresa, 1);
BEGIN

  FOR rReg IN (SELECT cd_multi_empresa FROM dbamv.multi_empresas) LOOP

    dbamv.pkg_mv2000.atribui_empresa(rReg.cd_multi_empresa);

    UPDATE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
       SET SN_INFORMAR_IMP_NAO_RETIDO_NFE = nvl(dbamv.pkg_mv2000.le_configuracao('FFCV','SN_INFORMAR_IMP_NAO_RETIDO_NFE'),'N')
     WHERE SN_INFORMAR_IMP_NAO_RETIDO_NFE IS NULL;

     COMMIT;
   END LOOP;

   dbamv.pkg_mv2000.atribui_empresa(nCdMultiEmpresa);
END;
/

COMMIT
/

ALTER TABLE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
MODIFY (SN_INFORMAR_IMP_NAO_RETIDO_NFE NOT NULL)
/

ALTER TABLE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
MODIFY (SN_INFORMAR_IMP_NAO_RETIDO_NFE DEFAULT 'N')
/

ALTER TABLE dbamv.CONFIG_NOTA_FISCAL_POR_TIPO
  ADD CONSTRAINT cnt_conf_not_fis_por_tip_33_ck CHECK (
    SN_INFORMAR_IMP_NAO_RETIDO_NFE in ('S','N')
  )
/

ALTER TABLE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
 ADD (SN_DESCRICAO_AGRUPADA_ITEM VARCHAR2(1))
/

COMMENT ON COLUMN DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO.SN_DESCRICAO_AGRUPADA_ITEM IS 'Indica se a descrição dos itnes devem ser agrupados em uma única linha. Usada para layouts ABRASF 1.0'
/

UPDATE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
   SET SN_DESCRICAO_AGRUPADA_ITEM = 'S'
 WHERE SN_DESCRICAO_AGRUPADA_ITEM IS NULL
/

COMMIT
/

ALTER TABLE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
MODIFY (SN_DESCRICAO_AGRUPADA_ITEM NOT NULL)
/

ALTER TABLE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
MODIFY (SN_DESCRICAO_AGRUPADA_ITEM DEFAULT 'S')
/

ALTER TABLE dbamv.CONFIG_NOTA_FISCAL_POR_TIPO
  ADD CONSTRAINT cnt_conf_not_fis_por_tip_34_ck CHECK (
    SN_DESCRICAO_AGRUPADA_ITEM in ('S','N')
  )
/

ALTER TABLE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
  ADD (QT_DIGITOS_DESCRICAO number)
/

COMMENT ON COLUMN DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO.QT_DIGITOS_DESCRICAO IS 'Quantidade máxima dígitos para descrição do itens na nota. Utilizado na geração dos dados na tabela imv_nota_fiscal_eletronica (mensagem Envio)'
/

ALTER TABLE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
  ADD (QT_MAXIMA_LINHAS_ITENS number)
/

COMMENT ON COLUMN DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO.QT_MAXIMA_LINHAS_ITENS IS 'Quantidade máxima de linhas para itens de uma nota fiscal. Utilizado na geração dos dados na tabela imv_nota_fiscal_eletronica (mensagem Envio)  '
/

ALTER TABLE DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO
  ADD (VL_TAMANHO_LINHA number)
/

COMMENT ON COLUMN DBAMV.CONFIG_NOTA_FISCAL_POR_TIPO.VL_TAMANHO_LINHA IS 'Indica o tamanho de uma linha, na montagem da descrição do espelho da nota da prefeitura. Usado para definir quebra de linha.'
/

--<DS_SCRIPT>
-- DESCRIÇÃO..: Processo de Integração
-- RESPONSAVEL: andré cardoso
-- DATA.......: 10/05/2017
-- APLICAÇÃO..: Integração
--</DS_SCRIPT>
--<USUARIO=DBAMV>

/*  MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA  */

ALTER TABLE MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA ADD (TP_ORIGEM_NF  NUMBER(1))
/

ALTER TABLE MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA ADD (NR_RSP_NOTA_FISCAL_NFE  NUMBER(20))
/

ALTER TABLE MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA ADD (HR_RSP_EMISSAO_NFE  DATE)
/

ALTER TABLE MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA ADD (CD_RSP_VERIFICACAO_NFE  VARCHAR2(4000))
/

ALTER TABLE MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA ADD (NR_RSP_PROTOCOLO  VARCHAR2(50))
/

ALTER TABLE MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA ADD (DT_RSP_PROTOCOLO  DATE)
/

ALTER TABLE MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA ADD (DS_RSP_URL_NFE  VARCHAR2(4000))
/

ALTER TABLE MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA ADD (DS_RSP_RETORNO_NFE  VARCHAR2(4000))
/

ALTER TABLE MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA ADD (NR_RSP_PROTOCOLO_CANCELAMENTO  VARCHAR2(100))
/

ALTER TABLE MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA ADD (DT_RSP_CANCELAMENTO_NFE  DATE)
/

ALTER TABLE MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA ADD (CD_STATUS_INTEGRACAO  VARCHAR2(2))
/

ALTER TABLE MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA MODIFY(DS_RAZAO_SOCIAL_PRESTADOR VARCHAR2(300 BYTE))
/

ALTER TABLE MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA MODIFY(DS_RAZAO_SOCIAL_TOMADOR VARCHAR2(300 BYTE))
/

ALTER TABLE MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA MODIFY(DS_RAZAO_SOC_INTERMEDIARIO VARCHAR2(300 BYTE))
/

COMMENT ON COLUMN MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA.TP_ORIGEM_NF IS 'Tipo de Origem do registro: 1 - DBAMV.NOTA_FISCAL; 2 - DBAMV.MVS_NOTA_FISCAL'
/

COMMENT ON COLUMN MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA.NR_RSP_NOTA_FISCAL_NFE IS 'Resposta: Numero da nota fiscal convertida.'
/

COMMENT ON COLUMN MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA.HR_RSP_EMISSAO_NFE IS 'Resposta: Hora de emissão da nota convertida'
/

COMMENT ON COLUMN MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA.CD_RSP_VERIFICACAO_NFE IS 'Resposta: Chave de Verificação de conversão.'
/

COMMENT ON COLUMN MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA.NR_RSP_PROTOCOLO IS 'Resposta: Protocolo de recebimento do XML'
/

COMMENT ON COLUMN MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA.DT_RSP_PROTOCOLO IS 'Resposta: Data hora de recebimento do protocolo'
/

COMMENT ON COLUMN MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA.DS_RSP_URL_NFE IS 'Resposta: URL para impressão do espelho de nota'
/

COMMENT ON COLUMN MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA.DS_RSP_RETORNO_NFE IS 'Resposta: Retorno do processamento do XML encaminhado'
/

COMMENT ON COLUMN MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA.NR_RSP_PROTOCOLO_CANCELAMENTO IS 'Resposta: Número do protocolo de cancelamento da NOTA convertida'
/

COMMENT ON COLUMN MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA.DT_RSP_CANCELAMENTO_NFE IS 'Resposta: Data de recebimento do protocolo de cancelamento de nota'
/

COMMENT ON COLUMN MVINTEGRA.IMV_NOTA_FISCAL_ELETRONICA.CD_STATUS_INTEGRACAO IS 'Status de Geração da NFe: W - Registro recém inserido, aguardando ativação para processamento; A-Aguradando processamento da integração;I-Registro iniciou integração;P-Em processamento;'
/


/*  DBAMV.HISTORICO_SITUACAO_NOTA_FISCAL  */

ALTER TABLE DBAMV.HISTORICO_SITUACAO_NOTA_FISCAL ADD (TP_ORIGEM_NF  NUMBER(2))
/

COMMENT ON COLUMN DBAMV.HISTORICO_SITUACAO_NOTA_FISCAL.TP_ORIGEM_NF IS 'Tipo de Origem do registro: 1 - DBAMV.NOTA_FISCAL; 2 - DBAMV.MVS_NOTA_FISCAL'
/

/* DBAMV.NOTA_FISCAL */
COMMENT ON COLUMN DBAMV.NOTA_FISCAL.NR_PROTOCOLO_CANCELAMENTO IS 'Numero do protocolo de cancelamento da nota convertida'
/

--<DS_SCRIPT>
-- DESCRIÇÃO..: SUP-75452 - Inclusão do caracter & na lista de caracters especiais.
-- RESPONSAVEL: Diego Costa
-- DATA.......: 10/07/2018
-- APLICAÇÃO..: MVINTEGRA
--</DS_SCRIPT>
--<USUARIO=MVINTEGRA>
CREATE OR REPLACE FUNCTION mvintegra.fnc_imvw_retira_acento(cString  IN VARCHAR) RETURN VARCHAR IS
BEGIN
  if (cString is null) then
    RETURN cString;
  end if;
  RETURN TRANSLATE( cString ,
                        CHR(126) ||    /* ~ */
                        CHR(180) ||    /* ´ */
                        CHR(038) ||    /* & */
                        CHR(039) ||    /* ' */
                        CHR(191) ||    /* ¿ */
                        CHR(159) ||    /* Y */
                        CHR(170) ||    /* ª */
                        CHR(176) ||    /* º */
                        CHR(186) ||    /* º */
                        CHR(199) ||    /* Ç */
                        CHR(231) ||    /* ç */
                        CHR(192) ||    /* À */
                        CHR(193) ||    /* Á */
                        CHR(194) ||    /* Â */
                        CHR(195) ||    /* Ã */
                        CHR(196) ||    /* Ä */
                        CHR(200) ||    /* È */
                        CHR(201) ||    /* É */
                        CHR(202) ||    /* Ê */
                        CHR(203) ||    /* Ë */
                        CHR(204) ||    /* Ì */
                        CHR(205) ||    /* Í */
                        CHR(206) ||    /* Î */
                        CHR(207) ||    /* Ï */
                        CHR(209) ||    /* Ñ */
                        CHR(210) ||    /* Ò */
                        CHR(211) ||    /* Ó */
                        CHR(212) ||    /* Ô */
                        CHR(213) ||    /* Õ */
                        CHR(214) ||    /* Ö */
                        CHR(217) ||    /* Ù */
                        CHR(218) ||    /* Ú */
                        CHR(219) ||    /* Û */
                        CHR(220) ||    /* Ü */
                        CHR(221) ||    /* Ý */
                        CHR(224) ||    /* à */
                        CHR(225) ||    /* á */
                        CHR(226) ||    /* â */
                        CHR(227) ||    /* ã */
                        CHR(228) ||    /* ä */
                        CHR(232) ||    /* è */
                        CHR(233) ||    /* é */
                        CHR(234) ||    /* ê */
                        CHR(235) ||    /* ë */
                        CHR(236) ||    /* ì */
                        CHR(237) ||    /* í */
                        CHR(238) ||    /* î */
                        CHR(239) ||    /* ï */
                        CHR(241) ||    /* ñ */
                        CHR(242) ||    /* ò */
                        CHR(243) ||    /* ó */
                        CHR(244) ||    /* ô */
                        CHR(245) ||    /* õ */
                        CHR(246) ||    /* ö */
                        CHR(249) ||    /* ù */
                        CHR(250) ||    /* ú */
                        CHR(251) ||    /* û */
                        CHR(252) ||    /* ü */
                        CHR(253) ||    /* ý */
                        CHR(255) ,     /* ÿ */

                    '     Ya..CcAAAAAEEEEIIIINOOOOOUUUUYaaaaaeeeeiiiinooooouuuuyy' );
END;
/

--<DS_SCRIPT>
-- DESCRIÇÃO..: OP 43292 - Inclusao de coluna para armazenar identificação do CPF/CNPJ da nf
-- RESPONSAVEL: Diego Costa
-- DATA.......: 01/11/2016
-- APLICAÇÃO..: IMV
--</DS_SCRIPT>
--<USUARIO=MVINTEGRA>

ALTER TABLE mvintegra.imv_nota_fiscal_eletronica ADD (tp_identificacao_cpf_cnpj VARCHAR2(1))
/

COMMENT ON COLUMN mvintegra.imv_nota_fiscal_eletronica.tp_identificacao_cpf_cnpj IS 'Itenditfica o tipo de informação que está sendo passada no campo de CPF/CNPJ (1 – CPF | 2 – CNPJ | 3 – Não Informado - Abrasf 1.0)'
/

--<DS_SCRIPT>
-- DESCRIÇÃO..: OP 43292 - Inclusao de coluna para armazenar observações e outras informações da nf
-- RESPONSAVEL: Diego Costa
-- DATA.......: 11/10/2016
-- APLICAÇÃO..: FFCV
--</DS_SCRIPT>
--<USUARIO=MVINTEGRA>

ALTER TABLE mvintegra.imv_nota_fiscal_eletronica ADD (ds_informacao_adicionais VARCHAR2(2000))
/

--<DS_SCRIPT>
-- DESCRIÇÃO..: OP 42980 - Correção da função, pois quando informava o valor "1,1" ela convertia o valor para "11", quando deveria ter gerado "1.1"
-- RESPONSAVEL: Diego Costa
-- DATA.......: 22/09/2016
-- APLICAÇÃO..: ffcv
--</DS_SCRIPT>
--<USUARIO=DBAMV>
CREATE OR REPLACE FUNCTION dbamv.fnc_ffcv_trata_valor(vValor varchar2) RETURN NUMBER is
  CURSOR cSeparadorDecimal IS
    SELECT 3/2 FROM dual;

  nResultado NUMBER;
  vResultado VARCHAR2(1000);
  vSeparadorDecimal VARCHAR2(1) := ',';
  vSeparadorMilhar  VARCHAR2(1) := '.';
  nRetorno NUMBER := -1;
  vValorTemp VARCHAR2(2000);
  nPosSepMilharBancoNoTexto NUMBER;
  nPosSepDecimalBancoNoTexto NUMBER;
  vSeparadorDecimalValor VARCHAR2(1) := ',';
  vSeparadorMilharValor  VARCHAR2(1) := '.';
  nPosSeparadorMilharInicio NUMBER;
  nPosSeparadorDecimalInicio NUMBER;

BEGIN
  nRetorno := -1;
  BEGIN
    nRetorno := To_Number(vValor);
  EXCEPTION
    WHEN OTHERS THEN
      begin
        vValorTemp := vValor;

        -- Identifica o separador de decimal do banco
        OPEN cSeparadorDecimal;
        fetch cSeparadorDecimal INTO nResultado;
        CLOSE cSeparadorDecimal;

        vResultado := To_Char(nResultado);
        IF InStr(vResultado, '.') > 0 THEN
          vSeparadorDecimal := '.';
          vSeparadorMilhar  := ',';
        END IF;
        --

        -- Verifica posições em que os separadores aparecem no texto a ser convertido.
        nPosSepMilharBancoNoTexto := InStr(vValorTemp, vSeparadorMilhar, -1);       -- Pesquisa do final da texto para o começo, para identificar o separador de dezena.
        nPosSepDecimalBancoNoTexto := InStr(vValorTemp, vSeparadorDecimal, -1);     -- Pesquisa do final da texto para o começo, para identificar o separador de dezena.
        nPosSeparadorMilharInicio := InStr(vValorTemp, vSeparadorMilhar);
        nPosSeparadorDecimalInicio := InStr(vValorTemp, vSeparadorDecimal);

        IF (nPosSepMilharBancoNoTexto > 0 AND nPosSepDecimalBancoNoTexto > 0 ) THEN
          -- Tem separador de milhar e dezena no valor.
          IF (nPosSepMilharBancoNoTexto > nPosSepDecimalBancoNoTexto) THEN
            -- Separador de milhar do texto está invertido em relação ao separador do banco;
            vSeparadorDecimalValor := vSeparadorMilhar;
            vSeparadorMilharValor := vSeparadorDecimal;
          ELSE
            vSeparadorDecimalValor := vSeparadorDecimal;
            vSeparadorMilharValor := vSeparadorMilhar;
          END IF;

          vValorTemp := REPLACE(vValorTemp, vSeparadorMilharValor, '');
          vValorTemp := REPLACE(vValorTemp, vSeparadorDecimalValor, vSeparadorDecimal);
          nRetorno := To_Number(vValorTemp);
        ELSE
          -- Localizou apenas um separador. Verifica se o separador aparece mais de uma vez, usadno como referência a posição em que o primeiro e o último separador aparecem no texto.
          -- Se for a mesma posição, a rotina apenas inverte o separador de milhar e decimal, para pode converter o número de entrada.
          IF (nPosSepMilharBancoNoTexto) > 0 THEN
            IF (nPosSeparadorMilharInicio <> nPosSepMilharBancoNoTexto) THEN
              vValorTemp := REPLACE(vValorTemp, vSeparadorMilhar, '');
            else
              vValorTemp := REPLACE(vValorTemp, vSeparadorMilhar, vSeparadorDecimal);
            END IF;
          ELSE
            IF (nPosSeparadorDecimalInicio <> nPosSepDecimalBancoNoTexto) THEN
              vValorTemp := REPLACE(vValorTemp, vSeparadorDecimal, '');
            else
              vValorTemp := REPLACE(vValorTemp, vSeparadorDecimal, vSeparadorMilhar);
            END IF;
          END IF;
          nRetorno := To_Number(vValorTemp);
        END IF;
      EXCEPTION
        WHEN OTHERS THEN
          Raise_Application_Error(-20999,'Atenção: Valor(' || vValor || ' informado não pode ser convertido em número!');
      END;
  END;
  RETURN nRetorno;
END;
/
GRANT EXECUTE ON dbamv.fnc_ffcv_trata_valor TO mv2000
/
CREATE PUBLIC SYNONYM fnc_ffcv_trata_valor FOR dbamv.fnc_ffcv_trata_valor
/



--<DS_SCRIPT>
-- DESCRIÇÃO..: OP 43292 - Alteração para utilizar parâmetros do cadastro de configuração
-- RESPONSAVEL: Diego Costa
-- DATA.......: 01/11/2016
-- APLICAÇÃO..: FFCV
--</DS_SCRIPT>
--<USUARIO=DBAMV>

CREATE OR REPLACE FUNCTION dbamv.fnc_ffcv_nf_tributo_imv( pCd_Nota_Fiscal IN  NUMBER, pvl_total_nota IN number,
pvl_desconto_nota IN number, pvl_acrescimo_nota IN number, pCd_convenio IN number, pCd_formuario IN number, SnIss IN varchar2 DEFAULT 'S') RETURN varchar2 IS
  Cursor c_tributoRetidos Is
    Select n.cd_detalhamento,
               t.ds_detalhamento,
               T.tp_detalhamento,
               decode(t.Tp_Detalhamento,'I','ISS','P','PIS','L','CSLL','J','IRPJ','C','COFINS','OUTROS') imposto,
               n.vl_tributo,
               n.vl_percentual,
               n.sn_retido
          From Dbamv.Nota_Fiscal_tributo n,
               Dbamv.Tip_Detalhe t
         Where  n.Cd_Nota_Fiscal = pCd_Nota_Fiscal
           And  n.Cd_Detalhamento = t.Cd_Detalhamento
           AND n.sn_retido = 'S';
  Cursor c_tributo Is
    Select n.cd_detalhamento,
               t.ds_detalhamento,
               T.tp_detalhamento,
               decode(t.Tp_Detalhamento,'I','ISS','P','PIS','L','CSLL','J','IRPJ','C','COFINS','OUTROS') imposto,
               n.vl_tributo,
               n.vl_percentual,
               n.sn_retido
          From Dbamv.Nota_Fiscal_tributo n,
               Dbamv.Tip_Detalhe t
         Where  n.Cd_Nota_Fiscal = pCd_Nota_Fiscal
           And  n.Cd_Detalhamento = t.Cd_Detalhamento
           And ((t.Tp_Detalhamento in('I','P','C')   AND dbamv.pkg_mv2000.le_configuracao('FFCV','SN_LEI_IMPOSTOS') = 'S')
           OR Nvl(dbamv.pkg_mv2000.le_configuracao('FFCV','SN_LEI_IMPOSTOS'),'N') = 'N')
           AND  (t.Tp_Detalhamento = 'I' AND 'S' = SnIss
           OR   t.Tp_Detalhamento <> 'I')
   UNION ALL
      Select n.cd_detalhamento,
               t.ds_detalhamento,
               T.tp_detalhamento,
               decode(t.Tp_Detalhamento,'I','ISS','P','PIS','L','CSLL','J','IRPJ','C','COFINS','OUTROS') imposto,
               n.vl_tributo,
               n.vl_percentual,
               n.sn_retido
          From Dbamv.mvs_nota_fiscal_tributo n,
               Dbamv.Tip_Detalhe t
         Where  n.Cd_Nota_Fiscal = pCd_Nota_Fiscal
           And  n.Cd_Detalhamento = t.Cd_Detalhamento
           And ((t.Tp_Detalhamento in('I','P','C')   AND dbamv.pkg_mv2000.le_configuracao('FFCV','SN_LEI_IMPOSTOS') = 'S')
           OR Nvl(dbamv.pkg_mv2000.le_configuracao('FFCV','SN_LEI_IMPOSTOS'),'N') = 'N')
		   AND  (t.Tp_Detalhamento = 'I' AND 'S' = SnIss
           OR   t.Tp_Detalhamento <> 'I');
       Cursor c_tributo_soma IS
             Select n.Cd_Nota_Fiscal,
               'Valor total' descricao,
               Sum(Nvl(n.vl_tributo,0)) valor
          From Dbamv.Nota_Fiscal_tributo n,
               Dbamv.Tip_Detalhe t
         Where  n.Cd_Nota_Fiscal = pCd_Nota_Fiscal
           And  n.Cd_Detalhamento = t.Cd_Detalhamento
           And ((t.Tp_Detalhamento in('I','P','C')   AND dbamv.pkg_mv2000.le_configuracao('FFCV','SN_LEI_IMPOSTOS') = 'S')
           OR Nvl(dbamv.pkg_mv2000.le_configuracao('FFCV','SN_LEI_IMPOSTOS'),'N') = 'N')
		       AND  (t.Tp_Detalhamento = 'I' AND 'S' = SnIss
           OR   t.Tp_Detalhamento <> 'I')
           GROUP BY  n.Cd_Nota_Fiscal
   UNION ALL
      Select n.Cd_Nota_Fiscal,
               'Valor total' descricao,
               Sum(Nvl(n.vl_tributo,0)) valor
          From Dbamv.mvs_nota_fiscal_tributo n,
               Dbamv.Tip_Detalhe t
         Where  n.Cd_Nota_Fiscal = pCd_Nota_Fiscal
           And  n.Cd_Detalhamento = t.Cd_Detalhamento
           And ((t.Tp_Detalhamento in('I','P','C')   AND dbamv.pkg_mv2000.le_configuracao('FFCV','SN_LEI_IMPOSTOS') = 'S')
           OR Nvl(dbamv.pkg_mv2000.le_configuracao('FFCV','SN_LEI_IMPOSTOS'),'N') = 'N')
       	   AND (t.Tp_Detalhamento = 'I' AND 'S' = SnIss
           OR   t.Tp_Detalhamento <> 'I')
	     GROUP BY n.Cd_Nota_Fiscal
           ;
  Cursor c_trib_tot Is
       Select Count(*) total
          From Dbamv.Nota_Fiscal_tributo n,
               Dbamv.Tip_Detalhe t
         Where  n.Cd_Nota_Fiscal = pCd_Nota_Fiscal
           And  n.Cd_Detalhamento = t.Cd_Detalhamento
           And ((t.Tp_Detalhamento in('I','P','C')   AND dbamv.pkg_mv2000.le_configuracao('FFCV','SN_LEI_IMPOSTOS') = 'S')
           OR Nvl(dbamv.pkg_mv2000.le_configuracao('FFCV','SN_LEI_IMPOSTOS'),'N') = 'N')
		   AND  (t.Tp_Detalhamento = 'I' AND 'S' = SnIss
           OR   t.Tp_Detalhamento <> 'I')
         UNION ALL
       Select Count(*) total
          From Dbamv.mvs_Nota_Fiscal_tributo n,
               Dbamv.Tip_Detalhe t
         Where  n.Cd_Nota_Fiscal = pCd_Nota_Fiscal
           And  n.Cd_Detalhamento = t.Cd_Detalhamento
           And ((t.Tp_Detalhamento in('I','P','C')   AND dbamv.pkg_mv2000.le_configuracao('FFCV','SN_LEI_IMPOSTOS') = 'S')
           OR Nvl(dbamv.pkg_mv2000.le_configuracao('FFCV','SN_LEI_IMPOSTOS'),'N') = 'N')
		   AND  (t.Tp_Detalhamento = 'I' AND 'S' = SnIss
           OR   t.Tp_Detalhamento <> 'I') ;
  CURSOR C_MSG_NF IS
    SELECT DS_MENSAGEM_NOTA_FISCAL
      FROM DBAMV.MULTI_EMPRESAS M
     WHERE M.CD_MULTI_EMPRESA = dbamv.pkg_mv2000.le_empresa;
  cursor cSnBaseCalculoVlLiquido is
    select SN_BASE_CALCULO_VL_LIQUIDO
      from dbamv.config_financ
     where cd_multi_empresa = dbamv.pkg_mv2000.le_empresa;
  CURSOR cCalculoImposto(pTpDetalhamento IN VARCHAR2) is
    SELECT Tip_Detalhe.CD_DETALHAMENTO, Tip_Detalhe.DS_DETALHAMENTO , Min(faixa_detalhe.vl_percentual) vl_percentual
        , Nvl(pvl_total_nota,0) + Nvl(pvl_desconto_nota,0) - Nvl(pvl_acrescimo_nota,0) vl_base_calculo
      FROM dbamv.convenio
        , DBAMV.forn_detalhamento
        , Dbamv.Tip_Detalhe
        , dbamv.faixa_detalhe
    WHERE convenio.cd_convenio = pCd_convenio
      AND forn_detalhamento.cd_fornecedor = convenio.cd_fornecedor
      AND forn_detalhamento.cd_multi_empresa = pkg_mv2000.le_empresa
      AND forn_detalhamento.Cd_Detalhamento = Tip_Detalhe.Cd_Detalhamento
      AND Tip_Detalhe.tp_detalhamento = pTpDetalhamento
      AND faixa_detalhe.Cd_Detalhamento = Tip_Detalhe.Cd_Detalhamento
    GROUP BY Tip_Detalhe.CD_DETALHAMENTO, Tip_Detalhe.DS_DETALHAMENTO
     UNION ALL
        SELECT Tip_Detalhe.CD_DETALHAMENTO, Tip_Detalhe.DS_DETALHAMENTO , Min(faixa_detalhe.vl_percentual) vl_percentual
        , Nvl(pvl_total_nota,0) + Nvl(pvl_desconto_nota,0) - nvl(pvl_acrescimo_nota,0) vl_base_calculo
      FROM dbamv.convenio
        , DBAMV.forn_detalhamento
        , Dbamv.Tip_Detalhe
        , dbamv.faixa_detalhe
    WHERE convenio.cd_convenio = pCd_convenio
      AND forn_detalhamento.cd_fornecedor = convenio.cd_fornecedor
      AND forn_detalhamento.cd_multi_empresa = pkg_mv2000.le_empresa
      AND forn_detalhamento.Cd_Detalhamento = Tip_Detalhe.Cd_Detalhamento
      AND Tip_Detalhe.tp_detalhamento = pTpDetalhamento
      AND faixa_detalhe.Cd_Detalhamento = Tip_Detalhe.Cd_Detalhamento
    GROUP BY Tip_Detalhe.CD_DETALHAMENTO, Tip_Detalhe.DS_DETALHAMENTO;
  cursor cMensagemFormularioNf is
    select formulario_nf.ds_observacao
      from dbamv.formulario_nf
     where formulario_nf.cd_formulario_nf = pCd_formuario
       UNION ALL
    select formulario_nf.ds_observacao
      from dbamv.formulario_nf
     where formulario_nf.cd_formulario_nf = pCd_formuario;
  CURSOR cConfiguracao IS
    SELECT valor
      FROM dbamv.configuracao
     WHERE cd_sistema = 'FFCV'
       AND chave = 'SN_EXIBE_MENSAGEM_NF_E_TIBUTOS'
       AND cd_multi_empresa = dbamv.pkg_mv2000.le_empresa;
  Cursor c_soma_valor_tributo IS
             Select n.Cd_Nota_Fiscal,
               'VALOR APROXIMADO DOS TRIBUTOS' descricao,
               Sum(Nvl(n.vl_tributo,0)) valor
          From Dbamv.Nota_Fiscal_tributo n,
               Dbamv.Tip_Detalhe t
         Where  n.Cd_Nota_Fiscal = pCd_Nota_Fiscal
           And  n.Cd_Detalhamento = t.Cd_Detalhamento
           And ((t.Tp_Detalhamento in('I','P','C')   AND dbamv.pkg_mv2000.le_configuracao('FFCV','SN_LEI_IMPOSTOS') = 'S')
           OR Nvl(dbamv.pkg_mv2000.le_configuracao('FFCV','SN_LEI_IMPOSTOS'),'N') = 'N')
		   AND  (t.Tp_Detalhamento = 'I' AND 'S' = SnIss
           OR   t.Tp_Detalhamento <> 'I')
           GROUP BY  n.Cd_Nota_Fiscal
   UNION ALL
      Select n.Cd_Nota_Fiscal,
               'VALOR APROXIMADO DOS TRIBUTOS' descricao,
               Sum(Nvl(n.vl_tributo,0)) valor
          From Dbamv.mvs_nota_fiscal_tributo n,
               Dbamv.Tip_Detalhe t
         Where  n.Cd_Nota_Fiscal = pCd_Nota_Fiscal
           And  n.Cd_Detalhamento = t.Cd_Detalhamento
           And ((t.Tp_Detalhamento in('I','P','C')   AND dbamv.pkg_mv2000.le_configuracao('FFCV','SN_LEI_IMPOSTOS') = 'S')
           OR Nvl(dbamv.pkg_mv2000.le_configuracao('FFCV','SN_LEI_IMPOSTOS'),'N') = 'N')
       	   AND (t.Tp_Detalhamento = 'I' AND 'S' = SnIss
           OR   t.Tp_Detalhamento <> 'I')
	     GROUP BY n.Cd_Nota_Fiscal;
  Cursor c_soma_valor_tributo_total_imp IS
             Select n.Cd_Nota_Fiscal,
               'VALOR APROXIMADO DOS TRIBUTOS' descricao,
               Sum(Nvl(n.vl_tributo,0)) valor
          From Dbamv.Nota_Fiscal_tributo n,
               Dbamv.Tip_Detalhe t
         Where  n.Cd_Nota_Fiscal = pCd_Nota_Fiscal
           And  n.Cd_Detalhamento = t.Cd_Detalhamento
           GROUP BY  n.Cd_Nota_Fiscal
   UNION ALL
      Select n.Cd_Nota_Fiscal,
               'VALOR APROXIMADO DOS TRIBUTOS' descricao,
               Sum(Nvl(n.vl_tributo,0)) valor
          From Dbamv.mvs_nota_fiscal_tributo n,
               Dbamv.Tip_Detalhe t
         Where  n.Cd_Nota_Fiscal = pCd_Nota_Fiscal
           And  n.Cd_Detalhamento = t.Cd_Detalhamento
	     GROUP BY n.Cd_Nota_Fiscal;
  CURSOR cEmpresaNf(nCdNotaFiscal NUMBER) is
    SELECT cd_multi_empresa
      FROM dbamv.nota_fiscal
     WHERE cd_nota_fiscal = nCdNotaFiscal;

  CURSOR cConfigNotaFiscal(nCdMultiEmpresa NUMBER, vTpNotaFiscal VARCHAR2) IS
    SELECT t.vl_aliquota_aproximado_trib
         , t.ds_texto_vl_aproximado_trib
      FROM dbamv.config_nota_fiscal c
         , dbamv.config_nota_fiscal_por_tipo t
     WHERE c.cd_config_nota_fiscal = t.cd_config_nota_fiscal
       AND c.cd_multi_empresa = nCdMultiEmpresa
       AND t.tp_nota_fiscal = vTpNotaFiscal;

  vRetorno      VARCHAR2(4000) := NULL;
  vObservacoesNf VARCHAR2(4000) := NULL;
  nTotal        NUMBER  :=0;
  nCtrl         NUMBER  :=0;
  vSnExibeMensagemNfETibutos varchar2(1);
  vMensagemFormulario formulario_nf.ds_observacao%type;
  nValorImposto NUMBER  :=0;
  bExistePis    boolean := FALSE;
  bExisteCofins boolean := FALSE;
  vSnExibeApenasTributosRetidos VARCHAR2(1) := Nvl(SubStr(dbamv.pkg_mv2000.le_configuracao('FFCV', 'SN_MOSTRA_APENAS_TRIBUTOS_RETIDOS'), 1, 1), 'N');
  vVlPercentualLei_12_741 VARCHAR2(15) := Nvl(dbamv.pkg_mv2000.le_configuracao('FFCV', 'VL_PERCENTAL_LEI_12_741'), '0');
  vQuebrarPorLinha VARCHAR2(1) := Nvl(SubStr(dbamv.pkg_mv2000.le_configuracao('FFCV', 'SN_QUEBRA_LINHA_NF_IMPOSTO'), 1, 1), 'N');
  nVlPercentualLei_12_741 NUMBER;
  nVlBaseCalculo NUMBER;
  nValorAproximadoTributo NUMBER;
  rCalculoImposto cCalculoImposto%ROWTYPE;
  vSeparador VARCHAR2(10);
  nVlLiquidoNf NUMBER;
  nTotalRetido NUMBER;
  vSnBaseCalculoVlLiquido varchar2(1);
  snMostraValorTotalLiquidoFinal VARCHAR2(1) := Nvl(SubStr(dbamv.pkg_mv2000.le_configuracao('FFCV', 'SN_MOSTRA_VALOR_LIQUIDO_FINAL'), 1, 1), 'N');
  vQuebraDeTexto VARCHAR2(100);
  pCd_Moeda VARCHAR2(20) := 'R$';
  pCd_Indice_Moeda NUMBER := 1;
  vTextoVlAproximadoTributo VARCHAR2(2000) := Nvl(dbamv.pkg_mv2000.le_configuracao('FFCV', 'DS_TEXTO_VL_APROXIMADO_TRIBUTOS'), 'VALOR APROXIMADO DOS TRIBUTOS (LEI 12.741/12):');
  nEmpresa NUMBER;

  vTpNotaFiscal VARCHAR2(1);
  rConfigNotaFiscal cConfigNotaFiscal%ROWTYPE;
BEGIN
  IF dbamv.pkg_mv2000.le_empresa() IS NULL THEN
    OPEN cEmpresaNf(pCd_Nota_Fiscal);
    FETCH cEmpresaNf INTO nEmpresa;
    CLOSE cEmpresaNf;
    dbamv.pkg_mv2000.atribui_empresa(nEmpresa);
    vSnExibeApenasTributosRetidos := Nvl(SubStr(dbamv.pkg_mv2000.le_configuracao('FFCV', 'SN_MOSTRA_APENAS_TRIBUTOS_RETIDOS'), 1, 1), 'N');
    vVlPercentualLei_12_741 := Nvl(dbamv.pkg_mv2000.le_configuracao('FFCV', 'VL_PERCENTAL_LEI_12_741'), '0');
    vQuebrarPorLinha := Nvl(SubStr(dbamv.pkg_mv2000.le_configuracao('FFCV', 'SN_QUEBRA_LINHA_NF_IMPOSTO'), 1, 1), 'N');
    snMostraValorTotalLiquidoFinal  := Nvl(SubStr(dbamv.pkg_mv2000.le_configuracao('FFCV', 'SN_MOSTRA_VALOR_LIQUIDO_FINAL'), 1, 1), 'N');
    vTextoVlAproximadoTributo := Nvl(dbamv.pkg_mv2000.le_configuracao('FFCV', 'DS_TEXTO_VL_APROXIMADO_TRIBUTOS'), 'VALOR APROXIMADO DOS TRIBUTOS (LEI 12.741/12):');
  END IF;
  nVlPercentualLei_12_741 := dbamv.fnc_ffcv_trata_valor(vVlPercentualLei_12_741);

  vTpNotaFiscal := dbamv.fnc_ffcv_tipo_nota_fiscal(pCd_Nota_Fiscal);

  OPEN cConfigNotaFiscal(dbamv.pkg_mv2000.le_empresa(), vTpNotaFiscal);
  FETCH cConfigNotaFiscal INTO rConfigNotaFiscal;
  CLOSE cConfigNotaFiscal;

  IF (rConfigNotaFiscal.ds_texto_vl_aproximado_trib IS NOT NULL) THEN
    vTextoVlAproximadoTributo := rConfigNotaFiscal.ds_texto_vl_aproximado_trib;
  END IF;

  IF (rConfigNotaFiscal.vl_aliquota_aproximado_trib IS NOT NULL) THEN
    nVlPercentualLei_12_741 := rConfigNotaFiscal.vl_aliquota_aproximado_trib;
  END IF;

  Dbms_Output.Put_Line('Aliquota texto: ' || vVlPercentualLei_12_741);

  IF Nvl(vQuebrarPorLinha, 'N') = 'S' THEN
    vQuebraDeTexto := Chr(10);
  ELSE
    vQuebraDeTexto := Chr(9);
  END IF;
  vRetorno := null;

  /* Consulta se deve ser exibido apenas os textos pre-configurados para os relatórios de nota fiscal ou se deve imprimir o texto e os impostos */
  open  cConfiguracao;
  fetch cConfiguracao into vSnExibeMensagemNfETibutos;
  close cConfiguracao;
  vSnExibeMensagemNfETibutos := nvl(vSnExibeMensagemNfETibutos, 'N');
  /* Consulta mensagem personalizada de nota fiscal, definida no cadastro de empresa */
  OPEN  C_MSG_NF;
  FETCH C_MSG_NF INTO vRetorno;
  CLOSE C_MSG_NF;
  /* Consulta mensagem personalizada no cadastro de formulário da nota fiscal */
  OPEN  cMensagemFormularioNf;
  FETCH cMensagemFormularioNf INTO vMensagemFormulario;
  CLOSE cMensagemFormularioNf;
  IF vRetorno IS NULL THEN
    vRetorno := vMensagemFormulario;
  ELSE
    vRetorno := vRetorno || vQuebraDeTexto || vMensagemFormulario;
  END IF;
  vObservacoesNf := vRetorno;
  IF (vRetorno IS NULL OR vSnExibeMensagemNfETibutos = 'S') AND vSnExibeApenasTributosRetidos = 'N' THEN
    OPEN c_trib_tot;
    FETCH c_trib_tot INTO nTotal;
    CLOSE c_trib_tot;
    IF Nvl(dbamv.pkg_mv2000.le_configuracao('FFCV','SN_LEI_IMPOSTOS'), 'N') = 'N' THEN
      FOR Reg IN c_Tributo LOOP
        nCtrl:=nCtrl+1;
        IF Reg.tp_detalhamento = 'P' THEN
          bExistePis := TRUE;
        END IF;
        IF Reg.tp_detalhamento = 'C' THEN
          bExisteCofins := TRUE;
        END IF;
	      IF dbamv.pkg_mv2000.le_cliente = 420 THEN
          IF vRetorno IS NOT NULL THEN
            vRetorno := vRetorno || vQuebraDeTexto;
          END IF;
          vRetorno := vRetorno||'|'||REG.imposto||' (%)'||to_char(Nvl(Reg.Vl_percentual,0),'990.00')||' '||pCd_Moeda||to_char(Nvl(Reg.Vl_Tributo*pCd_Indice_Moeda,0),'99999990.00');
        elsIF dbamv.pkg_mv2000.le_cliente <> 474 THEN
          IF vRetorno IS NOT NULL THEN
            vRetorno := vRetorno || vQuebraDeTexto;
          END IF;
          vRetorno := vRetorno||' | '||REG.imposto||' (%)'||to_char(Nvl(Reg.Vl_percentual,0),'990.00')||' '||pCd_Moeda||to_char(Nvl(Reg.Vl_Tributo*pCd_Indice_Moeda,0),'99999990.00');
          IF nCtrl <> nTotal THEN
            vRetorno:=vRetorno||vQuebraDeTexto;
          END IF;
        ELSE
          IF Nvl(Reg.Vl_Tributo,0) > 0 THEN
            IF vRetorno IS NOT NULL THEN
              vRetorno := vRetorno || vQuebraDeTexto;
            END IF;
            vRetorno := vRetorno ||' | '||REG.imposto||' (%)'||to_char(Nvl(Reg.Vl_percentual,0),'990.00')||' '||pCd_Moeda||to_char(Nvl(Reg.Vl_Tributo*pCd_Indice_Moeda,0),'99999990.00');
          END IF ;
        END IF ;
      END LOOP;
    END IF;
    IF NOT bExistePis THEN
      OPEN  cCalculoImposto('P');
      FETCH cCalculoImposto INTO rCalculoImposto;
      CLOSE cCalculoImposto;
      nValorImposto := Round((rCalculoImposto.vl_percentual/100)*rCalculoImposto.vl_base_calculo, 2);
      rCalculoImposto.DS_DETALHAMENTO:='PIS';
      -- OP 14259 - DIEGO ALMEIDA - 25/11/2013 - CRIAÇÃO DE CONFIGURAÇÃO NO GLOBAL PARA EXIBIR OU NÃO PIS E COFINS ZERADOS (INICIO)
      IF (Nvl(dbamv.pkg_mv2000.le_configuracao('FFCV','SN_LEI_IMPOSTO_ZERADO'),'S') = 'S') THEN
        IF vRetorno IS NOT NULL THEN
          vRetorno := vRetorno || vQuebraDeTexto;
        END IF;
        vRetorno := vRetorno||' | '||rCalculoImposto.DS_DETALHAMENTO||' (%)'||to_char(Nvl(rCalculoImposto.Vl_percentual,0),'990.00')||' '||pCd_Moeda||to_char(Nvl(nValorImposto*pCd_Indice_Moeda,0),'99999990.00');
      ELSIF (Nvl(dbamv.pkg_mv2000.le_configuracao('FFCV','SN_LEI_IMPOSTO_ZERADO'),'S') = 'N')  AND Nvl(nValorImposto,0) > 0 THEN
        IF vRetorno IS NOT NULL THEN
          vRetorno := vRetorno || vQuebraDeTexto;
        END IF;
        vRetorno := vRetorno||' | '||rCalculoImposto.DS_DETALHAMENTO||' (%)'||to_char(Nvl(rCalculoImposto.Vl_percentual,0),'990.00')||' '||pCd_Moeda||to_char(Nvl(nValorImposto*pCd_Indice_Moeda,0),'99999990.00');
      END IF;
      -- OP 14259 - DIEGO ALMEIDA - 25/11/2013 - CRIAÇÃO DE CONFIGURAÇÃO NO GLOBAL PARA EXIBIR OU NÃO PIS E COFINS ZERADOS (FIM)
    END IF;
    IF NOT bExisteCofins THEN
      OPEN  cCalculoImposto('C');
      FETCH cCalculoImposto INTO rCalculoImposto;
      CLOSE cCalculoImposto;
      nValorImposto := Round((rCalculoImposto.vl_percentual/100)*rCalculoImposto.vl_base_calculo, 2);
      rCalculoImposto.DS_DETALHAMENTO:='COFINS';
      -- OP 14259 - DIEGO ALMEIDA - 25/11/2013 - CRIAÇÃO DE CONFIGURAÇÃO NO GLOBAL PARA EXIBIR OU NÃO PIS E COFINS ZERADOS (INICIO)
      IF (Nvl(dbamv.pkg_mv2000.le_configuracao('FFCV','SN_LEI_IMPOSTO_ZERADO'),'S') = 'S') THEN
        IF vRetorno IS NOT NULL THEN
          vRetorno := vRetorno || vQuebraDeTexto;
        END IF;
        vRetorno := vRetorno||' | '||rCalculoImposto.DS_DETALHAMENTO||' (%)'||to_char(Nvl(rCalculoImposto.Vl_percentual,0),'990.00')||' '||pCd_Moeda||to_char(Nvl(nValorImposto*pCd_Indice_Moeda,0),'99999990.00');
      ELSIF (Nvl(dbamv.pkg_mv2000.le_configuracao('FFCV','SN_LEI_IMPOSTO_ZERADO'),'S') = 'N')  AND Nvl(nValorImposto,0) > 0 THEN
        IF vRetorno IS NOT NULL THEN
          vRetorno := vRetorno || vQuebraDeTexto;
        END IF;
        vRetorno := vRetorno||' | '||rCalculoImposto.DS_DETALHAMENTO||' (%)'||to_char(Nvl(rCalculoImposto.Vl_percentual,0),'990.00')||' '||pCd_Moeda||to_char(Nvl(nValorImposto*pCd_Indice_Moeda,0),'99999990.00');
      END IF;
      -- OP 14259 - DIEGO ALMEIDA - 25/11/2013 - CRIAÇÃO DE CONFIGURAÇÃO NO GLOBAL PARA EXIBIR OU NÃO PIS E COFINS ZERADOS (FIM)
    END IF;
  ELSE
    -- vSnExibeApenasTributosRetidos = 'S'
    vSeparador := ' | ';
    nTotalRetido := 0;
    FOR Reg IN c_tributoRetidos LOOP
      IF Reg.sn_retido = 'S' THEN
        IF nTotalRetido = 0  THEN
          IF Length(vRetorno) > 0 THEN
            vRetorno := vRetorno || vQuebraDeTexto || 'RETENÇÕES:'  ;
          ELSE
            vRetorno := 'RETENÇÕES:';
          END IF;
        END IF;
        nTotalRetido := nTotalRetido + Reg.Vl_Tributo;
        IF Nvl(Reg.Vl_Tributo,0) > 0 THEN
          IF vRetorno IS NOT NULL THEN
            vRetorno := vRetorno || vQuebraDeTexto;
          END IF;
          vRetorno := vRetorno || vSeparador ||REG.imposto||' (%)'||to_char(Nvl(Reg.Vl_percentual,0),'990.00')||' '||pCd_Moeda||to_char(Nvl(Reg.Vl_Tributo*pCd_Indice_Moeda,0),'99999990.00');
        END IF ;
      END IF;
    END LOOP;
	  IF ((nTotalRetido > 0) AND (snMostraValorTotalLiquidoFinal='N')) THEN
      nVlLiquidoNf := pvl_total_nota - nTotalRetido;
      IF vRetorno IS NOT NULL THEN
        vRetorno := vRetorno || vQuebraDeTexto;
      END IF;
      vRetorno := vRetorno || 'VALOR LÍQUIDO: ' || pCd_Moeda||to_char(Nvl(nVlLiquidoNf * pCd_Indice_Moeda,0),'99999990.00');
    END IF;
  END IF;
  IF nVlPercentualLei_12_741 = 0 THEN
    -- OP 24919 - PDA 693266 e 684759
    IF  (dbamv.pkg_mv2000.le_configuracao('FFCV','SN_LEI_TRIBUTOS') = 'S'
        AND Nvl(dbamv.pkg_mv2000.le_configuracao('FFCV','SN_LEI_TODOS_TRIBUTOS'), 'N') = 'N') THEN
            FOR Reg IN c_soma_valor_tributo LOOP
              IF vRetorno IS NOT NULL THEN
                vRetorno := vRetorno || vQuebraDeTexto;
              END IF;
              vRetorno := vRetorno||REG.descricao||': '||pCd_Moeda||ltrim(to_char(Nvl(Reg.valor,0),'99999990.00'));
            END LOOP;
    ELSIF (dbamv.pkg_mv2000.le_configuracao('FFCV','SN_LEI_TRIBUTOS') = 'S'
                  AND dbamv.pkg_mv2000.le_configuracao('FFCV','SN_LEI_TODOS_TRIBUTOS') = 'S') THEN
        FOR Reg IN c_soma_valor_tributo_total_imp LOOP
              IF vRetorno IS NOT NULL THEN
                vRetorno := vRetorno || vQuebraDeTexto;
              END IF;
              vRetorno := vRetorno||REG.descricao||': '||pCd_Moeda||ltrim(to_char(Nvl(Reg.valor,0),'99999990.00'));
        END LOOP;
      END IF;
  ELSE
    open  cSnBaseCalculoVlLiquido;
    fetch cSnBaseCalculoVlLiquido into vSnBaseCalculoVlLiquido;
    close cSnBaseCalculoVlLiquido;
    IF nvl(vSnBaseCalculoVlLiquido,'N')  = 'S'THEN
      nVlBaseCalculo := Nvl(pvl_total_nota, 0);
    ELSE
      nVlBaseCalculo := (nvl(pvl_total_nota,0) + Nvl(pvl_desconto_nota,0) - Nvl(pvl_acrescimo_nota,0));
    end IF;
    IF nVlBaseCalculo > 0 THEN
      IF Length(vObservacoesNf) > 0 THEN
        vRetorno := vObservacoesNf || vQuebraDeTexto || vTextoVlAproximadoTributo || ' ' || pCd_Moeda;
      ELSE
        vRetorno := vTextoVlAproximadoTributo || ' ' || pCd_Moeda;
      END IF;
      Dbms_Output.Put_Line('Base calculo: ' || nVlBaseCalculo);
      nValorAproximadoTributo := nVlBaseCalculo * (nVlPercentualLei_12_741/100);
      vRetorno := vRetorno || ltrim(to_char(Nvl(nValorAproximadoTributo,0),'99999990.00'));
    END IF;
  END IF;
	IF ((nTotalRetido > 0) AND (snMostraValorTotalLiquidoFinal = 'S')) THEN
		nVlLiquidoNf := pvl_total_nota - nTotalRetido;
		-- OP33127
    IF vRetorno IS NOT NULL THEN
      vRetorno := vRetorno || vQuebraDeTexto;
    END IF;
		vRetorno := vRetorno || 'VALOR LÍQUIDO (TOTAL RPS - TOTAL IMPOSTOS RETIDOS) : ' || pCd_Moeda||to_char(Nvl(nVlLiquidoNf * pCd_Indice_Moeda,0),'99999990.00') || vQuebraDeTexto;
	END IF;
  RETURN dbamv.fnc_ffcv_retira_acento(vRetorno);
END;
/

GRANT EXECUTE ON dbamv.fnc_ffcv_nf_tributo_imv TO dbaps
/
GRANT EXECUTE ON dbamv.fnc_ffcv_nf_tributo_imv TO dbasgu
/
GRANT EXECUTE ON dbamv.fnc_ffcv_nf_tributo_imv TO mv2000
/
GRANT EXECUTE ON dbamv.fnc_ffcv_nf_tributo_imv TO mvintegra
/

--<DS_SCRIPT>
-- DESCRIÇÃO..: Procedure para remover o excesso de espaços em branco dos campos
-- RESPONSAVEL: Raony Barbosa
-- DATA.......: 26/02/2018
-- APLICAÇÃO..: MVINTEGRA/FFCV
--</DS_SCRIPT>
--<USUARIO=MVINTEGRA>

CREATE OR REPLACE FUNCTION MVINTEGRA.FNC_IMV_REMOVE_ESPACO_DUPLO(TEXTO IN VARCHAR2) RETURN VARCHAR2 IS
  RESP        VARCHAR2(32000) := TEXTO;
  espduplo    VARCHAR2(2) := Chr(32)||Chr(32);
BEGIN
  IF NOT TEXTO IS NULL THEN
    RESP := REPLACE(TEXTO,CHR(9),Chr(32));
    RESP := REPLACE(RESP,CHR(10),chr(32));
    LOOP
      RESP := REPLACE(RESP,espduplo, chr(32));
      EXIT WHEN INSTR(RESP,espduplo) = 0;
    END LOOP;
  END IF;
  RETURN RESP;
END;
/

GRANT EXECUTE ON MVINTEGRA.FNC_IMV_REMOVE_ESPACO_DUPLO TO MV2000
/


