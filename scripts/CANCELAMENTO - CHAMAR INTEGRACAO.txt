DECLARE
   PCD_NOTA_FISCAL number := 1256;
BEGIN
  dbamv.pkg_mv2000.atribui_empresa(10);
  UPDATE dbamv.nota_fiscal
    SET cd_status_nfe = 'C'
    ,cd_tipo_situacao_nota_fiscal = 11
  WHERE cd_nota_fiscal = PCD_NOTA_FISCAL;
END;