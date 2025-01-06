 *Create a flat file ITEMEXT with record length 500  2.Create rpgle program to move data from item pf  to flat file


Columns . . . :    6 100                                       Edit                                               ASHLIB/QRPGLESRC 
 SEU==>                                                                                                                    ATFILETM 
 FMT FX FFilename++IPEASF.....L.....A.Device+.Keywords+++++++++++++++++++++++++++++Comments++++++++++++                             
        *************** Beginning of data ***************************************************************************************   
0001.00 FITMPF     IF   E           K DISK                                                                  250106                  
0002.00 FITMFLTF   UF A E           K DISK    RENAME(ITMFLTF:FLTREC)PREFIX('P_')                            250106                  
0002.01 DP_ITMFLTF        DS                                                                                250106                  
0002.02 DITMNO                          10  0                                                               250106                  
0002.03 DPRITMPRICE                     10  2                                                               250106                  
0002.04 DITEMDESC                       20                                                                  250106                  
0002.05 DTYPE                            2                                                                  250106                  
0004.00 C                   READ      ITMPF                                                                 250106                  
0005.00 C                   DOW       NOT %EOF()                                                            250106                  
0006.00 C                   WRITE     FLTREC                                                                250106                  
0007.00 C                   READ      ITMPF                                                                 250106                  
0008.00 C                   ENDDO                                                                           250106                  
0009.00 C                   EVAL      *INLR='1'                                                             250106                  
        ****************** End of data ******************************************************************************************   
                                                                                                                                    
                                                                                                                                    
                                                                                                                                    
                                                                                                                                    
                                                                                                                                    
                                                                                                                                                                                                    
