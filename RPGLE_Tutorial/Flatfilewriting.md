# Create a flat file ITEMEXT with record length 500  2.Create rpgle program to move data from item pf to flat file

### Creating Flatfile
- Use `crtpf <file_name>` and click on prompt button `F4`.

         CRTPF ITMFLTF

- After getting into prompt, enter the record length as 500 and click `enter`.

### Create Physical file for item. 
- Here let's take as `ITMPF` with details as given below:

```plaintext
 Columns . . . :    1  80                                      Browse                                                ASHLIB/QDDSSRC 
 SEU==>                                                                                                                       ITMPF 
        *************** Beginning of data ***************************************************************************************   
0000.01                                             UNIQUE                                   241231                                 
0001.00                 R ITEMREC                                                            241231                                 
0002.00                   ITMNO         10  0                                                241231                                 
0003.00                   PRITMPRICE    10  2                                                241231                                 
0004.00                   ITEMDESC      20                                                   241231                                 
0004.01                   TYPE           2                                             250105                                 
0005.00                 K ITMNO                                                              241231                                 
        ****************** End of data ****************************************************************************************** 
```
### RPGLE Programming

1. Give file level specifications for both PF and Flatfile.
    - ITMPF with File type `I` since we are just taking input from this file, while File designation should be given `F` being a completely procedural file. File Format should be `E` as it is externally described. Since we use key values in this file to process or read, give Record Address type to be `K`. And the storage is from disk, so Device is 'Disk'.

    - Define file specification for `ITMFLTF` where file type should be `U` since we are updating or writing data into it. Use `Rename()` and `Prefix()` keywords with this file to avoid naming conflicts since both the file and the record share the same name. This can be resolved using the RENAME operator. Similarly, fields and files having the same name can be solved using the PREFIX operator.
    
            RENAME(ITMFLTF:FLTREC)PREFIX('P_')  
    
2. Define Data Structure for `ITMFLTF`: The data structure (DS) for `ITMFLTF` is defined as `DP_ITMFLTF`, with fields corresponding to the file's record format. Each field's data type and length are specified.

3. Read and Write Operations:

    - The `READ` operation reads records from `ITMPF` sequentially.

    - The DOW loop continues processing until the end of the file `(NOT %EOF())`.

    - Inside the loop, the WRITE operation writes the data to `FLTREC`, which is the renamed format of `ITMFLTF`.

    - The loop reads the next record from `ITMPF` after each write operation.

4. Finally, `*INLR` is set to `1`, which indicates the end of the program.

```RPGLE

 Columns . . . :    6 100                                       Edit                                               ASHLIB/QRPGLESRC 
 SEU==>                                                                                                                    ATFILETM 
 FMT FX FFilename++IPEASF.....L.....A.Device+.Keywords+++++++++++++++++++++++++++++Comments++++++++++++                             
        *************** Beginning of data ***************************************************************************************   
0001.00 FITMPF     IF   E           K DISK                                                                  250106                  
0002.00 FITMFLTF   UF A E           K DISK    RENAME(ITMFLTF:FLTREC)PREFIX('P_')                            250106                  
0002.01 DP_ITMFLTF        DS                                                                                250106                  
0002.02 DITMNO                          10  0                                                               250106                  
0002.03 DPRITMPRICE                     10  2                                                               250106                  
0002.04 DITEMDESC                       20                                                                  250106                  
0002.05 DTYPE                            2                                                                  250106                  
0004.00 C                   READ      ITMPF                                                                 250106                  
0005.00 C                   DOW       NOT %EOF()                                                            250106                  
0006.00 C                   WRITE     FLTREC                                                                250106                  
0007.00 C                   READ      ITMPF                                                                 250106                  
0008.00 C                   ENDDO                                                                           250106                  
0009.00 C                   EVAL      *INLR='1'                                                             250106                  
        ****************** End of data ******************************************************************************************   
```
