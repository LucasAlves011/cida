SELECT *
FROM   mvintegra.imv_configuracao_condicao_env
WHERE  tp_documento IN('LOTE_RPS_ENVIO',
                       'LOTE_RPS_CONSULTA',
                       'CANCELAMENTO_RPS');

--delete mvintegra.imv_configuracao_condicao_env  where tp_documento in('LOTE_RPS_ENVIO','LOTE_RPS_CONSULTA', 'CANCELAMENTO_RPS');CREATE TABLE mvintegra.imv_configuracao_cond_env_tmp AS
SELECT *
FROM   mvintegra.imv_configuracao_condicao_env
WHERE  tp_documento IN('LOTE_RPS_ENVIO',
                       'LOTE_RPS_CONSULTA',
                       'CANCELAMENTO_RPS');SELECT *
FROM   mvintegra.imv_configuracao_cond_env_tmp DECLARE cursor c_saidas_nfse IS
SELECT   csaida.cd_imv_configuracao_saida,
         csaida.cd_empresa_destino,
         doc.tp_documento,
         elem.cd_imv_configuracao_elemen_xml
FROM     mvintegra.imv_configuracao_saida csaida,
         mvintegra.imv_configuracao_saida_tp_doc doc,
         mvintegra.imv_configuracao_elemento_xml elem
WHERE    csaida.cd_imv_configuracao_saida = doc.cd_imv_configuracao_saida
AND      doc.tp_documento IN('LOTE_RPS_ENVIO',
                             'LOTE_RPS_CONSULTA',
                             'CANCELAMENTO_RPS')
AND      doc.cd_imv_configuracao_entid_xml = elem.cd_imv_configuracao_entid_xml
AND      elem.nm_elemento = 'empresaOrigem'
ORDER BY tp_documento,
         cd_empresa_destino;CURSOR c_cond_env( ptpdocumento VARCHAR2)
IS
  SELECT   *
  FROM     mvintegra.imv_configuracao_condicao_env
  WHERE    tp_documento = ptpdocumento
  ORDER BY 2;v_tp_documento VARCHAR2(50) := '';v_seq_cond_env INT;BEGIN
  FOR r IN c_saidas_nfse
  LOOP
    v_tp_documento := r.tp_documento;
    dbms_output.Put_line('chegou aqui: '
    ||v_tp_documento );
    v_seq_cond_env := mvintegra.seq_imv_configuracao_cond_env.NEXTVAL;
    INSERT INTO mvintegra.imv_configuracao_condicao_env VALUES
                (
                            v_seq_cond_env,
                            r.cd_empresa_destino,
                            r.cd_imv_configuracao_saida,
                            r.cd_imv_configuracao_elemen_xml,
                            r.tp_documento,
                            '=',
                            r.cd_empresa_destino
                );

  END LOOP;
  FOR r IN c_cond_env('LOTE_RPS_ENVIO')
  LOOP
    FOR r2 IN
               (
               SELECT DISTINCT(cd_imv_configuracao_saida),
                               cd_imv_configuracao_elemen_xml,
                               tp_documento,
                               ds_valor
               FROM            mvintegra.imv_configuracao_condicao_env
               )
    LOOP
      IF(r.cd_multi_empresa != r2.ds_valor) THEN
        v_seq_cond_env := mvintegra.seq_imv_configuracao_cond_env.NEXTVAL;
        INSERT INTO mvintegra.imv_configuracao_condicao_env VALUES
                    (
                                v_seq_cond_env,
                                r.cd_multi_empresa,
                                r2.cd_imv_configuracao_saida,
                                r2.cd_imv_configuracao_elemen_xml,
                                r2.tp_documento,
                                '=',
                                r2.ds_valor
                    );

      END IF;
    END LOOP;
  END LOOP;
END;