
CREATE SEQUENCE mvintegra.seq_temp_log
MINVALUE 1
MAXVALUE 999999999999999999999999999
INCREMENT BY 1
NOCYCLE
NOORDER
CACHE 60
/


/*
 CRIA TABELA E TRIGGER PARA MONITORAR OS TOMCATS
*/


CREATE TABLE mvintegra.user_tomcat (
  id               NUMBER         NULL,
  nm_machine       VARCHAR2(1000) NULL,
  programa         VARCHAR2(500)  NULL,
  dt_integracao    DATE           NULL,
  origem           VARCHAR2(50)   NULL,
  nm_usuario       VARCHAR2(100)  NULL,
  cd_produto       NUMBER         NULL,
  cd_identificador NUMBER(10,0)   NULL
)


SELECT * FROM mvintegra.user_tomcat

CREATE OR REPLACE TRIGGER mvintegra.inclu_mens
BEFORE  UPDATE ON mvintegra.imv_mensagem_saida_formatada
REFERENCING
 NEW AS NEW
 OLD AS OLD
FOR EACH ROW
DECLARE
  vMachine  VARCHAR2(60) :=NULL;
BEGIN
 SELECT machine
   INTO vMachine
   FROM v$session
   where audsid = userenv('sessionid');
  INSERT INTO mvintegra.user_tomcat(id,nm_machine,dt_integracao)VALUES(mvintegra.seq_temp_log.nextval,vMachine,sysdate);
END;
/

DROP TABLE mvintegra.user_tomcat;

DROP TRIGGER mvintegra.inclu_mens;