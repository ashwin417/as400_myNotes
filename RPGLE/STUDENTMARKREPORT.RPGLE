------------------------------------------------------PROGRAM FOR SCREEN------------------------------------------------------------------

 Columns . . . :    6 100                                      Browse                                              ASHLIB/QRPGLESRC 
 SEU==>                                                                                                                   STUDRPGLE 
 FMT *   *. 1 ...+... 2 ...+... 3 ...+... 4 ...+... 5 ...+... 6 ...+... 7 ...+... 8 ...+... 9 ...+... 0                             
        *************** Beginning of data ***************************************************************************************   
0000.01  **** STATUS : WORKING AND PARTIALLY COMPLETED (NEED TO ADD PERCENTAGE AND TOTAL MARKS EVAL)        250109                  
0001.00 FSTUDENTSUBCF   E             workstn SFILE(STUDNTSFL:RRN)                                          250108                  
0002.00 FIDX_ROLLNOIF   E           K DISK                                                                  250109                  
0002.01 DRRN              S              4  0                                                               250108                  
0002.02 DSUMS             S             10  0                                                               250109                  
0002.03 DSUMT             S             10  0                                                               250109                  
0002.05  *DSP               S             10  2                                                             250109                  
0003.00  *                                                                                                  250108                  
0004.00 C                   DOW       *IN03='0'                                                             250108                  
0004.01 C                   EXSR      CLRSFL                                                                250108                  
0004.02 C                   EXSR      LOADSFL                                                               250108                  
0004.03 C                   EXSR      DSPSFL                                                                250108                  
0004.04 C                   EXSR      PROCESSSFL                                                            250108                  
0005.00 C                   ENDDO                                                                           250108                  
0006.00 C                   EVAL      *INLR = '1'                                                           250108                  
0007.00  *------------------------------------------------                                                  250108                  
0008.00 C     CLRSFL        BEGSR                                                                           250108                  
0009.00 C                   EVAL      *IN93 = '1'                                                           250108                  
0010.00 C                   WRITE     STUDNTCTRL                                                            250108                                     
0011.00 C                   EVAL      *IN93 = '0'                                                           250108                  
0012.00 C                   ENDSR                                                                           250108                  
0013.00  *-------------------------------------------------                                                 250108                  
0014.00 C     LOADSFL       BEGSR                                                                           250108                  
0014.01 C                   EVAL      RRN = 0                                                               250108                  
0014.02 C                   EVAL      SUMT= 0                                                               250109                  
0014.03 C                   EVAL      SUMS= 0                                                               250109                  
0015.00 C     sid           SETLL     IDX_ROLLNO                                                            250109                  
0015.01 C     SID           READE     IDX_ROLLNO                                                            250109                  
0017.00 C                   DOW       NOT %EOF()                                                            250108                  
0017.02 C                   IF        ROLLNO = SID                                                          250109                  
0017.03 C                   EVAL      RRN = RRN + 1                                                         250108                  
0017.04 C                   EVAL      TOTAL = TOTAL00001                                                    250109                  
0017.06 C                   EVAL      MARKS = MARKS00001                                                    250109                  
0017.07 C                   EVAL      SUMS = SUMS + MARKS                                                   250109                  
0017.08 C                   EVAL      SUMT = SUMT + TOTAL                                                   250109                  
0018.00 C                   WRITE     STUDNTSFL                                                             250108                  
0018.01 C                   ENDIF                                                                           250109                  
0018.02 C                   EVAL      SUM = SUMS                                                            250109                  
0018.03 C                   EVAL      PERCENTAGE = (SUMS*100)/SUMT                                          250109                             
0019.00 C     SID           READE     IDX_ROLLNO                                                            250109                  
0020.00 C                   ENDDO                                                                           250108                  
0021.00 C                   ENDSR                                                                           250108                  
0022.00  *------------------------------------------                                                        250108                  
0023.00 C     DSPSFL        BEGSR                                                                           250108                  
0024.00 C                   WRITE     FOOTER                                                                250108                  
0025.00 C                   EVAL      *IN92 = '1'                                                           250108                  
0025.01 C                   IF        RRN > 0                                                               250108                  
0026.00 C                   EVAL      *IN91 = '1'                                                           250108                  
0027.00 C                   EVAL      *IN94 = '1'                                                           250108                  
0028.00 C                   ENDIF                                                                           250108                  
0029.00 C                   EXFMT     STUDNTCTRL                                                            250108                  
0030.00 C                   EVAL      *IN91 = '0'                                                           250108                  
0031.00 C                   EVAL      *IN94 = '0'                                                           250108                  
0032.00 C                   EVAL      *IN92 = '0'                                                           250108                  
0033.00 C                   ENDSR                                                                           250108                  
0034.00  *-----------------------------------------                                                         250108                  
0035.00 C     PROCESSSFL    BEGSR                                                                           250108                  
0036.00 C                   IF        *IN03 = '1'                                                           250108                  
0037.00 C                   LEAVESR                                                                         250108                            
0038.00 C                   ENDIF                                                                           250108                  
0039.00 C                   IF        RRN = 0                                                               250108                  
0040.00 C                   LEAVESR                                                                         250108                  
0041.00 C                   ENDIF                                                                           250108                  
0044.00 C                   IF        *IN07 = '1'                                                           250108                  
0044.01 C                   CALL      'STDNTRLU'                                                            250109                  
0044.02 C                   PARM                    SID                                                     250109                  
0045.00 C                   ENDIF                                                                           250108                  
0046.00 C                   ENDSR                                                                           250108                  
        ****************** End of data ******************************************************************************************   
                                                                                                                                                                                                                                                                       
																																																																	   
																																																																	   
------------------------------------------------------PROGRAM FOR REPORT------------------------------------------------------------------

 Columns . . . :    6 100                                      Browse                                              ASHLIB/QRPGLESRC 
 SEU==>                                                                                                                    STDNTRLU 
 FMT *   *. 1 ...+... 2 ...+... 3 ...+... 4 ...+... 5 ...+... 6 ...+... 7 ...+... 8 ...+... 9 ...+... 0                             
        *************** Beginning of data ***************************************************************************************   
0001.00  ****REPORT FOR STUDENTPF****                                                                       250108                  
0002.00 FSTDNTRPT  O    E             PRINTER OFLIND(*IN99)                                                 250109                  
0002.01 FIDX_ROLLNOIF   E           K DISK                                                                  250109                  
0003.00  *                                                                                                  250109                  
0003.01 DNID              S             10  0                                                               250109                  
0003.02 C     *ENTRY        PLIST                                                                           250109                  
0003.03 C                   PARM                    NID                                                     250109                  
0004.00 C                   EVAL      DATE=%DATE()                                                          250109                  
0005.00 C                   WRITE     HEADER                                                                250109                  
0006.00 C                   WRITE     HEADINGID                                                             250109                  
0007.00 C                   READ      IDX_ROLLNO                                                            250109                  
0009.00 C     NID           SETLL     IDX_ROLLNO                                                            250109                  
0010.00 C     NID           READE     IDX_ROLLNO                                                            250109                  
0010.01 C                   DOW       NOT %EOF()                                                            250109                  
0011.00 C                   IF        NID = ROLLNO                                                          250109                  
0015.00 C                   WRITE     DETAILS                                                               250109                  
0015.01 C                   ENDIF                                                                           250109                  
0016.00 C     NID           READE     IDX_ROLLNO                                                            250109                  
0018.00 C                   ENDDO                                                                           250109                  
0019.00  *C                   EVAL      *INLR = '1'                                                         250109                  
0020.00 C                   RETURN                                                                          250109                  
        ****************** End of data ******************************************************************************************   
                                                                                                                                                                                        
