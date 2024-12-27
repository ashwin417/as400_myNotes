 Columns . . . :    6 100                                      Browse                                              ASHLIB/QRPGLESRC 
 SEU==>                                                                                                                  CALCULATOR 
 FMT D  DName+++++++++++ETDsFrom+++To/L+++IDc.Keywords+++++++++++++++++++++++++++++Comments++++++++++++                             
        *************** Beginning of data ***************************************************************************************   
0001.00 Dnum1             S             10  0                                                               241226                  
0002.00 Dnum2             S             10  0                                                               241226                  
0003.00 Dresult           S             10  0                                                               241227                  
0004.00 Doperator         S              1                                                                  241227                  
0005.00 C     *entry        plist                                                                           241227                  
0006.00 C                   parm                    operator                                                241227                  
0007.00  * Use conditional Statement                                                                        241227                  
0008.00 C                                                                                                   241227                  
0009.00 C                   EVAL      num1=10                                                               241226                  
0010.00 C                   EVAL      num2=20                                                               241226                  
0011.00  *                                                                                                  241227                  
0012.00 C                   if        operator = '+'                                                        241227                  
0013.00 C                   EVAL      result = num1 + num2                                                  241226                  
0014.00 C                   endif                                                                           241227                  
0015.00  *                                                                                                  241227                  
0016.00 C                   if        operator = '-'                                                        241227                  
0017.00 C                   EVAL      result = num1 - num2                                                  241227                  
0018.00 C                   endif                                                                           241227                  
0019.00  *                                                                                                  241227                  
0020.00 C                   if        operator = '*'                                                        241227                  
0021.00 C                   EVAL      result = num1 * num2                                                  241227                  
0022.00 C                   endif                                                                           241227                  
0023.00 C                   if        operator = '/'                                                        241227                  
0024.00 C                   EVAL      result = num1 / num2                                                  241227                  
0025.00 C                   endif                                                                           241227                  
0026.00 C     result        DSPLY                                                                           241226                  
0027.00  *                                                                                                  241226                  
0028.00 C                   EVAL      *INLR = '1'                                                           241226                  
        ****************** End of data ******************************************************************************************   
                                                                                                                                    
