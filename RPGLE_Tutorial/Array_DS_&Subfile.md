### Arrays and Data Structures in RPGLE

**Array:** A standalone variable specified using the keyword `DIM(ARRAY_SIZE)`, representing dimensions. This type of array is called a runtime array. To declare, provide the array name, declaration type (`S`), length of each element, and the `DIM(ARRAY_SIZE)` keyword.

There are two other types of arrays:
1. **Compile-time Array:** Values are initialized inside the program itself.
2. **Pre-runtime Array:** Loaded from a file (flat file) when a call command is issued. This type is not commonly used.

#### Initializing Array
An index is needed for initialization. For example:
```plaintext
C  EVAL  ARRAY1(1) = 'a'
```
Here, the index starts from 1. Index 0 is invalid.

#### Searching in an Array
Use `%LOOKUP()` to search an argument in an array:
- **Factor 1:** Searching element
- **Factor 2:** Array name
- Returns the position of the value.

#### Sorting Array
Use the `SORTA` operator to sort the array in ascending order.

#### Summing an Array
Use `%XFOOT(array_name)` to return the total sum for a numeric array. To declare a numeric array, specify type `S` with decimal point `0`.

#### Compile-time Array
Declared after the subroutine, starting from column 1 (usually starting from column 6). To shift left, use `Shift + F7` or `F19`. At the end, use `**` before entering array values. Also, add `DIM(array_size) CTDATA` in the keywords while defining each array. For multiple compile-time arrays, use `**` to enter values for the next array in sequence. Compile-time arrays are used to display error messages or static data.

#### Two-dimensional Array
Along with `DIM()`, add `PERRCD(size)` to define a two-dimensional array.

### Data Structures in RPGLE

**Defining Data Structures:**
- Declaration type should be `DS`.
- Subsequent fields will be subfields.
- Subfields need length and starting position. If the starting position is not specified, the system calculates it from the length.
- Data structures need a zoned type. Specify the data type if numeric.

### Example Program

Create a program to populate all records from `ITMPF` to a flat file `ITMFLTF`. Rename the record format for the flat file as both the file and record have the same name. Use the `RENAME` operator. If fields and file have the same name, use the `PREFIX` keyword to temporarily change the field names.


Use `RENAME()` to rename a table record format. RPGLE won't run when the file name and record format name are the same. In tables, both file and record format names are the same, so renaming is needed.

To avoid defining each field of the physical file (PF) separately in the data structure (DS), use the external definition keyword `EXTNAME('<PF name>')`.

### Program Status Data Structure (PSDS)

Provides information about program errors/exceptions to the DS at the program level. For example, if there is an error, it is stored in a field. To define it, provide the name, specify `S`/`U` as `S` (program status DS), and type `DS`.


### SUBFILE

A subfile displays records in tabular format on a display device.

- It can be an editable tabular format used for data entry screens, inquiry (static) screens, or a combination of both, such as editing the information for a particular inquiry.
- The subfile first loads the data in the subfile buffer. A maximum of 9999 records can be loaded in the subfile buffer at a time. Loading more leads to a session or device error.
- To create a subfile, we use the SCREEN DESIGN AID tool (Command ```STRSDA```).
- A subfile has two record formats:
  1. Subfile control record format
  2. Subfile record format

#### Type of Subfile:
- Single Time: Only one page is loaded at a time; when it is down, the next set is loaded.
- Extendible/Elastic: Only one page is loaded, but the previous page will be buffered in memory.

#### Subfile Steps:

1. **Clearing of Subfiles:**
   - Clear the subfile buffer at once.
   - Switch on the SFLCLR indicator.
   - Write the control part.
   - Switch off the clear indicator.
     - This is done to prevent problems in the next iteration.

2. **Loading Data from DB File into Subfile:**
   - Use *LOVAL SETLL EMPF
   - Read EMPF
   - RRN = 0
   - DOW NOT EOF()
     - Populate subfile fields (SEMPNAME = EMPNAME...)
     - Write EMPF
     - RRN = RRN + 1
     - Read EMPF
   - ENDDO
   - Records will be represented by RRN (Relative Record Number).

3. **Displaying Subfile:**
   - Write footer.
   - Switch on SFLDSP & SFLDSPCTL.
     - SFLDSP: Switch on only when there are records to display (refer to RRN).
     - SFLDSPCTL: Switch on all the time.
   - If RRN > 0
     - Switch on SFLDSP and SFLEND.
   - Endif
   - EXFMT control part.

     No need to separately EXFMT for subfile.

     Why overlay? When we give EXFMT, it removes the previous screen and brings a new one. When adding overlay, it will keep the filled part of the footer and then bring control in the empty part.

Use SFILE() to link RRN to subfile. Syntax: `SFILE(EMPSFL:RRN)` while giving file spec.

### Practice Time

An RPGLE program for order and item maintenance using a subfile. The program should read data from the Order PF, allow creation, update, and deletion of entries, and include filtering by country and customer ID with positioning.

#### Terms and Keywords Used in the Program:

- **SFILE():** To link RRN to subfile. Syntax: `SFILE(EMPSFL:RRN)` while giving file spec.
- **INFDS():** Links subfile to the file information data structure.
  - **FIRSTRNN 378 379:** A subfield within DSCRNDS at positions 378-379, defined as an integer with 0 decimal places. This subfield will contain the first RRN currently displayed in the subfile.
  - **RCD_NBR DSCRNDS:** A data structure designated to hold the File Information Data Structure (INFDS) for the display file.
- **EXFMT:** (Execute Format) operation code in RPGLE is used to both display a record format on a workstation screen and then immediately read input from that same screen.

#### Indicators:

- **SFLNXTCHG (*IN81):** Prevents unintended data carryover or propagation between subfile records during updates.
- **SFLCLR:** Clears the subfile display and buffer.
- **SFLDSP:** Controls subfile *record* display. ON when records exist.
- **SFLDSPCTL:** Controls *control record* display. Usually ON when the subfile is displayed.
- **OVERLAY:** Prevents full screen rewrite, improving performance. Specified in the SFLCTL record's DDS. When we give EXFMT, it removes the previous screen and brings a new one. When adding overlay, it will keep the filled part of the footer and then bring control in the empty part.
- **SFLRCDNBR(CURSOR/*TOP):** DDS level keyword/function. Helps to locate and position the data as needed. This should be defined in the DDS DSPF file of the screen.
  - To define: Go to the DSPF file, go to the last line of the record, click F4, enter the name, length, decimal position, and data type (better will be Zoned, packed is also fine). Add use as H(hidden field) and enter this function.


#### Program Explanation

This RPGLE code implements a subfile program for displaying, creating, updating, and deleting order information, with filtering capabilities. Let's break it down in detail:

**Program Structure:**

The program uses subroutines to organize its logic:

*   **`CLRSFL`:** Clears the subfile display.
*   **`LOADSFL`:** Loads order data into the subfile, applying filters.
*   **`DSPLYSFL`:** Displays the subfile on the screen.
*   **`PROCSFL`:** Handles user input from the subfile (updates, deletes).
*   **`CREATESR`:** Handles the creation of new order records.
*   **`ORDUPD`:** Handles the update of existing order records.
*   **`ORDDEL`:** Handles the deletion of order records.

**File and Data Declarations:**

*   `FORDSUBFILECF`: The display file (screen). `SFILE(ordSFL:RRN)` defines `ordSFL` as the subfile record format and uses `RRN` (Relative Record Number) for subfile record positioning. `INFDS(SCRNDS)` associates the file with the file information data structure `SCRNDS`.
*   `FORDPF_SCR`: The main order database file.
*   `FITMPF`: An item master file used for lookups based on `ITEMNO`.
*   `DRRN`: A variable to store the Relative Record Number.
*   `DARRAY1`: A character array used for filtering item types.
*   `DSCRNDS`: A data structure to hold file information, including `DFIRSTRRN` (First RRN of the subfile page), used for scrolling.
*   `RCD_NBR`: Stores the RRN of the record that should be positioned to when the subfile is displayed.

**Main Program Logic:**

1.  **Initialization:** `RCD_NBR` is initialized to 1, and `ARRAY1` is populated with filter values ('A' and 'B').
2.  **Main Loop:** The program enters a `DOW` loop that continues as long as indicator `*IN03` is off ('0'). `*IN03` is likely set on by a function key press to exit the program.
3.  **Create New Order:** If indicator `*IN06` is on ('1'), the `CREATESR` subroutine is called to handle new order creation.
4.  **Subfile Processing:** Inside the loop:
    *   `EXSR CLRSFL`: Clears the subfile.
    *   `EXSR LOADSFL`: Loads order data into the subfile, applying filters.
    *   `EXSR DSPLYSFL`: Displays the subfile.
    *   `EXSR PROCSFL`: Processes user input (updates, deletes).
5.  **Program Termination:** When `*IN03` is on, the loop ends, and `*INLR = '1'` sets the Last Record indicator, terminating the program.

**Subroutine Details:**

*   **`CLRSFL` (Clear Subfile):** Sets `*IN93` on to trigger the subfile clear in the display file, writes the control record (`ORDCTL`), and then sets `*IN93` off.

*   **`LOADSFL` (Load Subfile):**
    1.  Initializes `RRN` to 0.
    2.  Reads records from `ORDPF_SCR` using `SETLL *LOVAL` and `READ`.
    3.  `CHAIN`s to `FITMPF` based on `ITEMNO` to retrieve item information.
    4.  Applies filters:
        *   Checks if the item `TYPE` is in `ARRAY1` using `%LOOKUP`.
        *   Filters based on `ICUSTID` and `Icntry` (customer ID and country) if these fields are not blank, allowing for partial filtering.
    5.  If a record passes the filters, `RRN` is incremented, and the subfile record (`ORDSFL`) is written.
    6.  If `POSORDNO` matches `ORDERNO`, the current `RRN` is stored in `RCD_NBR` for positioning.

*   **`DSPLYSFL` (Display Subfile):**
    1.  Writes the `FOOTER` record.
    2.  Sets `*IN92` on to display the subfile control record.
    3.  If `RRN` is greater than 0 (records were loaded), sets `*IN91` (subfile display) and `*IN94` (subfile end) on.
    4.  `EXFMT ORDCTL`: Displays the subfile.
    5.  If `FIRSTRRN` from `SCRNDS` is greater than 0, copies it to `RCD_NBR` for scrolling.
    6. Turns off *IN91, *IN94 and *IN92.

*   **`PROCSFL` (Process Subfile):**
    1.  Exits if `*IN03` is on or `RRN` is 0.
    2.  `READC ORDSFL`: Reads changed subfile records.
    3.  `SELECT` statement handles `SOPTION`:
        *   `SOPTION = 4`: Calls `ORDDEL` (delete).
        *   `SOPTION = 2`: Calls `ORDUPD` (update).
        *   Otherwise: Sets an "INVALID OPTION" message.
    4.  Sets `*IN81` (SFLNXTCHG) on before `UPDATE ORDSFL` and off after to prevent data carryover.

*   **`CREATESR` (Create Subfile Record/Order):**
    1.  Enters a `DOW` loop controlled by `*IN12`. This allows the user to repeatedly attempt to create a record until they confirm (*IN12 = '1') or cancel.
    2.  `EXFMT CREATESFL`: Displays a separate screen (`CREATESFL`) for creating new orders and gets input.
    3.  If *IN12 is '1', the loop is exited.
    4.  Assigns input field values to the file fields.
    5.  `WRITE ORDREC`: Writes the new order record to `FORDPF_SCR`.

*   **`ORDUPD` (Order Update):**
    1.  `CHAIN`s to `FORDPF_SCR` based on `ORDERNO`.
    2.  If the record is found, it populates input fields (`IITEM_NAME`, `ICOLUNTRY`, `CUST_ID`) with the current record's values.
    3.  `EXFMT UPDATESFL`: Displays the update subfile screen (`UPDATESFL`).
    4.  Updates the `ORDREC` record in `FORDPF_SCR`.
    5. Sets a message.

*   **`ORDDEL` (Order Delete):**
    1.  `CHAIN`s to `FORDPF_SCR` based on `ORDERNO`.
    2.  If the record is found, `DELETE ORDREC` deletes the record.

**Key Improvements and Explanations from Previous Versions:**

*   **Filtering Logic:** The `LOADSFL` subroutine now has more robust filtering based on `ICUSTID` and `Icntry`, correctly handling blank values.
*   **Positioning:** The code now correctly uses `RCD_NBR` and `FIRSTRRN` to position the subfile when it's displayed, which is essential for paging and scrolling.
*   **SFLNXTCHG:** The use of `*IN81` (SFLNXTCHG) in the `PROCSFL` subroutine is now explicit and correct, preventing data carryover issues.
*   **Create Record Loop:** The `CREATESR` subroutine now uses a `DOW` loop and indicator `*IN12` to allow the user to correct input errors before writing the record.

**In summary:** This program provides a complete subfile interface for managing orders, including creation, updating, deletion, filtering, and positioning/scrolling. The code is well-structured using subroutines and addresses important subfile programming considerations. To compile and run this, you'll need the DDS for the display files (`FORDSUBFILECF`, `UPDATESFL`, and `CREATESFL`) and the record formats for the database files (`FORDPF_SCR` and `FITMPF`).
