
```markdown
# RPGLE Notes

## Day 6 - 30th Dec 2024

### Program to give total number of employees from each city
- Use `setLL` with a variable to hold the city name, incrementing the count as the loop proceeds, and display the count when a new city is encountered.
- Example of case-insensitive city comparison:
  ```rpg
  %XLATE('abcdefghijklmnopqrstuvwxyz': 'ABCDEFGHIJKLMNOPQRSTUVWXYZ': prevc)
  ```

### Debugging
1. Take option 14 and press F4.
2. Then press F10.
3. In compiler options, use `*NODEBUGIO`.
4. Page down and set debugging views to `*SOURCE`.
5. Compile the program.
6. Run the `strdbg` command.
7. In "Update production files," select "Yes."

### Using `CHAIN`
- `CHAIN` is used to search a record in a file with unique keys.
- It functions as a combination of `SETLL` and `READE`.

### Program to accept empno as input and display empname using `CHAIN`
```rpg
*************** Beginning of data ***************************************************************************************
0001.00 FEMPLF      UF   E           K DISK                                                    
0002.00 Dmsg              S             50                                                    
0003.00 Dempno            S             10  0                                                 
0004.00  *                                                                                     
0005.00 C     *ENTRY        PLIST                                                             
0006.00 C                   PARM                    empno                                     
0007.00 C                   CHAIN     EMPNO EMPLF                                             
0008.00 C                   IF        %FOUND(EMPLF)                                           
0009.00 C                   EVAL      msg = ENAME                                             
0010.00 C                   ELSE                                                              
00111.00 C                  EVAL      msg = 'Entry not found'                                 
0012.00 C                   ENDIF                                                             
0013.00 C                   DSPLY     msg                                                     
0014.00 C                   EVAL      *INLR = '1'                                             
        ****************** End of data **********************************************************************************
```

### Screen Design using SEU
- **SEU**: Used to design screens.
- Command to create screen: `STRSDA`
- Use `CA03` to indicate F3.

### File Type for Screen
- For screens, the file type should be `C` and `WORKSTN`.
- To read from the screen, use `EXFMT` and provide the record format name.

### Changing Decimal Types
- Use `?` to change decimal types in the screen definition.

### Example of a Screen Handling Program with Add/Update
```rpg
*************** Beginning of data ***************************************************************************************
0001.00 FEMPF      UF   E           K DISK             
0002.00 FEMPLOY    CF   E             WORKSTN          
0003.00 Dmsg              S             50                             
0004.00 DEMPINFO          DS                                 
0005.00 D  ENO                    10I 0                       
0006.00 D  NAME                   10A                        
0007.00 D  CITY                   10A                        
0008.00 D  GR                     2A                         
0009.00  *                                             
0010.00 C                   DOW       *IN03 = '0'      
00111.00 C                  EXFMT     EMP              
0012.00 C                   if        *IN03 = '1'      
0013.00 C                   leave                      
0014.00 C                   Endif                      
0015.00 C                   CHAIN     ENO EMPLF
0016.00 C                   if        %FOUND(EMPLF)                  
0017.00 C                   EVAL      ENAME = NAME     
0018.00 C                   EVAL      EMPCITY = CITY   
0019.00 C                   EVAL      GENDER = GR      
0020.00 C                   UPDATE    EMPREC           
0021.00 C                   EVAL      msg = 'UPDATED'  
0022.00 C                   else
0023.00 C                   EVAL      EMPNO = ENO      
0024.00 C                   EVAL      ENAME = NAME     
0025.00 C                   EVAL      EMPCITY = CITY   
0026.00 C                   EVAL      GENDER = GR      
0027.00 C                   WRITE     EMPREC           
0028.00 C                   EVAL      msg = 'WRITTEN'  
0029.00 C                   endif
0030.00 C                   DSPLY     msg       
0031.00 C                   ENDDO                      
0032.00 C                   EVAL      *INLR = '1'     
        ****************** End of data **********************************************************************************
```
