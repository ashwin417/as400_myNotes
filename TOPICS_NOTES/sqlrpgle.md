
## SQLRPGLE Concepts

### Fixed Format
Every SQL query should be executed between `C/EXEC-SQL` and `C/END-EXEC`. Each query should start with `C+`.
```
C/EXEC-SQL
C+ UPDATE EMPF SET EMPCITY = ' '
C/END-EXEC
```

### Free Format
```sql
EXEC SQL 
  UPDATE EMPF SET EMPCITY = ' ';
```

### Host Variables
A host variable is needed to send a parameter to the table from RPGLE using `:`. 
A host variable is an RPGLE variable which sends values to SQL.

### SQL Error Check Using SQLCODE
- `SQLCODE = 0`: Entry successful
- `> 0`: Entry successful but there are warnings
- `< 0`: Entry got into error
- `= 100`: EOF or no record found

You can add this along with SQL code in an `IF` condition in RPGLE.

## Cursors
A temporary table created as a result of an SQL query, used in report programs.

To use `DOW` with a file, use `SQLCODE NOT EQ 100`.

### Reuse Deleted Record
Reuse of deleted records happens in a table (by default). In PF, it is default to none. It can be checked using `DSPFD`. It is related to RRN, and it inserts based on RRN.

### Without Mentioning Activation Group
If not mentioning the activation group, the program will run directly under the QILE activation group.

### Dynamic Queries in RPGLE

#### Using Immediate
```sql
EXEC SQL                         
  EXECUTE IMMEDIATE :SQLSTRING; 
```

#### Using Prepare SQL Statement
```sql
EXEC SQL                         
  PREPARE ST1 FROM :SQLSTRING;  
EXEC SQL                         
  EXECUTE ST1;                  
```

### Example Query
```sql
UPDATE EMPF_D SET ENAME = (                                
  SELECT B.ENAME 
  FROM EMPHRPF B 
  WHERE EMPF_D.EMPNO = B.EMPNO 
)
WHERE EXISTS                                                
  (SELECT 1 
   FROM EMPHRPF B 
   WHERE EMPF_D.EMPNO = B.EMPNO)
```

### Override Scope in OVRDBF
The `Override with Database File (OVRDBF)` command is used to:
1. Override (replace) the file named in the program.
2. Override certain parameters of a file that are used by the program.
3. Override the file named in the program and override certain parameters of the file being processed.

### RTNCURLOC
It returns the position of the cursor to the application program.
```sql
RTNCURLOC(*RECNAME, *fld, *pos)
```
This is used to order content in a subfile according to the heading using the `ORDER BY` condition.

### Cursor Scroll
Usage of `PRIOR`, `LAST`, `FIRST`.
A scrollable cursor is a cursor that can be moved in both directions (forward/backward).

When the cursor is opened, it is placed at the first row. We can specify positions based on different orientations of the `FETCH` statement.
- Before: Before the first row
- First: On the first row
- Last: On the last row
- After: After the last row
- Absolute: On an absolute row from the first row forward or last row backward

### Dynamic Query
Dynamic queries are required only when we don't know which is the fixed query. Use host variables when only values are changing. If queries or filters are changing, use dynamic queries.

### Program Status Data Structure
Program Status Data Structure will have error details:
```sql
GET DIAGNOSTICS CONDITION
```
| Keyword              | Description                                                   |
|----------------------|---------------------------------------------------------------|
| DB2_MESSAGE_ID       | Message ID for the error in `MESSAGE_TEXT`                    |
| DB2_MESSAGE_ID1      | Underlying escape CPF message that originally caused this error|
| DB2_MESSAGE_ID2      | Underlying diagnostic CPD message that originally caused this error|
| DB2_RETURNED_SQLCODE | SQL code (SQLCOD)                                             |
| MESSAGE_LENGTH       | Length of the message in `MESSAGE_TEXT`                       |
| MESSAGE_TEXT         | Message text for the error                                    |
| RETURNED_SQLSTATE    | SQL state (SQLSTATE)                                          |

