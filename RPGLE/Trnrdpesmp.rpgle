transaction setgt and readpe 

 Columns . . . :    6 100                                      Browse                                              ASHLIB/QRPGLESRC 
 SEU==>                                                                                                                  TRNRDPESMP 
 FMT FX FFilename++IPEASF.....L.....A.Device+.Keywords+++++++++++++++++++++++++++++Comments++++++++++++                             
        *************** Beginning of data ***************************************************************************************   
0001.00 FTRANLF    IF   E           K DISK                                                                  241228                  
0002.00 Dnum              S             10  0                                                               241228                  
0003.00 Dmsg              S             50                                                                  241228                  
0004.00 Dcnt              S             10  0                                                               241228                  
0005.00  *                                                                                                  241228                  
0006.00 C     *entry        PLIST                                                                           241228                  
0007.00 C                   parm                    num                                                     241228                  
0008.00 C                   eval      cnt = 0                                                               241228                  
0009.00 C     num           setgt     TRANLF                                                                241228                  
0010.00 C     num           readpe    TRANLF                                                                241228                  
0011.00 C                   DOW       NOT %EOF(TRANLF) and cnt < 10                                         241228                  
0012.00 C                   Eval      msg = %char(Accountno)+ ' '+ %char(tranno)                            241228                  
0013.00 C                             + ' ' + trantype + %char(tranamount)                                  241228                  
0014.00 C     msg           DSPLY                                                                           241228                  
0015.00 C                   EVAL      cnt = cnt+1                                                           241228                  
0016.00 C     num           READPE    TRANLF                                                                241228                  
0017.00 C                   ENDDO                                                                           241228                  
0018.00 C                   EVAL      *INLR = '1'                                                           241228                  
        ****************** End of data ******************************************************************************************   
                                                                                                                                    
