DECLARE    -- Esse curso deve ter as notas que devem ser reenviadas, então você tem que por a sua própria lógica  
    Cursor c_config_mvintegra is 
      SELECT * FROM dbamv.nota_fiscal WHERE dt_emissao >= To_Date('26/01/2024','dd/MM/YYYY') AND ds_retorno_nfe like '%Certificado%' AND cd_status_nfe <> 'P' AND cd_multi_empresa = 3 AND cd_status='E';
      
BEGIN

  FOR nota_i  IN c_config_mvintegra LOOP
    dbamv.pkg_mv2000.atribui_empresa(nota_i.cd_multi_empresa);
    update dbamv.nota_fiscal
        set CD_NOTA_FISCAL_INTEGRA = null
            , CD_SEQ_INTEGRA = null
              , DT_INTEGRA = null
              , NR_PROTOCOLO = null
              , DS_RETORNO_NFE = null
              , DS_URL_NFE = null
      where cd_nota_fiscal = nota_i.cd_nota_fiscal;

  --    commit;
      update dbamv.nota_fiscal
      set CD_STATUS_NFE = 'X'
      where cd_nota_fiscal = nota_i.cd_nota_fiscal;
    
      update dbamv.nota_fiscal
      set CD_STATUS_NFE = 'A'
          , cd_status = 'E'
          , cd_tipo_situacao_nota_fiscal = 4
      where cd_nota_fiscal = nota_i.cd_nota_fiscal;
  END LOOP;         
END;