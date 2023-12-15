-- NOTAS QUE ESTÃO AGUARDANDO PARA ENTRAR NA FILA DE ENVIO
(SELECT Count(1) produto FROM dbamv.nota_fiscal WHERE cd_status = 'E' AND cd_status_nfe = 'A' AND trunc(dt_emissao) = '16-11-2023')



SELECT * from (select Count(1) formtd FROM   mvintegra.imv_mensagem_saida_formatada WHERE tp_status = 'A' AND tp_documento IN('LOTE_RPS_ENVIO','LOTE_RPS_CONSULTA','CANCELAMENTO_RPS')),
(select Count(1) padrao FROM   mvintegra.imv_mensagem_saida_padrao_stat  WHERE tp_status = 'A' AND cd_sistema_destino LIKE '%NFSE%'),
( select Count(1) imv_nota from mvintegra.imv_nota_fiscal_eletronica WHERE tp_status = 'A' AND tp_registro IN (001,002,003,033,034)) 