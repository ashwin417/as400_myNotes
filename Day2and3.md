
## Day 2 - 24 Dec 2024

### Creating a Library and Source Physical File

- Create a library:
  ```plaintext
  CRTLIB ashlib
  ```
  - To check if the library exists:
  ```plaintext
  WRKOBJ ashlib
  ```

- Create a source physical file:
  ```plaintext
  CRTSRCPF FILE(ashlib/qddssrc)
  ```

- Work with members in the source physical file:
  ```plaintext
  WRKMBRPDM FILE(ashlib/qddssrc)
  ```

- Create a member.

**Note**: Numbers need to be left-justified. To do this, click insert and then space. To use F keys higher than 12, use shift + the incremented value (e.g., for F14, click shift + 2; for F20, click shift + 8).

### Levels in Logical File

- File level
- Record level - `R`
- Field level - needs `PFILE()`
- Key level - `K`
- Select/Omit level - `S` or `O`

### Handling Errors

- **Logical file error due to library default**: Use the `CHGCURLIB` command to set your library as the current library, then compile.
  ```plaintext
  CHGCURLIB LIB(ashlib)
  ```

- **Debugging Errors**:
  - Check all spool files created by an interactive job:
  ```plaintext
  WRKSPLF
  ```
  - Select assistance level or F21, and change it to 2 intermediate.
  - Give 5 in opt to display and then give B in control to get to the bottom of the file as the error will be present at the end of the file.
  
- **Delete spool file**:
  ```plaintext
  DLTSPLF *SELECT
  ```

### File and Object Commands

- Display file field description:
  ```plaintext
  DSPFFD
  ```

- Display file description:
  ```plaintext
  DSPFD
  ```

- Display all files starting with `emplf` objects:
  ```plaintext
  WRKOBJ emplf*
  ```

- Display all dependent files (especially logical file objects):
  ```plaintext
  DSPDBR FILE(ashlib/<FILE>)
  ```

- Delete objects (object type will be *FILE):
  ```plaintext
  DLTOBJ OBJ(ashlib/<FILE>) OBJTYPE(*FILE)
  ```

## Day 3 - 26 Dec 2024

### Operators and Keywords

- **Operators**:
  - COMP EQ/GT
  - CMP
  - VALUES
  - LIST

  Give this when using S/O type to compare and select the fields in the function field. For example:
  ```plaintext
  CMP(EQ 'HYD')
  ```

  With dynamic select, it happens at run time. It happens after the system runs and identifies all.

### Lowercase Values

- To allow lowercase values, go to edit change source settings "Change session defaults" or F13. Then change uppercase input only to `N`.

### Joining Fields

- For joins, if you need to take a common field into the output, use `JREF()` and mention from which file to show. For example, `JREF(1)` if you need to refer to the first file.

### Data Types in DDS

- **A**: Character
- **P**: Packed Decimal (default: 2 digits occupy 1 byte) 5 or 6 bytes
- **S**: Zoned Decimal (1 digit occupies 1 byte) 10 bytes
- **L**: Date
- **T**: Time
- **Z**: Timestamp

### Keywords / Functions

- **File Level**: `UNIQUE`, `FIFO`, `LIFO`, `FCFO`, `DYNSLT`, `JDFVAL`
- **Record Level**: `PFILE`, `JFILE`, `TEXT`
- **Field Level**: `JREF` (Join if), `COLHDG` (Column heading), `VALUES`/`CMP`
- **Key Level**: `ABSVAL` (Absolute value), `ALIAS`, `DESCEND`

### SQL

- Can be done using `STRSQL`, but it's preferable to create files in `QSQLSRC` for future alterations.
  - Create source file `QSQLSRC`.
  - Create a source member for SQL type.

**Note**: SQL cannot be compiled using option 14 here. To execute SQL, use the command `RUNSQLSTM`, go for prompt `F4` give commitment control as none.


- **NOT NULL WITH DEFAULT** is added because when inserting data only to specific columns and others are left empty, SQL will assign default values like 0 for int, space for text instead of NULL, which causes problems with RPG programming.

- **Updating the Table**: You have to delete the table if you want to update the table structure. Create table can only be done once.
```plaintext
DROP TABLE <TABLE>
```


