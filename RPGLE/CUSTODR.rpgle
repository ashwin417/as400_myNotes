 Columns . . . :    6 100                                      Browse                                              ASHLIB/QRPGLESRC 
 SEU==>                                                                                                                     CUSTODR 
 FMT FX FFilename++IPEASF.....L.....A.Device+.Keywords+++++++++++++++++++++++++++++Comments++++++++++++                             
        *************** Beginning of data ***************************************************************************************   
0001.00 FORDLF     IF   E           K DISK                                                                  241229                  
0002.00 Dmsg              S             25                                                                  241229                  
0003.00 Dcust             S             10                                                                  241229                  
0004.00                                                                                                     241229                  
0005.00 C     *ENTRY        PLIST                                                                           241229                  
0006.00 C                   PARM                    cust                                                    241229                  
0007.00 C     cust          SETLL     ORDLF                                                                 241229                  
0008.00 C     cust          READe     ORDLF                                                                 241229                  
0009.00 C                   DOW       NOT %EOF(ORDLF)                                                       241229                  
0010.00 C                   EVAL      msg = 'Order No:' + %char(ORDERNO)                                    241229                  
0011.00 C                             + 'Country:' + COUNTRY                                                241229                  
0012.00 C     msg           DSPLY                                                                           241229                  
0013.00 C     cust          READe     ORDLF                                                                 241229                  
0014.00 C                   ENDDO                                                                           241229                  
0015.00 C                   EVAL      *INLR='1'                                                             241229                  
        ****************** End of data ******************************************************************************************   






Create ordpf   with orderno , country and customer ;   
create rpgle program to get customer as input and display all orders for that customer  ( here we will need lf on ordpf(customer)  , use setll and reade


 Columns . . . :    1  80                                      Browse                                                ASHLIB/QDDSSRC 
 SEU==>                                                                                                                       ORDPF 
 FMT PF .....A..........T.Name++++++RLen++TDpB......Functions+++++++++++++++++++++++++++                                            
        *************** Beginning of data ***************************************************************************************   
0001.00                                             UNIQUE                                   241229                                 
0002.00                 R ORDREC                                                             241229                                 
0003.00                   ORDERNO       10  0                                                241229                                 
0004.00                   COUNTRY       10                                                   241229                                 
0005.00                   CUSTOMER      10                                                   241229                                 
0006.00                 K ORDERNO                                                            241229                                 
        ****************** End of data ******************************************************************************************   
                                                                                                                                    
                                                                                                                                    
																																	
																																	 Columns . . . :    1  80                                      Browse                                                ASHLIB/QDDSSRC 
 SEU==>                                                                                                                       ORDLF 
 FMT LF .....A..........T.Name++++++.Len++TDpB......Functions+++++++++++++++++++++++++++                                            
        *************** Beginning of data ***************************************************************************************   
0001.00                 R ORDREC                    PFILE(ORDPF)                             241229                                 
0002.00                 K CUSTOMER                                                           241229                                 
        ****************** End of data ******************************************************************************************   
                                                                                                                                    
