Employee city using setll and reade

 Columns . . . :    6 100                                      Browse                                              ASHLIB/QRPGLESRC 
 SEU==>                                                                                                                   ECTYSETLL 
 FMT FX FFilename++IPEASF.....L.....A.Device+.Keywords+++++++++++++++++++++++++++++Comments++++++++++++                             
        *************** Beginning of data ***************************************************************************************   
0001.00 FEMPLFRPG  IF   E           K DISK                                                                  241229                  
0002.00 Dcity             S             10                                                                  241229                  
0003.00 Dmsg              S             25                                                                  241229                  
0004.00  *                                                                                                  241229                  
0005.00 C     *ENTRY        PLIST                                                                           241229                  
0006.00 C                   PARM                    city                                                    241229                  
0007.00 C     city          setll     EMPLFRPG                                                              241229                  
0008.00 C     city          READE     EMPLFRPG                                                              241229                  
0009.00 C                   DOW       NOT %EOF()                                                            241229                  
0010.00 C                   EVAL      msg = 'Emp No: ' + %char(EMPNO)                                       241229                  
0011.00 C     msg           DSPLY                                                                           241229                  
0012.00 C     city          READE     EMPLFRPG                                                              241229                  
0013.00 C                   ENDDO                                                                           241229                  
0014.00 C                   EVAL      *INLR = '1'                                                           241229                  
        ****************** End of data ******************************************************************************************   
                                                                                                                                    
                                                                                                                                    

 Columns . . . :    1  80                                      Browse                                                ASHLIB/QDDSSRC 
 SEU==>                                                                                                                        EMPF 
 FMT PF .....A..........T.Name++++++RLen++TDpB......Functions+++++++++++++++++++++++++++                                            
        *************** Beginning of data ***************************************************************************************   
0001.00                                             UNIQUE                                   241223                                 
0002.00                 R EMPREC                                                             241223                                 
0003.00                   EMPNO         10  0                                                241223                                 
0004.00                   EMPCITY       10                                                   241223                                 
0005.00                   GENDER         2                                                   241224                                 
0006.00                 K EMPNO                                                              241223                                 
        ****************** End of data ******************************************************************************************   
                                                                                                                                    
                                                                                                                                    
                                                                                                                                    
                                                                                                                                    
                                                                                                                                    
                                                                                                                                    
                                                                                                                                     Columns . . . :    1  80                                       Edit                                                 ASHLIB/QDDSSRC 
 SEU==>                                                                                                                    EMPLFRPG 
 FMT LF .....A..........T.Name++++++.Len++TDpB......Functions+++++++++++++++++++++++++++                                            
        *************** Beginning of data ***************************************************************************************   
0002.00                 R EMPREC                     PFILE(EMPF)                             241223                                 
0003.00                 K EMPCITY                                                            241225                                 
        ****************** End of data ******************************************************************************************   
                                                                                                                                    
                                                                                                                                    
                                                                                                                                    
                                                                                                                                    
                                                                                                                                    
                                                                                                                                    
                                                                                                                                    
