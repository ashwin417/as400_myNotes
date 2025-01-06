```markdown
```rpg
0001.00 FORDSUBFILECF   E             WORKSTN SFILE(ordSFL:RRN)                                             250101
```
- Declares a subfile control format `ORDSUBFILECF` for a workstation file, with `ordSFL` as the subfile and `RRN` as the relative record number.

```rpg
0002.00 FORDPF_SCR UF A E           K DISK                                                                  250101
```
- Declares a file `FORDPF_SCR` as an update file (`UF`), keyed (`K`), and externally described (`E`), with access path `DISK`.

```rpg
0003.01 DRRN              S              4  0                                                               250101
```
- Defines a standalone field `DRRN` as a 4-digit numeric field with zero decimal places.

```rpg
0004.00 C                   DOW       *IN03='0'                                                             250101
```
- Begins a `DOW` (Do While) loop that continues as long as indicator `*IN03` is off (equal to '0').

```rpg
0004.01 C                   EVAL      RCD_NBR = 1                                                           250104
```
- Sets the value of `RCD_NBR` to 1.

```rpg
0005.00 C                   IF        *IN06='1'                                                             250101
```
- Checks if indicator `*IN06` is on (equal to '1').

```rpg
0006.00 C                   EXSR      CREATESR                                                              250101
```
- Executes the subroutine `CREATESR`.

```rpg
0007.00 C                   ENDIF                                                                           250101
```
- Ends the `IF` statement.

```rpg
0008.00 C                   EXSR      CLRSFL                                                                250101
```
- Executes the subroutine `CLRSFL`.

```rpg
0009.00 C                   EXSR      LOADSFL                                                               250101
```
- Executes the subroutine `LOADSFL`.

```rpg
0010.00 C                   EXSR      DSPLYSFL                                                              250101
```
- Executes the subroutine `DSPLYSFL`.

```rpg
0010.01 C                   EXSR      PROCSFL                                                               250102
```
- Executes the subroutine `PROCSFL`.

```rpg
0011.00 C                   ENDDO                                                                           250101
```
- Ends the `DOW` loop.

```rpg
0012.00 C                   EVAL      *INLR = '1'                                                           250101
```
- Sets the last record indicator `*INLR` to '1', indicating the end of the program.

```rpg
018.00 C     CLRSFL        BEGSR                                                                           250101
```
- Begins the subroutine `CLRSFL`.

```rpg
0019.00 C                   EVAL      *IN93 = '1'                                                           250101
```
- Sets indicator `*IN93` to '1'.

```rpg
0020.00 C                   WRITE     ORDCTL                                                                250101
```
- Writes the control record `ORDCTL`.

```rpg
0021.00 C                   EVAL      *IN93 = '0'                                                           250101
```
- Sets indicator `*IN93` to '0'.

```rpg
0022.00 C                   ENDSR                                                                           250101
```
- Ends the subroutine `CLRSFL`.

```rpg
025.00 C     LOADSFL       BEGSR                                                                           250101
```
- Begins the subroutine `LOADSFL`.

```rpg
0026.00 C                   EVAL      RRN = 0                                                               250101
```
- Sets the relative record number `RRN` to 0.

```rpg
0026.02 C     *LOVAL        SETLL     ORDPF_SCR                                                             250103
```
- Positions the file pointer at the beginning of the file `ORDPF_SCR`.

```rpg
0028.00 C                   READ      ORDPF_SCR                                                             250101
```
- Reads a record from the file `ORDPF_SCR`.

```rpg
0029.00 C                   DOW       NOT %EOF()                                                            250101
```
- Begins a `DOW` loop that continues as long as the end of file (`%EOF()`) is not reached.

```rpg
0029.01 C                   IF        ((ICUSTID = CUSTOMERID AND                                            250105
0029.02 C                             ICUSTID <> *BLANKS)   OR                                              250103
0029.03 C                             ICUSTID =  *BLANKS) AND                                               250105
0029.04 c                             (Icntry = COUNTRY OR                                                  250105
0029.05 c                             Icntry = *blanks)                                                     250105
```
- Checks if `ICUSTID` matches `CUSTOMERID` and is not blank, or if `ICUSTID` is blank, and if `Icntry` matches `COUNTRY` or is blank.

```rpg
0030.00 C                   EVAL      RRN = RRN + 1                                                         250103
```
- Increments the relative record number `RRN` by 1.

```rpg
0031.00 C                   WRITE     ORDSFL                                                                250101
```
- Writes a record to the subfile `ORDSFL`.

```rpg
0031.01 C                   ENDIF                                                                           250103
```
- Ends the `IF` statement.

```rpg
0031.02 C                   IF        POSORDNO = ORDERNO                                                    250104
```
- Checks if `POSORDNO` matches `ORDERNO`.

```rpg
0031.03 C                   EVAL      RCD_NBR = RRN                                                         250104
```
- Sets `RCD_NBR` to the current relative record number `RRN`.

```rpg
0031.04 C                   ENDIF                                                                           250104
```
- Ends the `IF` statement.

```rpg
0032.00 C                   READ      ORDPF_SCR                                                             250101
```
- Reads the next record from the file `ORDPF_SCR`.

```rpg
0032.04 C                   ENDDO                                                                           250103
```
- Ends the `DOW` loop.

```rpg
0034.00 C                   ENDSR                                                                           250101
```
- Ends the subroutine `LOADSFL`.

```rpg
0037.00 C     DSPLYSFL      BEGSR                                                                           250101
```
- Begins the subroutine `DSPLYSFL`.

```rpg
0037.01 C                   WRITE     FOOTER                                                                250101
```
- Writes the footer record `FOOTER`.

```rpg
0038.00 C                   EVAL      *IN92 = '1'                                                           250101
```
- Sets indicator `*IN92` to '1'.

```rpg
0039.00 C                   IF        RRN > 0                                                               250101
```
- Checks if the relative record number `RRN` is greater than 0.

```rpg
0039.01 C                   EVAL      *IN91 = '1'                                                           250101
```
- Sets indicator `*IN91` to '1'.

```rpg
0041.00 C                   EVAL      *IN94 = '1'                                                           250101
```
- Sets indicator `*IN94` to '1'.

```rpg
0042.00 C                   ENDIF                                                                           250101
```
- Ends the `IF` statement.

```rpg
0043.00 C                   EXFMT     ORDCTL                                                                250101
```
- Displays the format `ORDCTL` and waits for user input.

```rpg
0044.00 C                   EVAL      *IN91 = '0'                                                           250101
```
- Sets indicator `*IN91` to '0'.

```rpg
0045.00 C                   EVAL      *IN94 = '0'                                                           250101
```
- Sets indicator `*IN94` to '0'.

```rpg
0046.00 C                   EVAL      *IN92 = '0'                                                           250101
```
- Sets indicator `*IN92` to '0'.

```rpg
0047.00 C                   ENDSR                                                                           250101
```
- Ends the subroutine `DSPLYSFL`.

```rpg
048.00 C     CREATESR      BEGSR                                                                           250101
```
- Begins the subroutine `CREATESR`.

```rpg
0048.01 C                   DOW       *IN12= '0'                                                            250102
```
- Begins a `DOW` loop that continues as long as indicator `*IN12` is off (equal to '0').

```rpg
0048.02 C                   EXFMT     CREATESFL                                                             250102
```
- Displays the format `CREATESFL` and waits for user input.

```rpg
0048.03 C                   IF        *IN12 = '1'                                                           250102
```
Sure, let's continue from where we left off:

```markdown
```rpg
0048.03 C                   IF        *IN12 = '1'                                                           250102
```
- Checks if indicator `*IN12` is on (equal to '1').

```rpg
0048.04 C                   LEAVE                                                                           250102
```
- Exits the `DOW` loop if `*IN12` is on.

```rpg
0048.05 C                   ENDIF                                                                           250102
```
- Ends the `IF` statement.

```rpg
0048.06 C                   EVAL      ORDERNO = IORDERNO                                                    250103
```
- Assigns the value of `IORDERNO` to `ORDERNO`.

```rpg
0048.07 C                   EVAL      ITEM_NAME = IITEM_NAME                                                250102
```
- Assigns the value of `IITEM_NAME` to `ITEM_NAME`.

```rpg
0048.08 C                   EVAL      COUNTRY = ICOUNTRY                                                    250102
```
- Assigns the value of `ICOUNTRY` to `COUNTRY`.

```rpg
0048.09 C                   EVAL      CUSTOMERID = CUST_ID                                                  250102
```
- Assigns the value of `CUST_ID` to `CUSTOMERID`.

```rpg
0048.10 C                   EVAL      ORDERDATE = %DATE()                                                   250103
```
- Sets `ORDERDATE` to the current date.

```rpg
0048.11 C                   WRITE     ORDREC                                                                250102
```
- Writes a record to the file `ORDREC`.

```rpg
0048.12 C                   ENDDO                                                                           250102
```
- Ends the `DOW` loop.

```rpg
0048.13 C                   EVAL      *IN12 = '0'                                                           250102
```
- Sets indicator `*IN12` to '0'.

```rpg
0048.14 C                   ENDSR                                                                           250102
```
- Ends the subroutine `CREATESR`.

```rpg
052.00 C     PROCSFL       BEGSR                                                                           250102
```
- Begins the subroutine `PROCSFL`.

```rpg
0052.01 C                   IF        *IN03 = '1'                                                           250102
```
- Checks if indicator `*IN03` is on (equal to '1').

```rpg
0052.02 C                   LEAVESR                                                                         250102
```
- Exits the subroutine `PROCSFL` if `*IN03` is on.

```rpg
0052.03 C                   ENDIF                                                                           250102
```
- Ends the `IF` statement.

```rpg
0052.04 C                   IF        RRN = 0                                                               250102
```
- Checks if the relative record number `RRN` is equal to 0.

```rpg
0052.05 C                   LEAVESR                                                                         250102
```
- Exits the subroutine `PROCSFL` if `RRN` is equal to 0.

```rpg
0052.06 C                   ENDIF                                                                           250102
```
- Ends the `IF` statement.

```rpg
0052.07 C                   READC     ORDSFL                                                                250102
```
- Reads a changed record from the subfile `ORDSFL`.

```rpg
0052.08 C                   DOW       NOT %EOF()                                                            250102
```
- Begins a `DOW` loop that continues as long as the end of file (`%EOF()`) is not reached.

```rpg
0052.09 C                   SELECT                                                                          250102
```
- Begins a `SELECT` statement to evaluate multiple conditions.

```rpg
0052.10 C                   when      SOPTION = 4                                                           250103
```
- Checks if `SOPTION` is equal to 4.

```rpg
0052.11 C                   EXSR      ORDDEL                                                                250103
```
- Executes the subroutine `ORDDEL`.

```rpg
0052.12 C                   WHEN      SOPTION = 2                                                           250103
```
- Checks if `SOPTION` is equal to 2.

```rpg
0052.13 C                   EXSR      ORDUPD                                                                250103
```
- Executes the subroutine `ORDUPD`.

```rpg
0052.14 C                   OTHER                                                                           250103
```
- Handles any other value of `SOPTION`.

```rpg
0052.15 C                   EVAL      MESSAGE = 'INVALID OPTION'                                            250103
```
- Sets the `MESSAGE` field to 'INVALID OPTION'.

```rpg
0052.16 C                   ENDSL                                                                           250103
```
- Ends the `SELECT` statement.

```rpg
0052.18 C                   EVAL      *IN81 = '1'                                                           250103
```
- Sets indicator `*IN81` to '1'.

```rpg
0052.19 C                   UPDATE    ORDSFL                                                                250103
```
- Updates the subfile `ORDSFL`.

```rpg
0052.20 C                   EVAL      *IN81 = '0'                                                           250103
```
- Sets indicator `*IN81` to '0'.

```rpg
0052.22 C                   READC     ORDSFL                                                                250103
```
- Reads the next changed record from the subfile `ORDSFL`.

```rpg
0052.23 C                   ENDDO                                                                           250103
```
- Ends the `DOW` loop.

```rpg
0053.00 C                   ENDSR                                                                           250103
```
- Ends the subroutine `PROCSFL`.

```rpg
0058.00 C     ORDUPD        BEGSR                                                                           250103
```
- Begins the subroutine `ORDUPD`.

```rpg
0058.03 C                   EVAL      MESSAGE = *BLANKS                                                     250103
```
- Clears the `MESSAGE` field.

```rpg
0058.07 C     ORDERNO       CHAIN     ORDPF_SCR                                                             250103
```
- Retrieves a record from the file `ORDPF_SCR` based on `ORDERNO`.

```rpg
0058.09 C                   IF        %FOUND()                                                              250103
```
- Checks if a record was found.

```rpg
0058.10 C                   EVAL      IITEM_NAME = ITEM_NAME                                                250105
```
- Assigns the value of `ITEM_NAME` to `IITEM_NAME`.

```rpg
0058.11 C                   EVAL      ICOUNTRY = COUNTRY                                                    250105
```
- Assigns the value of `COUNTRY` to `ICOUNTRY`.

```rpg
0058.12 C                   EVAL      CUST_ID = CUSTOMERID                                                  250105
```
- Assigns the value of `CUSTOMERID` to `CUST_ID`.

```rpg
0058.13 C                   EXFMT     UPDATESFL                                                             250105
```
- Displays the format `UPDATESFL` and waits for user input.

```rpg
0058.16 C                   EVAL      ITEM_NAME = IITEM_NAME                                                250103
```
- Assigns the value of `IITEM_NAME` to `ITEM_NAME`.

```rpg
0058.17 C                   EVAL      COUNTRY = ICOUNTRY                                                    250103
```
- Assigns the value of `ICOUNTRY` to `COUNTRY`.

```rpg
0058.18 C                   EVAL      CUSTOMERID = CUST_ID                                                  250103
```
- Assigns the value of `CUST_ID` to `CUSTOMERID`.

```rpg
0058.19 C                   UPDATE    ORDREC                                                                250103
```
- Updates the record in the file `ORDREC`.

```rpg
C                   EVAL      MESSAGE='ENTRY UPDATED'                                               250103
```
- Sets the `MESSAGE` field to 'ENTRY UPDATED'.

```rpg
C                   EVAL      *IN12 = '0'                                                           250103
```
- Sets indicator `*IN12` to '0'.

```rpg
C                   ENDIF                                                                           250103
```
- Ends the `IF` statement.

```rpg
C                   ENDSR                                                                           250103
```
- Ends the subroutine `ORDUPD`.

```rpg
64.00 C     ORDDEL        BEGSR                                                                           250103
```
- Begins the subroutine `ORDDEL`.

```rpg
C     ORDERNO       CHAIN     ORDPF_SCR                                                             250103
```
- Retrieves a record from the file `ORDPF_SCR` based on `ORDERNO`.

```rpg
C                   IF        %FOUND()                                                              250103
```
- Checks if a record was found.

```rpg
C                   DELETE    ORDREC                                                                250103
```
- Deletes the record from the file `ORDREC`.

```rpg
C                   ENDIF                                                                           250103
```
- Ends the `IF` statement.

```rpg
C                   ENDSR                                                                           250103
```
- Ends the subroutine `ORDDEL`.
```
```

