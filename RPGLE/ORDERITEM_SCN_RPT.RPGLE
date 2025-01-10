 *-------------------- SCREEN PROGRAM FOR ORDER AND ITEM----------------------------------------------------------*


Columns . . . :    6 100                                      Browse                                              ASHLIB/QRPGLESRC 
 SEU==>                                                                                                                  ORDITMRPGS 
 FMT FX FFilename++IPEASF.....L.....A.Device+.Keywords+++++++++++++++++++++++++++++Comments++++++++++++                             
        *************** Beginning of data ***************************************************************************************   
0001.00 FITMPF     IF   E           K DISK                                                                  250109                  
0002.00 FORDPF_SCR IF   E           K DISK                                                                  250109                  
0003.00 FORDITMRPTSCF   E             WORKSTN SFILE(SCRSFL:RRN)                                             250109                  
0004.00  *--------DEFINITION LEVEL------------------------------                                            250109                  
0004.01 DRRN              S              4  0                                                               250109                  
0004.02 DPNO              S             10  0                                                               250109                  
0005.00  *--------C SPEC----------------------------------------                                            250109                  
0006.00 C                   DOW       *IN03 = '0'                                                           250109                  
0007.00 C                   EXSR      CLRSFL                                                                250109                  
0008.00 C                   EXSR      LOADSFL                                                               250109                  
0009.00 C                   EXSR      DSPSFL                                                                250109                  
0010.00 C                   EXSR      PRCSFL                                                                250109                  
0011.00 C                   ENDDO                                                                           250109                  
0012.00 C                   EVAL      *INLR = '1'                                                           250109                  
0013.00  *-------------MAIN CODE OVER--- SUBROUTINE STARTS--------                                          250109                  
0014.00  * CLRSFL                                                                                           250109                  
0015.00 C     CLRSFL        BEGSR                                                                           250109                  
0016.00 C                   EVAL      *IN93 = '1'                                                           250109                  
0017.00 C                   WRITE     SCRCTRL                                                               250109                                     
0018.00 C                   EVAL      *IN93 = '0'                                                           250109                  
0019.00 C                   ENDSR                                                                           250109                  
0020.00  *-------------LOADSFL------------------------------------                                          250109                  
0021.00 C     LOADSFL       BEGSR                                                                           250109                  
0022.00 C                   EVAL      RRN = 0                                                               250109                  
0023.00 C     borderno      SETLL     ORDPF_SCR                                                             250109                  
0024.00 C     borderno      READe     ORDPF_SCR                                                             250109                  
0025.00 C                   DOW       NOT %EOF()                                                            250109                  
0025.01 C     ITEMNO        chain     ITMPF                                                                 250109                  
0025.02 C                   IF        %found()                                                              250109                  
0026.00 C                   EVAL      RRN = RRN + 1                                                         250109                  
0026.04 c                   eval      SITMNO = ITMNO                                                        250109                  
0026.05 C                   EVAL      SITEM_NAME = ITEM_NAME                                                250109                  
0026.06 C                   EVAL      SPRICE = PRITMPRICE                                                   250109                  
0026.07 C                   EVAL      STYPE = TYPE                                                          250109                  
0026.08 C                   EVAL      SDESC = ITEMDESC                                                      250109                  
0027.00 C                   WRITE     SCRSFL                                                                250109                  
0028.01 C                   ENDIF                                                                           250109                  
0028.02 C     borderno      READe     ORDPF_SCR                                                             250109                  
0028.03 C                   EVAL      PNO = BORDERNO                                                        250109                                           
0029.00 C                   ENDDO                                                                           250109                  
0030.00 C                   ENDSR                                                                           250109                  
0031.00  *--------------DSPSFL-------------------------                                                     250109                  
0032.00 C     DSPSFL        BEGSR                                                                           250109                  
0032.01 C                   WRITE     FOOTER                                                                250109                  
0033.00 C                   EVAL      *IN92 = '1'                                                           250109                  
0033.01 C                   IF        RRN > 0                                                               250109                  
0034.00 C                   EVAL      *IN91 = '1'                                                           250109                  
0035.00 C                   EVAL      *IN94 = '1'                                                           250109                  
0035.01 C                   ENDIF                                                                           250109                  
0035.02 C                   EXFMT     SCRCTRL                                                               250109                  
0036.00 C                   EVAL      *IN92 = '0'                                                           250109                  
0037.00 C                   EVAL      *IN91 = '0'                                                           250109                  
0038.00 C                   EVAL      *IN94 = '0'                                                           250109                  
0039.00 C                   ENDSR                                                                           250109                  
0040.00  *-------------------PRCSFL------------------------------                                           250109                  
0041.00 C     PRCSFL        BEGSR                                                                           250109                  
0042.00 C                   IF        *IN03 = '1'                                                           250109                  
0043.00 C                   LEAVESR                                                                         250109                  
0043.01 C                   ENDIF                                                                           250109                                    
0044.00 C                   IF        RRN = 0                                                               250109                  
0045.00 C                   LEAVESR                                                                         250109                  
0046.00 C                   ENDIF                                                                           250109                  
0046.01 C                   IF        *IN07 = '1'                                                           250109                  
0046.02 C                   CALL      'ORDITMRPTR'                                                          250109                  
0046.03 C                   PARM                    PNO                                                     250109                  
0046.04 C                   ENDIF                                                                           250109                  
0047.00 C                   ENDSR                                                                           250109                  
        ****************** End of data ******************************************************************************************   

 *-------------------- REPORT PROGRAM FOR ORDER AND ITEM----------------------------------------------------------*
 Columns . . . :    6 100                                      Browse                                              ASHLIB/QRPGLESRC 
 SEU==>                                                                                                                  ORDITMRPTR 
 FMT F  FFilename++IPEASFRlen+LKlen+AIDevice+.Keywords+++++++++++++++++++++++++++++Comments++++++++++++                             
        *************** Beginning of data ***************************************************************************************   
0001.00 f                                                                                                   250109                  
0002.00 Forditmrpt O    E             PRINTER OFLIND(*IN99)                                                 250109                  
0003.00 FORDPF_SCR iF   E           K DISK                                                                  250109                  
0003.01 FITMPF     iF   E           K DISK                                                                  250109                  
0004.00  *                                                                                                  250109                  
0005.00 DNo               S             10  0                                                               250109                  
0006.00 C     *ENTRY        PLIST                                                                           250109                  
0007.00 C                   PARM                    No                                                      250109                  
0008.00 C                   EVAL      DATE=%DATE()                                                          250109                  
0009.00 C                   WRITE     HEADER                                                                250109                  
0010.00 C                   WRITE     HEADINGID                                                             250109                  
0010.01 C     no            SETLL     ORDPF_SCR                                                             250109                  
0010.02 C     NO            READe     ORDPF_SCR                                                             250109                  
0010.03 C                   DOW       NOT %EOF()                                                            250109                  
0010.04 C     ITEMNO        chain     ITMPF                                                                 250109                  
0010.05 C                   IF        %found()                                                              250109                  
0010.12 C                   WRITE     details                                                               250109                  
0010.13 C                   ENDIF                                                                           250109                  
0010.14 C     NO            READe     ORDPF_SCR                                                             250109                  
0010.15 C                   ENDDO                                                                           250109                  
0020.00 C                   EVAL      *INLR = '1'                                                           250109                  
                                                                                                                                     
                                                                                                                                                                                       
                                                                                            
                                                                                                                                                                                                                                                                                                                                                                          
