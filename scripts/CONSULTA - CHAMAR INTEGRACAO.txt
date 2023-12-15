declare
  PCD_NOTA_FISCAL number := 1256;
BEGIN
  dbamv.pkg_mv2000.atribui_empresa(10);

    update dbamv.nota_fiscal
     set CD_STATUS_NFE = 'T'
     where cd_nota_fiscal = PCD_NOTA_FISCAL;

--    commit;
END;