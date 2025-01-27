# Integrated Language Environment (ILE)

- **Modules**: ILE consists of multiple modules.
- **Combination of Modules**: ILE can be a combination of multiple modules.
- **Activation Groups**: 
  - Creating multiple RPGLE programs in the same activation group results in sharing the same Open Data Paths (ODPs) and improves performance.

In modules, there will be one or more sub-procedures, similar to classes in Java, while modules are like packages. Some modules can be without any procedures, containing just plain business logic.

### Defining Procedures in a Module
- Procedures in a module are defined under P-spec.
- To declare a prototype, use the D-spec.

### Defining a Non-Main Module
- Define non-main modules in H-spec with `HDFTACTGRP(*NO)` and specify the binding directory.

### Compiling Modules
- Use Option 15 (CRTRPGMOD) to compile a module. Debugging can also be done here.
- To call a function in another program, use `EVAL C = ADD(A:B)`.

### Binding Modules
- Use `EXPORT` with the procedure definition keyword to bind two modules.
- Use the CRTPGM command with TYPE(*PGM) to combine both modules.

Multiple language modules can be combined in a program.

### Calling Procedures
- **CALLP**: Prototype call, used when no return value is expected from the procedure.
- **CALLB**: Bound call, used to call a module similar to calling a program, often containing business logic.

### Running Programs Using Binding
- Create a binding directory with `CRTBNDDIR`.
- Work with binding directories using `WRKBNDDIR` or `WRKBNDDIRE`.
  - Add modules by specifying the object name and type as `*MODULE`.
  - Use the CRTPGM command, navigate to the binding directory, and add it.

To get details of bound programs, use `DSPPGM`.

### Using Option 14
- Go to the main program, use Option 14, and prompt to turn off the default activation group. This will enable ILE features. Add binding directories and compile.
- The compiler creates a copy of the main program in QTEMP and then runs it.
- For a more minimized way, add the following to the H-spec of the main program: `HDFTACTGRP(*NO) BNDDIR('<BINDDIR NAME>')`.

### Service Programs
- Service programs can be created and used to share common procedures among multiple programs.

