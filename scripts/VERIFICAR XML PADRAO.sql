Declare
	vTipoDadoIMV	  sys.all_tab_columns.data_type%Type;
	vTipoDadoESTRU	  mvintegra.imv_configuracao_elemento_xml.tp_elemento%Type;
	vNomeServico	  mvintegra.imv_configuracao_entidade_xml.ds_integracao%Type;
	vTipoFluxoServico mvintegra.imv_configuracao_entidade_xml.tp_fluxo%Type;
	vNmColunaTabela	  mvintegra.imv_configuracao_elemento_xml.nm_coluna%Type;
Begin

	vNomeServico      := Upper('LOTE_RPS_CONSULTA');     /* CADASTRO_PACIENTE, MOVIMENTO_ATENDIMENTO */
	vTipoFluxoServico := Upper('S'); /* S-SaÃ­da / E-Entrada*/

	For rXmlPadraoTipoDado In(Select UPPER(el.nm_coluna) nm_coluna
	                                ,el.cd_imv_configuracao_entid_xml
	                                ,el.cd_imv_configuracao_elemen_xml
									,el.nm_elemento
									,Decode(el.tp_elemento,'STRING','VARCHAR2','DECIMAL','NUMBER',tp_elemento) tp_elemento
									,atb.column_name
									,atb.data_type
								From mvintegra.imv_configuracao_entidade_xml e
									,mvintegra.imv_configuracao_elemento_xml el
									,sys.all_tab_columns atb
							   Where e.ds_integracao=vNomeServico
								 And e.tp_fluxo=vTipoFluxoServico
								 And el.cd_imv_configuracao_entid_xml = e.cd_imv_configuracao_entid_xml
								 And atb.owner                        = SubStr(e.nm_tabela,1,9)
								 And atb.table_name                   = SubStr(e.nm_tabela,11,100)
								 And UPPER(el.nm_coluna)              = atb.column_name
								 And el.nm_elemento                   Is Not Null
								 And el.tp_elemento                   <> atb.data_type) Loop

		vTipoDadoIMV   := rXmlPadraoTipoDado.tp_elemento;
		vTipoDadoESTRU := rXmlPadraoTipoDado.data_type;

		If vTipoDadoIMV <> vTipoDadoESTRU Then
			Dbms_Output.Put_Line('AtenÃ§Ã£o: A coluna: '||rXmlPadraoTipoDado.nm_coluna||' esta com tipo de dados divergente do existente no banco de dados!');
			Dbms_Output.Put_Line('CÃ³digo Entidade: '||rXmlPadraoTipoDado.cd_imv_configuracao_entid_xml);
			Dbms_Output.Put_Line('CÃ³digo Elemento: '||rXmlPadraoTipoDado.cd_imv_configuracao_elemen_xml);
			Dbms_Output.Put_Line('Nome Elemento Xml: '||rXmlPadraoTipoDado.nm_elemento);
			Dbms_Output.Put_Line('Tipo de dados XML padrÃ£o: '||vTipoDadoIMV);
			Dbms_Output.Put_Line('Tipo de dados no banco: '||vTipoDadoESTRU);
			Dbms_Output.Put_Line(' ');
		End If;

	End Loop;

	For rColunaMapemanto In(Select e.cd_imv_configuracao_entid_xml
	                              ,el.cd_imv_configuracao_elemen_xml
								  ,el.nm_elemento
								  ,UPPER(el.nm_coluna) nm_coluna
								  ,e.nm_tabela
							  From mvintegra.imv_configuracao_entidade_xml e
								  ,mvintegra.imv_configuracao_elemento_xml el
						     Where e.ds_integracao                  = vNomeServico
							   And e.tp_fluxo                       = vTipoFluxoServico
							   And el.cd_imv_configuracao_entid_xml = e.cd_imv_configuracao_entid_xml
							   And UPPER(el.nm_coluna) Not In(Select atb.column_name
															    From sys.all_tab_columns atb
															   Where atb.owner      = SubStr(e.nm_tabela,1,9)
															     And atb.table_name = SubStr(e.nm_tabela,11,100))) Loop
		Dbms_Output.Put_Line('CÃ³digo Entidade: '||rColunaMapemanto.cd_imv_configuracao_entid_xml);
	    Dbms_Output.Put_Line('CÃ³digo Elemento: '||rColunaMapemanto.cd_imv_configuracao_elemen_xml);
		Dbms_Output.Put_Line('AtenÃ§Ã£o: A coluna '||rColunaMapemanto.nm_coluna||' nÃ£o existe na tabela '||rColunaMapemanto.nm_tabela||' !');
		Dbms_Output.Put_Line('Nome Elemento: '||rColunaMapemanto.nm_elemento);
		Dbms_Output.Put_Line(' ');

	End Loop;

End;
/