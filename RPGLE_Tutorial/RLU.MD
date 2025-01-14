**Report Layout Utility (RLU)** is a tool in the IBM iSeries (AS400) environment used to create and edit printer files, known as report files. Here's a brief overview:

### Report Layout Utility (RLU)

- **Purpose**: RLU is designed to help users create and modify the layout of printed reports. It allows for the definition of record formats, fields, and various attributes required for report printing.
  
- **Key Features**:
  - **Interactive Design**: RLU provides an interactive interface where users can define the layout of report fields.
  - **Field Definition**: Users can define fields, specify attributes, and assign values for printer files.
  - **Record Formats**: It allows for the creation of multiple record formats within a single printer file.
  - **Keywords**: Supports various keywords such as `OFLIND` (overflow indicator), `SPACEB` (space before), `SPACEA` (space after), `SKIPA` (skip before), and `SKIPB` (skip after).
  - **Viewing**: Users can view the layout of the report as it will appear when printed.

### Steps in RLU
1. **Start RLU**: Use the `STRRLU` command to start the RLU for a specific source file.
2. **Define Records**: Use `DR` to define records and `VF` to define variable fields.
3. **Set Attributes**: Set attributes such as type (`*File`) and `PRTF` for printer files.
4. **Add Keywords**: Use various keywords like `OFLIND`, `SPACEB`, `SPACEA`, `SKIPA`, and `SKIPB` to control the layout and formatting.


### Command `STRRLU`
- **Command**: `STRRLU` (Start Report Layout Utility)
- **Source File**: `QDDSSRC`
- **Library**: (user-defined)
- **File Name**: (user-defined)
- **Attributes**: Default

To define a record:
1. Type `DR` on the line numbers.
2. Press `F11` to define fields.
3. Set type to `*File` and attribute to `PRTF`.
4. To add a Variable File (VF), follow similar steps:
    - Type VF on the line numbers for a variable field.
    - Press F11 to define fields for the variable file.

DR = To define this report line as a record format

DRn = To define this report line and the next n lines as a single record format

DRR = To define every line between and including this line and the next occurrence of DRR as a single record format

### Relevant Keywords
- **OFLIND()**: Overflow Indicator - switches on when the page is completed.
- **SPACEB()**: Space Before - adds blank lines before printing.
- **SPACEA()**: Space After - adds blank lines after printing.
- **SKIPA()**: Skip Before - skips to the next line.
- **SKIPB()**: Skip After - skips lines after printing.

### Sample RPGLE Program

```rpg
FEMPLOYEE  IF   E           K DISK                            
FSLRYREPORTO    E             PRINTER OFLIND(*IN99)           
 *                                                            
C                   EVAL      COUNTREC = 0                    
C                   EVAL      DATE = %DATE()                  
C                   WRITE     HEADER                          
C                   WRITE     HEADING                         
C     *LOVAL        SETLL     EMPLOYEE                        
C                   READ      EMPLOYEE                        
C                   DOW       NOT %EOF()                      
C                   IF        *IN99 = '1'                     
C                   WRITE     BLANK                           
C                   WRITE     HEADER                          
C                   WRITE     HEADING                         
C                   WRITE     BLANK                           
C                   EVAL      *IN99 = '0'                     
C                   ENDIF                                     
C                   WRITE     DETAIL                          
C                   WRITE     BLANK                           
C                   WRITE     TOTAL            
C                   EVAL      *INLR = '1'      
```

### Program Explanation
- **Files**:
  - `EMPLOYEE`: Disk file.
  - `SLRYREPORT`: Printer file with overflow indicator `*IN99`.

- **Logic**:
  - Initialize variables: `COUNTREC` and `DATE`.
  - Write `HEADER` and `HEADING`.
  - Set lower limit and read `EMPLOYEE` records.
  - Loop until end of file:
    - Check overflow indicator: If `*IN99` is on, write `BLANK`, `HEADER`, `HEADING`, and reset `*IN99`.
    - Write `DETAIL`, `BLANK`, and `TOTAL`.
    - End the program with `*INLR = '1'`.


## Creating a Report Using O-Spec in RPGLE

To create a report using Output Specifications (O-Spec) in RPGLE, follow these steps:

1. **Define the Printer File**:
   - Use the O specification to define the printer file.
   - Specify the file type, device, and keywords.
   - Set the file format to `F` and specify the record length (maximum length possible depends on the system and the type of data being printed).

2. **Declare Records Using EXCEPT**:
   - Use the `EXCEPT` statement to declare the records as exceptions.
   - This is used for writing into program-described files.
   ```rpg
   C           EXCEPT    HEADER
   ```

3. **Complete C Specifications**:
   - Define the necessary logic in the C specifications.

4. **Define O-Specifications**:
   - Define the file name with the O-Spec tag.
   - Set the type to `E` (exception) and specify the `EXCEPTNAME` as needed.
   ```rpg
   OOSPECRPT  E     HEADER
   ```

5. **Add Constants and Fields**:
   - Define constants and specify their end positions.
   - Define fields to get data and specify their end positions and formats.
   ```rpg
   O         EMPLOYEE REPORT                    25
   O         PAGE                               +2 S
   ```

6. **Define Next Record**:
   - Follow the same steps to define additional records with O-Spec and E-Spec, setting the type and heading.

7. **Create and Compile the Printer File**:
   - Use the `CRTPRTF` command to create the printer file.
   - Compile the RPGLE program. You need to manually create the printer file before compiling.

### Sample Program

```rpg
FEMPRPT5   O    F  100        PRINTER OFLIND(*IN91)                      
FEMPF      IF   E           K DISK                                       
 *                                                                       
C                   EXCEPT    HEADER                                     
C                   EXCEPT    HEADING                                    
C                   READ      EMPF                                       
C                   DOW       NOT %EOF()                                 
C                   IF        *IN91 = '1'                                
C                   EXCEPT    HEADER                                     
C                   EXCEPT    HEADING                                    
C                   ENDIF                                                
C                   EXCEPT    DETAIL                                     
C                   READ      EMPF                                       
C                   ENDDO                                                
C                   EVAL      *INLR = '1'                                
 *                                                                       
OEMPRPT5   E            HEADER                                           
O                                           50 'EMPLOYEE REPORT'         
O                                           75 'PAGE NO:'                
O                       PAGE                85S                            
O          E            HEADING     3                                      
O                                           30 'EMPLOYEE NAME'             
O                                           +2 'CITY'                      
O          E            DETAIL                                             
O                       ENAME               30                             
O                       EMPCITY             +2                             
O          E            END                                                
****************** End of data ********************************************
```

### Explanation of Keywords

- **OFLIND()**: Overflow indicator that switches on when the page is completed.
- **SPACEB()**: Space before - adds blank lines before printing.
- **SPACEA()**: Space after - adds blank lines after printing.
- **SKIPA()**: Skip before - skips to the next line.
- **SKIPB()**: Skip after - skips lines after printing.



