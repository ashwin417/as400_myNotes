```markdown
# RPGLE Programming Guide

## Day 4 - 27 Dec 2024

### SQL and Record Format
- Adding record format in SQL: While creating a table, add `rcdfmt <name>` at the end.
  - It is not a technical requirement for SQL but can be used for RPG opcodes.
  - Equivalent to R type entry in DDS.
- Data Types: CLOB, GLOB, BLOB are used for larger data sizes.
- Handling NULL values: Use `ifnull(fieldname, value_in_case_of_null)` in SQL queries.

### RPG Programming
- **Report Program Generator (RPG)**
  - Present version: RPGLE (RPG IV or RPG400)
  - Source type: RPGLE
  - Source physical file: QRPGLSRC

#### RPGLE Specifications
- **H - Control Specifications**: Controls the way the program is created and behaves (e.g., `DATFMT(*MDY)`).
- **F - File Specifications**: All file declarations.
- **D - Definition Specifications**: Variable declarations, including procedures and data structures.
- **C - Calculation Specifications**: All operations such as reading and writing records.
- **P - Procedure Specifications**: Deals with procedures of different languages (RPG ILE).
- **O - Output Specifications**: Output settings.

### Comments
- Use `*` to comment in RPGLE.

### Ending the Program
- Use the `RETURN` opcode to end the program.
- Use `EVAL *INLR = '1'` to set the last record indicator. `IN` is standard for indicators.

### Compilation and Execution
- Compile using option 14 (`CRTBNDCL`).
- Execute using `CALL <filename>`.

### Data Type Conversions
- **Decimal to Char**: `%char()`
- **Char to Decimal**: `%DEC(VAR:5:2)`
- **Date**: `%DATE(VAR_NAME)`

### Operators and Functions
- **Not equal to**: `<>`
- **Trim spaces**: `%trim()`

### Alternative to IF-ELSE: `SELECT` statement
```rpg
Select
    When condt1
        execute
    When condt2
        execute
    OTHERS
        execute
Endsl
```
- Use this only when you want to satisfy only one condition.

### Input a Number through CL
```plaintext
CALL PGM(ASHLIB/CALC4) PARM(('+') (5 (*DEC 10 0)) (4 (*DEC 10 0)))
OR
CALL PGM(ASHLIB/CALC3) PARM(('-') (X'00000000005F') (X'00000000004F'))
```
- Ensure the length is 10. `F` indicates signed bits (ensure total bits are even).

### System Values
- **Date**: `DSPSYSVAL QDATE`
- **Time**: `DSPSYSVAL QTIME`

## Day 5 - 28 Dec 2024

### Working with Files
- **F Specification**: Use F and prompt F4, enter file name, and select file types.
  - **File Types**: 
    - `I` - Input
    - `O` - Output
    - `C` - Combined (screens)
    - `U` - Update

- For database operations, use `I` (Input) and `U` (Update).

### File Designation
- **Designation**: `F` - based on procedures in the program.
- **File Format**: `E` - indicates externally described.
- **Record Address Type**: `K` - sequence of Key. Blank for order of arrival.
- **Device**: 
  - Disk for database files.
  - Workstation (`WORKSTN`) for screens.
  - Printer for reports.

### Reading Records
- Use `read` operation code with the file name in factor 2.

### Loops
- **For**: Use with indexes like arrays.
- **Do While (DOW)**: Use for positive conditions in file processing.
- **Do Until (DOU)**: Use for negative conditions in file processing.

### Pointer Operations
- **SETLL**: Set lower limit (to set pointer).
  - If a match is found, it points to that match; otherwise, it moves to the next available item.
- **SETGT**: Set greater limit (always points to the next greater item).

### Reverse Reading
- Use `readp` (read previous).

### Special Values
- **Set Lower Limit**: `*loval`
- **Set Greater Limit**: `*hival`

### Reading Equals
- **READE**: Read equal, reads the next record with the same key value.

```

A detailed differentiation table for `READ`, `READE`, `READP`, and `READPE` operations in RPGLE:

| Operation | Description                                           | Usage Example          | Key Considerations  |
|-----------|-------------------------------------------------------|------------------------|---------------------|
| **READ**  | Reads the next record in the file sequentially        | `READ MYFILE`          | - Sequential reading - Ignores key structure |
| **READE** | Reads the next record with the same key value         | `READE key MYFILE`     | - Reads matching key records sequentially - Use `SETLL` to position |
| **READP** | Reads the previous record in the file sequentially    | `READP MYFILE`         | - Reverse sequential reading - Ignores key structure |
| **READPE**| Reads the previous record with the same key value     | `READPE key MYFILE`    | - Reads matching key records in reverse - Use `SETGT` to position |

### Detailed Explanation

#### 1. **READ**
- **Purpose**: Reads the next record in the file sequentially.
- **Usage**: Ideal for processing files from start to end, regardless of the key values.
- **Example**:
  ```rpg
  C     READ      MYFILE
  ```

#### 2. **READE**
- **Purpose**: Reads the next record with the same key value as the previous record read.
- **Usage**: Used when processing groups of records with the same key value sequentially.
- **Example**:
  ```rpg
  C     keyValue  SETLL     MYFILE
  C     keyValue  READE     MYFILE
  C     DOW       NOT %EOF(MYFILE)
  C       // Process record
  C       keyValue  READE     MYFILE
  C     ENDDO
  ```

#### 3. **READP**
- **Purpose**: Reads the previous record in the file sequentially.
- **Usage**: Suitable for reverse-order processing without considering key values.
- **Example**:
  ```rpg
  C     READP     MYFILE
  ```

#### 4. **READPE**
- **Purpose**: Reads the previous record with the same key value as the previous record read.
- **Usage**: Used when processing groups of records with the same key value in reverse order.
- **Example**:
  ```rpg
  C     keyValue  SETGT     MYFILE
  C     keyValue  READPE    MYFILE
  C     DOW       NOT %EOF(MYFILE)
  C       // Process record
  C       keyValue  READPE    MYFILE
  C     ENDDO
  ```

### Key Considerations
- **READ** and **READP**: Operate sequentially without considering key structure. They are straightforward for traversing a file in order or reverse order.
- **READE** and **READPE**: Operate based on key values. They are ideal for processing records with the same key either sequentially or in reverse. They require proper positioning using `SETLL` or `SETGT`.

