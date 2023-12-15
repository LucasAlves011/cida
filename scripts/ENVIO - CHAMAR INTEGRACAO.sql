declare
  PCD_NOTA_FISCAL number := 1256;
BEGIN
  dbamv.pkg_mv2000.atribui_empresa(10);
  update dbamv.nota_fiscal
       set CD_NOTA_FISCAL_INTEGRA = null
           , CD_SEQ_INTEGRA = null
             , DT_INTEGRA = null
             , NR_PROTOCOLO = null
             , DS_RETORNO_NFE = null
             , DS_URL_NFE = null
     where cd_nota_fiscal = PCD_NOTA_FISCAL;

--    commit;

    update dbamv.nota_fiscal
     set CD_STATUS_NFE = 'A'
         , cd_status = 'E'
         , cd_tipo_situacao_nota_fiscal = 4
     where cd_nota_fiscal = PCD_NOTA_FISCAL;

--    commit;
END;