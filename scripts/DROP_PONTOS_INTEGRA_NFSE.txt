DECLARE
   CURSOR c_saida (vcds_saida mvintegra.imv_configuracao_saida.ds_saida%TYPE)
   IS
      SELECT cd_sistema_destino
        FROM mvintegra.imv_configuracao_saida
       WHERE ds_saida = vcds_saida;

   pcd_processo_integracao   mvintegra.processo_integracao.cd_processo_integracao%TYPE;
   pds_saida                 mvintegra.imv_configuracao_saida.ds_saida%TYPE;
   pcd_sistema_destino       mvintegra.imv_configuracao_saida.cd_sistema_destino%TYPE;
BEGIN
   pcd_processo_integracao := 'IMVWSAINFSE'; /* IMVWINENTPROCON   IMVWOUTMOVESTCE  IMVWOUTMOVESTCJ */
   pds_saida := 'RPS-NFSE - ENVIO DE NOTA/LOTE [BH]';

   DELETE FROM mvintegra.imv_configuracao_requisicao
         WHERE cd_imv_configuracao_requisicao IN (SELECT r.cd_imv_configuracao_requisicao
                                                    FROM mvintegra.imv_config_entid_xml_proc_intg i, mvintegra.imv_configuracao_requisicao r
                                                   WHERE i.cd_imv_configuracao_entid_xml = r.cd_imv_configuracao_entid_xml AND i.cd_processo_integracao = pcd_processo_integracao);

   DELETE FROM mvintegra.imv_configuracao_funcao_conec
         WHERE cd_imv_configuracao_fnc_conec IN (SELECT r.cd_imv_configuracao_fnc_conec
                                                   FROM mvintegra.imv_config_entid_xml_proc_intg i, mvintegra.imv_configuracao_funcao_conec r
                                                  WHERE i.cd_imv_configuracao_entid_xml = r.cd_imv_configuracao_entid_xml AND i.cd_processo_integracao = pcd_processo_integracao);

   DELETE FROM mvintegra.imv_config_entid_xml_proc_intg i
         WHERE i.cd_processo_integracao = pcd_processo_integracao;

   DELETE FROM mvintegra.imv_configuracao_tip_intg_cnct
         WHERE cd_imv_config_tp_intg_cnct IN (SELECT r.cd_imv_config_tp_intg_cnct
                                                FROM mvintegra.imv_config_entid_xml_proc_intg i, mvintegra.imv_configuracao_tip_intg_cnct r
                                               WHERE i.cd_imv_configuracao_entid_xml = r.cd_imv_configuracao_entid_xml AND i.cd_processo_integracao = pcd_processo_integracao);

   DELETE FROM mvintegra.imv_config_entid_xml_proc_intg i
         WHERE i.cd_processo_integracao = pcd_processo_integracao;

   DELETE FROM mvintegra.condicao_execucao i
         WHERE i.cd_processo_integracao = pcd_processo_integracao;

   DELETE FROM mvintegra.arquivo_integracao i
         WHERE i.cd_processo_integracao = pcd_processo_integracao;

   DELETE FROM mvintegra.job_integracao i
         WHERE i.cd_processo_integracao = pcd_processo_integracao;

   DELETE FROM mvintegra.coluna_integracao i
         WHERE i.cd_processo_integracao = pcd_processo_integracao;

   DELETE FROM mvintegra.coluna_integracao i
         WHERE i.cd_processo_integracao = pcd_processo_integracao;

/*DELETE FROM mvintegra.imv_mensagem_erro i
         WHERE i.cd_processo_integracao = pcd_processo_integracao;  */

   DELETE FROM mvintegra.processo_integracao i
         WHERE i.cd_processo_integracao = pcd_processo_integracao;

   IF (pds_saida IS NOT NULL)
   THEN
      OPEN c_saida(pds_saida);
      FETCH c_saida INTO pcd_sistema_destino;
      CLOSE c_saida;

      DELETE FROM mvintegra.imv_configuracao_saida_param
            WHERE cd_imv_configuracao_saida IN (SELECT cd_imv_configuracao_saida
                                                  FROM mvintegra.imv_configuracao_saida
                                                 WHERE ds_saida = pds_saida);

      DELETE FROM mvintegra.imv_configuracao_saida_tp_doc
            WHERE cd_imv_configuracao_saida IN (SELECT cd_imv_configuracao_saida
                                                  FROM mvintegra.imv_configuracao_saida
                                                 WHERE ds_saida = pds_saida);

      DELETE FROM mvintegra.imv_configuracao_saida
            WHERE ds_saida = pds_saida;

      DELETE FROM mvintegra.sistema_terceiro
            WHERE ds_sistema_terceiro = pcd_sistema_destino;
   END IF;

   DELETE FROM mvintegra.imv_configuracao_job j
         WHERE NOT EXISTS (SELECT 1
                             FROM mvintegra.imv_configuracao_saida
                            WHERE (cd_configuracao_job_formatacao = j.cd_imv_configuracao_job OR cd_configuracao_job_envio = j.cd_imv_configuracao_job)) AND NOT EXISTS (SELECT 1
                                                                                                                                                                           FROM mvintegra.imv_configuracao_tip_intg_cnct
                                                                                                                                                                          WHERE cd_thread = j.cd_imv_configuracao_job);

   COMMIT;
   DBMS_OUTPUT.put_line ('Sucesso');
EXCEPTION
   WHEN OTHERS
   THEN
      DBMS_OUTPUT.put_line ('Erro ' || SQLERRM);
      ROLLBACK;
END;