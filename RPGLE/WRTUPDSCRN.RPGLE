 Columns . . . :    6 100                                      Browse                                              ASHLIB/QRPGLES
 SEU==> C                                                                                                                WRTUPDSC
 FMT FX FFilename++IPEASF.....L.....A.Device+.Keywords+++++++++++++++++++++++++++++Comments++++++++++++                          
        *************** Beginning of data ***************************************************************************************
0001.00 FEMPF      UF A E           K DISK                                                                  241230               
0001.01 FEMPLOY    CF   E             WORKSTN                                                               241230               
0001.03 C                   DOW       *IN03 = '0'                                                           241230               
0001.04 C                   EXFMT     EMP                                                                   241230               
0001.05 C                   if        *IN03 = '1'                                                           241230               
0001.06 C                   leave                                                                           241230               
0001.07 C                   ENDIF                                                                           241230               
0001.08  *                                                                                                  241230               
0013.00 C     ENO           CHAIN     EMPF                                                                  241230               
0014.00 C                   IF        %FOUND(EMPF)                                                          241230               
0015.00 C                   EVAL      ENAME = NAME                                                          241229               
0016.00 C                   EVAL      EMPCITY = CITY                                                        241229               
0017.00 C                   EVAL      GENDER = GR                                                           241229               
0018.00 C                   UPDATE    EMPREC                                                                241230               
0018.01 C                   EVAL      msg = 'Updation Done'                                                 241230               
0020.00 C                   ELSE                                                                            241230               
0021.00 C                   EVAL      EMPNO = ENO                                                           241230               
0022.00 C                   EVAL      ENAME = NAME                                                          241230               
0023.00 C                   EVAL      EMPCITY = CITY                                                        241230               
0024.00 C                   EVAL      GENDER = GR                                                           241230              
0025.00 C                   WRITE     EMPREC                                                                241230              
0025.01 C                   EVAL      msg = 'Writing Done'                                                  241230              
0027.00 C                   ENDIF                                                                           241230              
0027.01 C                   ENDDO                                                                           241230              
0028.00 C                   EVAL      *INLR = '1'                                                           241229              
