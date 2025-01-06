 Columns . . . :    6 100                                      Browse                                              ASHLIB/QRPGLESRC 
 SEU==>                                                                                                                  SCN_ORDSFL 
 FMT FX FFilename++IPEASF.....L.....A.Device+.Keywords+++++++++++++++++++++++++++++Comments++++++++++++                             
        *************** Beginning of data ***************************************************************************************   
0001.00 FORDSUBFILECF   E             WORKSTN SFILE(ordSFL:RRN)                                             250101                  
0002.00 FORDPF_SCR UF A E           K DISK                                                                  250101                  
0003.00  *                                                                                                  250101                  
0003.01 DRRN              S              4  0                                                               250101                  
0004.00 C                   DOW       *IN03='0'                                                             250101                  
0004.01 C                   EVAL      RCD_NBR = 1                                                           250104                  
0005.00 C                   IF        *IN06='1'                                                             250101                  
0006.00 C                   EXSR      CREATESR                                                              250101                  
0007.00 C                   ENDIF                                                                           250101                  
0008.00 C                   EXSR      CLRSFL                                                                250101                  
0009.00 C                   EXSR      LOADSFL                                                               250101                  
0010.00 C                   EXSR      DSPLYSFL                                                              250101                  
0010.01 C                   EXSR      PROCSFL                                                               250102                  
0011.00 C                   ENDDO                                                                           250101                  
0012.00 C                   EVAL      *INLR = '1'                                                           250101                  
0013.00  *--------- MAIN LINE CODE OVER --------------------------------------                              250101                  
0014.00  *                                                                                                  250101                  
0015.00  *--------------------------------------------------------------------                              250101                  
0016.00  *--------SUBROUTINE CLRSFL------------------------------------------|                              250101                                              
0018.00 C     CLRSFL        BEGSR                                                                           250101                  
0019.00 C                   EVAL      *IN93 = '1'                                                           250101                  
0020.00 C                   WRITE     ORDCTL                                                                250101                  
0021.00 C                   EVAL      *IN93 = '0'                                                           250101                  
0022.00 C                   ENDSR                                                                           250101                  
0023.00  *--------------------------------------------------------------------                              250101                  
0024.00  *--------SUBROUTINE LOADSFL-----------------------------------------|                              250101                  
0025.00 C     LOADSFL       BEGSR                                                                           250101                  
0026.00 C                   EVAL      RRN = 0                                                               250101                  
0026.02 C     *LOVAL        SETLL     ORDPF_SCR                                                             250103                  
0028.00 C                   READ      ORDPF_SCR                                                             250101                  
0029.00 C                   DOW       NOT %EOF()                                                            250101                  
0029.01 C                   IF        ((ICUSTID = CUSTOMERID AND                                            250105                  
0029.02 C                             ICUSTID <> *BLANKS)   OR                                              250103                  
0029.03 C                             ICUSTID =  *BLANKS) AND                                               250105                  
0029.04 c                             (Icntry = COUNTRY OR                                                  250105                  
0029.05 c                             Icntry = *blanks)                                                     250105                  
0030.00 C                   EVAL      RRN = RRN + 1                                                         250103                  
0031.00 C                   WRITE     ORDSFL                                                                250101                  
0031.01 C                   ENDIF                                                                           250103                  
0031.02 C                   IF        POSORDNO = ORDERNO                                                    250104                  
0031.03 C                   EVAL      RCD_NBR = RRN                                                         250104                  
0031.04 C                   ENDIF                                                                           250104                  
0032.00 C                   READ      ORDPF_SCR                                                             250101                  
0032.04 C                   ENDDO                                                                           250103                  
0034.00 C                   ENDSR                                                                           250101                  
0035.00  *--------------------------------------------------------------------                              250101                  
0036.00  *--------SUBROUTINE DSPLYSFL--------------------------------------|                                250101                  
0037.00 C     DSPLYSFL      BEGSR                                                                           250101                  
0037.01 C                   WRITE     FOOTER                                                                250101                  
0038.00 C                   EVAL      *IN92 = '1'                                                           250101                  
0039.00 C                   IF        RRN > 0                                                               250101                  
0039.01 C                   EVAL      *IN91 = '1'                                                           250101                  
0041.00 C                   EVAL      *IN94 = '1'                                                           250101                  
0042.00 C                   ENDIF                                                                           250101                  
0043.00 C                   EXFMT     ORDCTL                                                                250101                  
0044.00 C                   EVAL      *IN91 = '0'                                                           250101                  
0045.00 C                   EVAL      *IN94 = '0'                                                           250101                  
0046.00 C                   EVAL      *IN92 = '0'                                                           250101                  
0047.00 C                   ENDSR                                                                           250101                                           
0047.01  *---------------------------------------------------------------------------                       250102                  
0047.02  *        CREATESR SUBROUTINE                                                                       250102                  
0047.03  *---------------------------------------------------------------------------                       250102                  
0048.00 C     CREATESR      BEGSR                                                                           250101                  
0048.01 C                   DOW       *IN12= '0'                                                            250102                  
0048.02 C                   EXFMT     CREATESFL                                                             250102                  
0048.03 C                   IF        *IN12 = '1'                                                           250102                  
0048.04 C                   LEAVE                                                                           250102                  
0048.05 C                   ENDIF                                                                           250102                  
0048.06 C                   EVAL      ORDERNO = IORDERNO                                                    250103                  
0048.07 C                   EVAL      ITEM_NAME = IITEM_NAME                                                250102                  
0048.08 C                   EVAL      COUNTRY = ICOUNTRY                                                    250102                  
0048.09 C                   EVAL      CUSTOMERID = CUST_ID                                                  250102                  
0048.10 C                   EVAL      ORDERDATE = %DATE()                                                   250103                  
0048.11 C                   WRITE     ORDREC                                                                250102                  
0048.12 C                   ENDDO                                                                           250102                  
0048.13 C                   EVAL      *IN12 = '0'                                                           250102                  
0048.14 C                   ENDSR                                                                           250102                  
0049.00  *---------------------------------------------------------------------------                       250102                  
0050.00  *        PROCSFL SUBROUTINE                                                                        250102                                              
0051.00  *---------------------------------------------------------------------------                       250102                  
0052.00 C     PROCSFL       BEGSR                                                                           250102                  
0052.01 C                   IF        *IN03 = '1'                                                           250102                  
0052.02 C                   LEAVESR                                                                         250102                  
0052.03 C                   ENDIF                                                                           250102                  
0052.04 C                   IF        RRN = 0                                                               250102                  
0052.05 C                   LEAVESR                                                                         250102                  
0052.06 C                   ENDIF                                                                           250102                  
0052.07 C                   READC     ORDSFL                                                                250102                  
0052.08 C                   DOW       NOT %EOF()                                                            250102                  
0052.09 C                   SELECT                                                                          250102                  
0052.10 C                   when      SOPTION = 4                                                           250103                  
0052.11 C                   EXSR      ORDDEL                                                                250103                  
0052.12 C                   WHEN      SOPTION = 2                                                           250103                  
0052.13 C                   EXSR      ORDUPD                                                                250103                  
0052.14 C                   OTHER                                                                           250103                  
0052.15 C                   EVAL      MESSAGE = 'INVALID OPTION'                                            250103                  
0052.16 C                   ENDSL                                                                           250103                  
0052.17  *                                                                                                  250103                  
0052.18 C                   EVAL      *IN81 = '1'                                                           250103                                             
0052.19 C                   UPDATE    ORDSFL                                                                250103                  
0052.20 C                   EVAL      *IN81 = '0'                                                           250103                  
0052.21  *                                                                                                  250103                  
0052.22 C                   READC     ORDSFL                                                                250103                  
0052.23 C                   ENDDO                                                                           250103                  
0053.00 C                   ENDSR                                                                           250103                  
0054.00                                                                                                     250103                  
0055.00  *--------------------------------------------------------------                                    250103                  
0056.00  * ORDER UPDATE                                                                                     250103                  
0057.00  *--------------------------------------------------------------                                    250103                  
0058.00 C     ORDUPD        BEGSR                                                                           250103                  
0058.03 C                   EVAL      MESSAGE = *BLANKS                                                     250103                  
0058.07 C     ORDERNO       CHAIN     ORDPF_SCR                                                             250103                  
0058.08  *C                   EXFMT     UPDATESFL                                                           250105                  
0058.09 C                   IF        %FOUND()                                                              250103                  
0058.10 C                   EVAL      IITEM_NAME = ITEM_NAME                                                250105                  
0058.11 C                   EVAL      ICOUNTRY = COUNTRY                                                    250105                  
0058.12 C                   EVAL      CUST_ID = CUSTOMERID                                                  250105                  
0058.13 C                   EXFMT     UPDATESFL                                                             250105                  
0058.16 C                   EVAL      ITEM_NAME = IITEM_NAME                                                250103                                        
0058.17 C                   EVAL      COUNTRY = ICOUNTRY                                                    250103                  
0058.18 C                   EVAL      CUSTOMERID = CUST_ID                                                  250103                  
0058.19 C                   UPDATE    ORDREC                                                                250103                  
0058.20 C                   EVAL      MESSAGE='ENTRY UPDATED'                                               250103                  
0058.21 C                   EVAL      *IN12 = '0'                                                           250103                  
0058.22 C                   ENDIF                                                                           250103                  
0058.23 C                   ENDSR                                                                           250103                  
0060.00  *                                                                                                  250103                  
0061.00  *--------------------------------------------------------------                                    250103                  
0062.00  * ORDER DELETE                                                                                     250103                  
0063.00  *--------------------------------------------------------------                                    250103                  
0064.00 C     ORDDEL        BEGSR                                                                           250103                  
0064.01 C     ORDERNO       CHAIN     ORDPF_SCR                                                             250103                  
0064.02 C                   IF        %FOUND()                                                              250103                  
0064.03 C                   DELETE    ORDREC                                                                250103                  
0064.04 C                   ENDIF                                                                           250103                  
0065.00 C                   ENDSR                                                                           250103                  
0066.00  *                                                                                                  250103                  
        ****************** End of data ******************************************************************************************   
                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                     
                                                                                                                                                                                                                              
                                                                                                                                                                                                                                                                                                            
