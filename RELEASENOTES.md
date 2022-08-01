## 3.1.0

* rewrote mulle-dispense-mv-force script to support Windows better


# 3.0.0

* big function rename to `<tool>`::`<file>`::`<function>` to make it easier to read hopefully
* uses mulle-bashfunctions 4 now
* can now run under zsh if bash is not available


### 2.0.2

* Various small improvements

### 2.0.1

* installer verbose toggle

# 2.0.0

* mulle-dispense now copies instead of moves per default, which is basically what was advertised all along ...
* use the --move option on the dispense command to move as before
* use ``MULLE_DISPENSE_SEARCH_LIB_PATH`` and related environment variables to tweak the search path for build products
* the various ``MULLE_DISPENSE_SEARCH_`<dir>`_PATH`` variables may also reference files,


## 1.2.0

* changed to mulle-bashfunctions 2 call convention
* moved to mulle-bashfunctions v2


### 1.0.2

* hack change version to 1.0.1 because of a debian problem

### 0.6.3

* small beauty fixes in code

### 0.6.2

* a bit less verbose

### 0.6.1

* improve README.md, miniscule code improvements

## 0.6.0

* tune what gets dispensed with commandline parameters like --no-headers


### 0.5.1

* mulle-dispense does not wrongly assert the pathname 'sanity' of the source anymore

## 0.5.0

* use `r_` functions of mulle-bashfunctions 1.8.0


## 0.4.0

* fix test for mingw


### 0.3.2

* add missing quotes around string

### 0.3.1

* less verbose

## 0.3.0

* add --header-dir option


### 0.2.22

* small code change

### 0.2.21

* capitalize an error message properly

### 0.2.20

* add `._.DS_Store` to .gitignore

### 0.2.19

* quote more case patterns to avoid extglob surprises

### 0.2.18

* use `LC_ALL=C` for sort

### 0.2.17

* remove file from git

### 0.2.16

* simplify README

### 0.2.15

* improved brew formula definition

### 0.2.14

* fix package dependencies more

### 0.2.13

* fix package dependencies

### 0.2.12

* fix homebrew install ruby script

### 0.2.11

* rename install to installer, because of name conflict

### 0.2.10

* rename install.sh to install

### 0.2.9

* CMakeLists.txt CMakePackage.txt LICENSE Makefile README.md RELEASENOTES.md build install.chk install.sh mulle-dispense mulle-dispense.sublime-project mulle-dispense.sublime-workspace mulle-project src tests tmp.4G7WECAI tmp.Cm9FA2Yu tmp.H70JmUwp tmp.OMcvmXX1 tmp.RPTGbiBb tmp.T7CWYggR tmp.XRatwWEH tmp.gKzio3Kf tmp.nJXgwker tmp.wXAYgWwu simplified CMakeLists.txt

### 0.2.8

* fix potential bug in test

### 0.2.7

* remove `MULLE_EXECUTABLE_FAIL_PREFIX`

### 0.2.6

* miniscule code improvement

### 0.2.5

* use proper `DEPENDENCY_DIR` and `MULLE_UNAME`

### 0.2.4

* small cleanup

### 0.2.3

* unify mulle-bashfunctions usage and help

### 0.2.2

* * fix option handling for project

## 0.2.0

* use `MULLE_USAGE_NAME`
