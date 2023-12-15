DECLARE
  CURSOR cParametros IS SELECT * FROM mvintegra.imv_configuracao_saida_param a
    INNER JOIN mvintegra.imv_configuracao_saida b ON a.cd_imv_configuracao_saida = b.cd_imv_configuracao_saida
    WHERE b.ds_saida like ('%RPS%') OR b.ds_saida LIKE ('%NFSE%');

 CURSOR cProcesso IS SELECT cd_imv_configuracao_saida,ds_saida,cd_sistema_destino,cd_configuracao_job_formatacao,cd_configuracao_job_envio,cd_imv_configuracao_job,ds_job
  FROM mvintegra.imv_configuracao_saida a left  JOIN mvintegra.imv_configuracao_job b
    ON a.cd_configuracao_job_formatacao = b.cd_imv_configuracao_job OR a.cd_configuracao_job_envio = b.cd_imv_configuracao_job
     WHERE a.ds_saida like ('%RPS%') OR a.ds_saida LIKE ('%NFSE%');

  contador NUMBER;
BEGIN
   contador := 0;
   Dbms_Output.Put_Line('-------------------- Contém espaços --------------------');
   FOR vParametros IN cParametros LOOP
     IF (InStr(vParametros.ds_valor,' ') > 0) THEN
       contador := contador + 1;
       vParametros.ds_valor := REPLACE(vParametros.ds_valor,' ','[*]');
       Dbms_Output.Put_Line(vParametros.ds_saida || '  ' || vParametros.cd_imv_configuracao_saida_par || ' - '
       || vParametros.nm_parametro || ' -> ' || vParametros.ds_valor);
     END IF;
   END LOOP;

   FOR vProcesso IN cProcesso LOOP
    IF (InStr(vProcesso.ds_job,' ') > 0) THEN
       contador := contador + 1;
      vProcesso.ds_job := REPLACE(vProcesso.ds_job,' ','[*]');
        Dbms_Output.Put_Line(vProcesso.ds_saida || '  ' || 'Job -> ' || vProcesso.ds_job);
    END IF;
   END LOOP;
   Dbms_Output.Put_Line('------------------------ Resumo --------------------------');

   IF (contador > 0 )  THEN
     Dbms_Output.Put_Line(contador || ' parametros contem espaços. O Simbolo [*] representa os espaços para melhor identificacao.');
   ELSE
     Dbms_Output.Put_Line('Nao existem parametros com espacos.');
   END IF;
END;