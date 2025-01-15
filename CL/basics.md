
### RPG IOs and CL Programming in AS400

**RPG IOs (Read, Chain, Setll, etc.)**  
These are native RPG input/output operations used for database access and processing. CL programming often needs to combine with these RPG IOs to perform various tasks. The system creates a temporary object for each user's work and stores it in QTEMP for use.

### CL Programming vs. RPGLE

| **Task**            | **RPGLE**                      | **CL**                                    |
|---------------------|--------------------------------|-------------------------------------------|
| **Start of Program**|                                | PGM                                       |
| **File Declaration**| F Spec                         | DCLF                                      |
| **Variable Def.**   | D Spec VAR A, B, C             | DCL VAR(&a) TYPE(*DEC) LEN(10 0)          |
| **Operations**      | C-Spec command EVAL            | CHGVAR                                    |
| **End of Program**  | *INLR='1' OR RETURN            | ENDPGM                                    |
| **Parameters**      | PLIST                          | ACCEPT IN PGM COMMAND                     |
| **Error Handling**  | MONITOR OR %ERROR              | MONMSG                                    |
| **Concat String**   | EVAL STR= A+B                  | CHGVAR &STR VALUE(STR_A *CAT STR_B)       |
| **Concat String**   | EVAL STR= A+B                  | CAN ALSO USE *CAT, *TCAT, *BCAT           |

**String Concatenation in CL:**
- **`*CAT`** or `||`: Joins two strings as is.
- **`*TCAT`** or `|<`: Joins two strings, trimming the first string.
- **`*BCAT`** or `|>`: Joins two strings with a single blank space between.

### Source File and Messaging in CL

- **Source File**: `QCLSRC`
- **File Type**: `CLP`
- **Send Message to Display in DSPMSG**
- **Send Break Message to Screen**:
  ```plaintext
  SNDBRKMSG MSG(&C) TOMSGQ(*ALLWS) => Sends message to all users in the workstation.
  ```

### Conditional Statements in CL
There is no `ENDIF` for `IF` conditional statements in CL.

### Automatic Conversion in CL
- CL automatically converts data types (e.g., decimal to char) unlike RPGLE, which requires `%CHAR()`.
- While concatenating, only 2 strings can be combined.

### Multiple Statements in `IF` Conditions
Use `DO` blocks for multiple statements:
```plaintext
IF <CONDITION> THEN(DO)
  STATEMENT1
  STATEMENT2
  ...
ENDDO
```

### Debugging in CL
- Use `*SRCDBG` instead of `*SOURCE` in source listing options.
- For `STRDBG`, CL belongs to OPM (Original Program Model), so turn it to `*YES`.

### Using GOTO Label
Every line has a label. Use the GOTO command to jump to a label:
```plaintext
GOTO CMDLBL(<LABEL_NAME>)
```

### File Operations in CL

- **Declaring File**: `DCLF`
- **File Identifier for Prefix**: Required when there is more than one file. Example: `I_ITEMNO`, `E_EMPNAME`.
- **Read Records**: Use `RCVF` (similar to `READ` in RPGLE) for sequential reading.

### Loops in CL
1. **DOWHILE**
2. **DOUNTILL**
3. **DOFOR**

Use the `GOTO` command to control loop flow. For example, use `MONMSG CPF0864` for end-of-file error handling and `ITERATE` to go to the start of the loop.

### Other Useful Commands
- **Clear Message Queue**:
  ```plaintext
  CLRMSGQ MSGQ(WING06)
  ```
- **Work with Object Locks**:
  ```plaintext
  WRKOBJLCK OBJ(WING06) OBJTYPE(*MSGQ)
  ```


