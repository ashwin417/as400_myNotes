 Columns . . . :    6 100                                      Browse                                              ASHLIB/QRPGLESRC 
 SEU==>                                                                                                                   ORDSCREEN 
 FMT FX FFilename++IPEASF.....L.....A.Device+.Keywords+++++++++++++++++++++++++++++Comments++++++++++++                             
        *************** Beginning of data ***************************************************************************************   
0001.00 FORDERCUST CF   E             WORKSTN                                                               241230                  
0002.00 FORDPF_SCR UF A E           K DISK                                                                  241230                  
0003.00  *                                                                                                  241230                  
0004.00 C                   DOW       *IN03='0'                                                             241230                  
0005.00 C                   EXFMT     ORD                                                                   241230                  
0006.00 C                   IF        *IN03 = '1'                                                           241230                  
0007.00 C                   LEAVE                                                                           241230                  
0008.00 C                   ENDIF                                                                           241230                  
0009.00  *                                                                                                  241230                  
0010.00 C     ORDNO         CHAIN     ORDPF_SCR                                                             241230                  
0011.00 C                   IF        %FOUND(ORDPF_SCR)                                                     241230                  
0013.00 C                   EVAL      ITEM_NAME = INAME                                                     241230                  
0014.00 C                   EVAL      COUNTRY = CNTRY                                                       241230                  
0015.00 C                   EVAL      CUSTOMERID = CUSTID                                                   241230                  
0016.00 C                   UPDATE    ORDREC                                                                241230                  
0017.00 C                   EVAL      MSG = 'DATA UPDATED'                                                  241230                  
0018.00 C                   ELSE                                                                            241230                  
0018.01 C                   EVAL      ORDERNO = ORDNO                                                       241230                  
0018.02 C                   EVAL      ITEM_NAME = INAME                                                     241230    
0018.03 C                   EVAL      COUNTRY = CNTRY                                                       241230       
0018.04 C                   EVAL      CUSTOMERID = CUSTID                                                   241230       
0018.06 C                   WRITE     ORDREC                                                                241230       
0018.07 C                   EVAL      MSG = 'DATA WRITTEN'                                                  241230       
0019.00 C                   ENDIF                                                                           241230       
0020.00 C                   ENDDO                                                                           241230       
0021.00 C                   EVAL      *INLR = '1'                                                           241230       
