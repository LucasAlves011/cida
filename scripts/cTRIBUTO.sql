select cd_detalhamento
          ,ds_detalhamento
          ,vl_tributo
          ,vl_percentual
          ,Sn_retido
          ,Tp_Detalhamento
     from (Select nota_fiscal_tributo.cd_detalhamento
                 ,Tip_Detalhe.ds_detalhamento
                 ,nota_fiscal_tributo.vl_tributo
                 ,nota_fiscal_tributo.vl_percentual
                 ,nota_fiscal_tributo.Sn_retido
                 ,Tip_Detalhe.Tp_Detalhamento
             From dbamv.nota_fiscal_tributo
                 ,dbamv.Tip_Detalhe
            Where nota_fiscal_tributo.Cd_Detalhamento = Tip_Detalhe.Cd_Detalhamento
              and nota_fiscal_tributo.Cd_Nota_Fiscal  = nCdNotaFiscal  --> cd_nota_fiscal
              and 'N' = psnOperadora     --
        union all
           Select mvs_nota_fiscal_tributo.cd_detalhamento
                 ,Tip_Detalhe.ds_detalhamento
                 ,mvs_nota_fiscal_tributo.vl_tributo
                 ,mvs_nota_fiscal_tributo.vl_percentual
                 ,mvs_nota_fiscal_tributo.Sn_retido
                 ,Tip_Detalhe.Tp_Detalhamento
             From dbamv.mvs_nota_fiscal_tributo
                 ,dbamv.Tip_Detalhe
            Where mvs_nota_fiscal_tributo.Cd_Detalhamento = Tip_Detalhe.Cd_Detalhamento
              and mvs_nota_fiscal_tributo.Cd_Nota_Fiscal  = nCdNotaFiscal --> cd_nota_fiscal
              and 'S' = psnOperadora )
     order by Sn_retido;