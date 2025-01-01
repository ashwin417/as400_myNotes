 Columns . . . :    6 100                                       Edit                                               ASHLIB/QRPGLESRC 
 SEU==>                                                                                                                  SFLEMPPGM2 
 FMT H  HKeywords++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++Comments++++++++++++                             
        *************** Beginning of data ***************************************************************************************   
0001.00 HOPTION(*NODEBUGIO:*SRCSTMT:*NOUNREF)                                                               250101                  
0002.00 FEMPF      UF A E           K DISK                                                                  250101                  
0003.00 FEMPSUBFILECF   E             WORKSTN SFILE(EMPSFL:RRN)                                             250101                  
0004.00  *                                                                                                  250101                  
0005.00 DRRN              S              4  0                                                               250101                  
0006.00  *                                                                                                  250101                  
0007.00 C                   DOW       *IN03='0'                                                             250101                  
0007.01 C                   IF        *IN06 = '1'                                                           250101                  
0007.02 C                   EXSR      CREATESR                                                              250101                  
0007.03 C                   ITER                                                                            250101                  
0007.04 C                   ENDIF                                                                           250101                  
0007.05  *                                                                                                  250101                  
0008.00 C                   EXSR      CLRSFL                                                                250101                  
0009.00 C                   EXSR      LOADSFL                                                               250101                  
0010.00 C                   EXSR      DSPLYSFL                                                              250101                  
0011.00 C                   ENDDO                                                                           250101                  
0012.00  *                                                                                                  250101                  
0013.00 C                   EVAL      *INLR = *ON                                                           250101                  
0014.00  *--------------------------------------------------------                                          250101                  
 Columns . . . :    6 100                                       Edit                                               ASHLIB/QRPGLESRC 
 SEU==>                                                                                                                  SFLEMPPGM2 
 FMT *   *. 1 ...+... 2 ...+... 3 ...+... 4 ...+... 5 ...+... 6 ...+... 7 ...+... 8 ...+... 9 ...+... 0                             
0015.00  *   CLEAR SUBROUTINE                                                                               250101                  
0016.00  *--------------------------------------------------------                                          250101                  
0017.00 C     CLRSFL        BEGSR                                                                           250101                  
0018.00 C                   EVAL      *IN93 = '1'                                                           250101                  
0019.00 C                   WRITE     EMPCTL                                                                250101                  
0020.00 C                   EVAL      *IN93 = '0'                                                           250101                  
0021.00 C                   ENDSR                                                                           250101                  
0022.00  *--------------------------------------------------------                                          250101                  
0023.00  *   LOAD SUBROUTINE                                                                                250101                  
0024.00  *--------------------------------------------------------                                          250101                  
0025.00 C     LOADSFL       BEGSR                                                                           250101                  
0026.00 C                   EVAL      RRN = 0                                                               250101                  
0027.00 C     *LOVAL        SETLL     EMPF                                                                  250101                  
0028.00 C                   READ      EMPF                                                                  250101                  
0029.00 C                   DOW       NOT %EOF()                                                            250101                  
0029.01 C                   EVAL      SEMPNO = EMPNO                                                        250101                  
0029.02 C                   EVAL      SENAME = ENAME                                                        250101                  
0029.03 C                   EVAL      SCITY = EMPCITY                                                       250101                  
0029.04 C                   EVAL      SGENDER = GENDER                                                      250101                  
0029.05 C                   EVAL      RRN = RRN + 1                                                         250101                  
 Columns . . . :    6 100                                       Edit                                               ASHLIB/QRPGLESRC 
 SEU==>                                                                                                                  SFLEMPPGM2 
 FMT C  CL0N01Factor1+++++++Opcode&ExtFactor2+++++++Result++++++++Len++D+HiLoEq....Comments++++++++++++                             
0029.06 C                   WRITE     EMPSFL                                                                250101                  
0029.07 C                   READ      EMPF                                                                  250101                  
0030.00 C                   ENDDO                                                                           250101                  
0030.01 C                   ENDSR                                                                           250101                  
0031.00  *--------------------------------------------------------                                          250101                  
0032.00  *   DISPLAY SUBROUTINE                                                                             250101                  
0033.00  *--------------------------------------------------------                                          250101                  
0034.00 C     DSPLYSFL      BEGSR                                                                           250101                  
0035.00 C                   WRITE     FOOTER                                                                250101                  
0036.00 C                   EVAL      *IN92 = '1'                                                           250101                  
0037.00 C                   IF        RRN>0                                                                 250101                  
0038.00 C                   EVAL      *IN91 = '1'                                                           250101                  
0039.00 C                   EVAL      *IN94 = '1'                                                           250101                  
0040.00 C                   ENDIF                                                                           250101                  
0041.00 C                   EXFMT     EMPCTL                                                                250101                  
0041.01 C                   EVAL      *IN91 = '0'                                                           250101                  
0041.02 C                   EVAL      *IN94 = '0'                                                           250101                  
0042.00                                                                                                     250101                  
0043.00 C                   EVAL      *IN92 = '0'                                                           250101                  
0044.00 C                   ENDSR                                                                           250101                  
 Columns . . . :    6 100                                       Edit                                               ASHLIB/QRPGLESRC 
 SEU==>                                                                                                                  SFLEMPPGM2 
 FMT *   *. 1 ...+... 2 ...+... 3 ...+... 4 ...+... 5 ...+... 6 ...+... 7 ...+... 8 ...+... 9 ...+... 0                             
0045.00  *--------------------------------------------------------                                          250101                  
0046.00  *   CREATE  SUBROUTINE                                                                             250101                  
0047.00  *--------------------------------------------------------                                          250101                  
0048.00 C     CREATESR      BEGSR                                                                           250101                  
0048.01 C                   DOW       *IN12 = '0'                                                           250101                  
0048.02 C                   EXFMT     CREATESFL                                                             250101                  
0048.03                                                                                                     250101                  
0048.04 C                   IF        *IN12 = '1'                                                           250101                  
0048.05 C                   LEAVE                                                                           250101                  
0048.06 C                   ENDIF                                                                           250101                  
0048.07 C                   EVAL      EMPNO = IENO                                                          250101                  
0048.08 C                   EVAL      ENAME = IEMPNAME                                                      250101                  
0048.09 C                   EVAL      EMPCITY  = ICITY                                                      250101                  
0048.10 C                   EVAL      GENDER = IGENDER                                                      250101                  
0048.11 C                   WRITE     EMPREC                                                                250101                  
0048.12 C                   ENDDO                                                                           250101                  
0048.13 C                   EVAL      *IN12 = '0'                                                           250101                  
0049.00 C                   ENDSR                                                                           250101                  
        ****************** End of data ******************************************************************************************   
                                                                                                                                    
                                                           
                                                                                                                                                                                             
                                                                                                                                                                                                 
                                                                                                                                                                                                                                                                        
                                                                 
