# iSeries Cheat Sheet

## Basic Commands

| Command      | Description         | Syntax            |
|--------------|---------------------|-------------------|
| GO <MENU>    | Access a menu       | `GO <MENU>`       |
| WRK*         | List all WRK commands | `WRK*`          |

## DBS Commands

| Command        | Description                | Syntax              |
|----------------|----------------------------|---------------------|
| RUNQRY         | Run a query                | `RUNQRY <QUERY>`    |
| STRPDM         | Start PDM                  | `STRPDM`            |
| STRSQL         | Start SQL                  | `STRSQL`            |
| WRKMBRPDM      | Work with MBR in PDM       | `WRKMBRPDM`         |
| WRKQRY         | Work with Queries          | `WRKQRY`            |
| UPDDTA         | Update data in a file      | `UPDDTA <FILE>`     |
| RUNQRY *N      | Run a query on a file      | `RUNQRY *N <FILE>`  |
|STRPEU|Start SEU||
|STRSDA|Start SDA||
|STRRLU|Start RLU||
|STRDDFU|Start DFU||

## IFS Commands

| Command      | Description                       | Syntax               |
|--------------|-----------------------------------|----------------------|
| CHGCURDIR    | Changes the current directory     | `CHGCURDIR <DIR>`    |
| CHGOWN       | Transfers object ownership        | `CHGOWN OBJ('<PATH>') NEWOWN('<OWNER>')` |
| CPY          | Copies a single object or a group of objects | `CPY OBJ('<SOURCE>') TODIR('<DEST>')` |
| MOV          | Moves an object to a different directory | `MOV OBJ('<SOURCE>') TODIR('<DEST>')` |
| RMVLNK       | Removes the link to an object     | `RMVLNK OBJ('<PATH>')` |
| WRKAUT       | Displays a list of users and their authorities | `WRKAUT OBJ('<PATH>')` |
| WRKLNK       | Displays a list of objects in a directory | `WRKLNK OBJ('<DIR>')` |

## Job Commands

| Command      | Description             | Syntax                |
|--------------|-------------------------|-----------------------|
| ENDJOB       | Ends a job              | `ENDJOB <JOB>`        |
| WRKACTJOB    | Work with active jobs   | `WRKACTJOB`           |
| WRKSBMJOB    | Work with submitted jobs | `WRKSBMJOB`          |
| WRKSBSJOB    | Work with subsystem jobs | `WRKSBSJOB`          |
| WRKUSRJOB    | Work with a user's jobs | `WRKUSRJOB <USER>`    |

## Job Queues/Subsystems Commands

| Command      | Description             | Syntax                  |
|--------------|-------------------------|-------------------------|
| ENDSBS       | End a subsystem         | `ENDSBS <SBS>`          |
| HLDJOBQ      | Hold a JOBQ             | `HLDJOBQ <JOBQ>`        |
| RLSJOBQ      | Release a JOBQ          | `RLSJOBQ <JOBQ>`        |
| SBMJOB       | Submit a batch job      | `SBMJOB CMD(<CMD>)`     |
| STRSBS       | Start a subsystem       | `STRSBS <SBS>`          |
| WRKJOBQ      | Work with JOBQ          | `WRKJOBQ <JOBQ>`        |
| WRKSBS       | Work with active SBS    | `WRKSBS`                |
| WRKSBSD      | Work with SBS description | `WRKSBSD <SBSD>`     |

## Library Lists Commands

| Command             | Description                          | Syntax                   |
|---------------------|--------------------------------------|--------------------------|
| ADDLIBLE            | Add a library to your list           | `ADDLIBLE <LIB>`         |
| CHGLIBL             | Change library list                  | `CHGLIBL LIB(<LIB>)`     |
| DSPLIBL             | Show current library list            | `DSPLIBL`                |
| DSPLIB              | Display library                      | `DSPLIB <LIB>`           |
| EDTLIBL             | Edit library list                    | `EDTLIBL`                |
| ADDLIBLE            | Add library list entry               | `ADDLIBLE <LIB>`         |
| WRKLIBPDM           | Work with libraries using PDM        | `WRKLIBPDM`              |
| CRTLIB              | Create a library                     | `CRTLIB LIB(<LIB>)`      |

## Logs/System Commands

| Command      | Description                | Syntax                |
|--------------|----------------------------|-----------------------|
| CHGJOB       | Change current job logging | `CHGJOB LOG(<LEVEL>)` |
| DSPJOB       | Display current job attributes | `DSPJOB`          |
| DSPJOBLOG    | Display current job log    | `DSPJOBLOG`           |
| WRKSYSSTS    | Work with system status    | `WRKSYSSTS`           |

## Message Commands

| Command      | Description                  | Syntax                   |
|--------------|------------------------------|--------------------------|
| DSPMSG       | Display messages             | `DSPMSG`                 |
| SNDBRKMSG    | Send break message           | `SNDBRKMSG MSG('<MSG>')` |
| SNDMSG       | Send message                 | `SNDMSG MSG('<MSG>')`    |

## Objects/Files Commands

| Command      | Description                                      | Syntax                        |
|--------------|--------------------------------------------------|-------------------------------|
| CPYF         | Copies all or part of a database file to another database file | `CPYF FROMFILE(<SRC>) TOFILE(<DEST>)` |
| CRTDUPOBJ    | Copies a single object or a group of objects     | `CRTDUPOBJ OBJ(<OBJ>) FROMLIB(<LIB1>) TOLIB(<LIB2>)` |

## Restore/Save Commands

| Command      | Description               | Syntax                  |
|--------------|---------------------------|-------------------------|
| CRTSAVF      | Create save file          | `CRTSAVF FILE(<LIB>/<FILE>)` |
| RSTOBJ       | Restores object(s)        | `RSTOBJ OBJ(<OBJ>) SAVLIB(<LIB>) DEV(<DEV>)` |
| SAVOBJ       | Save object(s)            | `SAVOBJ OBJ(<OBJ>) LIB(<LIB>) DEV(<DEV>)`   |
| SAVLIB       | Save library              | `SAVLIB LIB(<LIB>) DEV(<DEV>)`              |

## Security Commands

| Command      | Description                       | Syntax                       |
|--------------|-----------------------------------|------------------------------|
| CHGAUT       | Change a user's authority for an object | `CHGAUT OBJ(<OBJ>) USER(<USER>) AUT(<AUT>)` |
| EDTOBJAUT    | Edit object authority             | `EDTOBJAUT OBJ(<OBJ>)`       |
| GRTOBJAUT    | Grant object authority            | `GRTOBJAUT OBJ(<OBJ>) USER(<USER>) AUT(<AUT>)` |
| RVKOBJAUT    | Revoke object authority           | `RVKOBJAUT OBJ(<OBJ>) USER(<USER>)` |

## Outqs/Splfs Commands

| Command      | Description                | Syntax                  |
|--------------|----------------------------|-------------------------|
| CRTOUTQ      | Create OUTQ                | `CRTOUTQ OUTQ(<OUTQ>)`  |
| CRTDEVPRT    | Create printer device      | `CRTDEVPRT DEVD(<DEVD>)`|
| STRRMTWRTR   | Start remote writer        | `STRRMTWRTR OUTQ(<OUTQ>)` |
| WRKOUTQ      | Work with all outqs        | `WRKOUTQ`               |
| WRKSPLF      | Work with spooled files    | `WRKSPLF`               |
| WRKWTR       | Work with all writers      | `WRKWTR`                |

## Users Commands

| Command      | Description                | Syntax                  |
|--------------|----------------------------|-------------------------|
| CRTUSRPRF    | Create user profile        | `CRTUSRPRF USRPRF(<USER>)` |
| WRKUSRPRF    | Work with user profiles    | `WRKUSRPRF`             |

## FTP Commands

| Command      | Description                                     | Syntax                          |
|--------------|-------------------------------------------------|---------------------------------|
| APPEND       | Adds a local file member to file on remote system | `APPEND <LOCAL> <REMOTE>`     |
| ASCII        | Sets file transfer type to ASCII                | `ASCII`                         |
| BINARY       | Sets file transfer type to BINARY               | `BINARY`                        |
| CD           | Changes the working directory on remote system  | `CD <DIR>`                      |
| CLOSE        | Ends session on remote system                   | `CLOSE`                         |
| DELETE       | Deletes a file on remote system                 | `DELETE <FILE>`                 |
| DIR          | Displays directories and files on remote system | `DIR`                           |
| EBCDIC       | Sets file transfer type to EBCDIC               | `EBCDIC`                        |
| GET          | Copies a file from the remote system to the local system | `GET <REMOTE> <LOCAL>`     |
| LCD          | Changes the working directory on local system   | `LCD <DIR>`