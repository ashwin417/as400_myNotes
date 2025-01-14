Report Layout Utility (RLU) is a tool in the IBM iSeries (AS400) environment used to create and edit printer files, known as report files. Here's a brief overview:

Report Layout Utility (RLU)
Purpose: RLU is designed to help users create and modify the layout of printed reports. It allows for the definition of record formats, fields, and various attributes required for report printing.

Key Features:

Interactive Design: RLU provides an interactive interface where users can define the layout of report fields.

Field Definition: Users can define fields, specify attributes, and assign values for printer files.

Record Formats: It allows for the creation of multiple record formats within a single printer file.

Keywords: Supports various keywords such as OFLIND (overflow indicator), SPACEB (space before), SPACEA (space after), SKIPA (skip before), and SKIPB (skip after).

Viewing: Users can view the layout of the report as it will appear when printed.


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
    - Type VR on the line numbers for a variable field.
    - Press F11 to define fields for the variable file.

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


