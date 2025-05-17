## What is it

### pattern-renamer is a CLI that helps you to replace terms/words that can be written in many different patterns

- Doesn't matter the language, if a term/word is written alot, along many files and with different patterns this CLI can be very useful.
- Was made aiming to rename programming projects, but can also work for another cases.
- For instance, you want to rename the term **someExample** in your files, but it also happens to be written in some of the following cases:
  - A normal variable -> **someExample**
  - Database queries -> select **some_example** from ....
  - Function -> **myFunctionSomeExample()**, **someExampleFunction()**, **SomeExampleFunction()**
  - Docs -> **some example**, **Some example**, **someExample**....
  - Json tags -> **some_example**
  - Constants/static variables or enums -> **SOME_EXAMPLE**

### How to install it

- **It will only work on Unix systems!**
- You only need to download a single binary file from the releases and move it to the bin directory of your system
- linux
  - Go to the folder with the downloaded file (**pattern-renamer.static**) and run the following commands:
    ```
        sudo chown $USER pattern-renamer.static;
        sudo chmod +x pattern-renamer.static;
        sudo mv pattern-renamer.static /usr/local/bin/pattern-renamer
    ```
  - If you want to install the dinamic linked version, its the same with different file name (**less likely to work**)
- macOS

  - Go to the folder with the downloaded file (**pattern-renamer**) and run the following commands:

  ```
      sudo chown $USER pattern-renamer;
      sudo chmod +x pattern-renamer;
      sudo mv pattern-renamer /usr/local/bin/
  ```

- The help command should tell you if the installation worked
  ```
    pattern-renamer --help
  ```

### How to use it

- to use the CLI you can write the term/word in any pattern (must be [supported](#supported-patterns) by the CLI)
- use -r (recursive) to change files in subdirectories
- **first positional** param is one or multiple (comma separated) term/words that you will rename from
- **second positional** param is one or multiple (comma separated) term/words that you will rename to
- this 2 params need to be ordered (1st "from", will match 1st "to")
- example
  ```
    pattern-renamer -r "someExample, anotherExample" "changedExample, anotherChangedExample"
  ```
- ignore some files
  ```
    pattern-renamer -r -i README.md "someExample" "changedExample"
  ```
- For every line changes, the CLI will show the diff and ask if you want to apply. If you want to automatically confirm you can use the yes tool or something similar

  ```
    yes | pattern-renamer -r "someExample" "changedExample"
  ```

- there is many other options that can be seen via `pattern-renamer --help`

### Supported patterns

```
    type word_pattern =
        (* some_example *)
        | Underscore of string extra_pattern_type
        (* someExample *)
        | CamelCase of string
        (* SomeExample *)
        | CapitalizedCamelCase of string
        (* some example | Some example | Some Example *)
        | SpaceSeparated of string extra_pattern_type
        (* someexample *)
        | Lower of string

    type 't extra_pattern_type =
        | AllLower of 't
        | FirstCaptalized of 't
        | AllCaptalized of 't
```
