## 6.1.0

* fix for Windows


### 6.0.1

* fix installer (?)

# 6.0.0

* big function rename to `<tool>`::`<file>`::`<function>` to make it easier to read hopefully
* experimental support for coverage files and gcove
* improved default contents of test directories after init
* less verbosity with -lx
* can now pass through CFLAGS and other such flags
* improved testing under darwin without mulle-clang
* uses mulle-bashfunctions 4 now
* can now run under zsh if bash is not available
* fix cmake test problem on macOS


### 5.3.3

* fix cmake test problem on macOS

### 5.3.1

* Various small improvements

## 5.3.0

* made diffing more flexible, you can now provide your own .diff script
* differing whitespace is now only a warning and not an error anymore
* fix /tmp polution with wrongly placed compiler error output
* cmake tests in a folder like ``20_foo`` will be now expected to produce **`foo`** and not **`20_foo`**
* support differentation by architecture


### 5.2.1

* installer verbose toggle

## 5.2.0

* move startup up when test init runs


## 5.1.0

* improved sanitizer support
* improved execution of cmake bases tests (proper quoting)
* fixed valgrind and mulle-testallocator crossing streams
* started some support for WSL windows
* use the new --mulle-test flag to tell dependencies they are being built for tests
* support tests not being compiled. Use .args as the `MULLE_TEST_EXTENSIONS` and specify a `MULLE_TEST_EXECUTABLE` (nice for MulleScion)
* improve search for `<name>`.environment to match search for .args .stdout etc.


### 5.0.2

* fix CMakePackage

### 5.0.1

* improve linkorder usage text
* improve linkorder usage text

# 5.0.0

* changed to mulle-bashfunctions 2 call convention
* moved to mulle-bashfunctions v2
* supports now a proper differentation and combination of memorycheckers, depending on platform



### 4.2.4

* fix test init for macos (again) to use different library order

### 4.2.3

* use all-load on mulle-testallocator for dylib to be linked on linux

### 4.2.2

* fix circular dependency with mulle-sde

### 4.2.1

* fix --serial not being passed to mulle-craft, also remove -framework Foundation from LDFLAGS

## 4.2.0

* add linkorder command to mulle-test
* allow --standalone as craft option
* improve test init code
* per test and per test directory environment now possible
* improved test library passing to cmake with and without startup library
* uses now Test configuration instead of Release as default
* dependency libraries are now longer built as one big STANDALONE shared lib, but individual shared libs
* cmake can produce a shared library instead of an executable, which will be useful for UnitKit tests
* add --keep-exe option


### 4.1.4

* add ENV variable `VALGRIND_TOOL`

### 4.1.3

* fix missing function

### 4.1.2

* rename build to craft for consistency with mulle-sde

### 4.1.1

* experimentally add --valgrind option
* use .mulle folder
* make mulle-test on its own more powerful and convenient

## 4.1.0

* use .mulle folder
* make mulle-test on its own more powerful and convenient


### 4.0.10

* ensure mulle-testallocator is first, dont ignore quickstatus errors anymore

### 4.0.9

* improve whole-archive output

### 4.0.8

* fix parameter passing one more time

### 4.0.7

* pass parameters on the command line to run and build

### 4.0.6

* fix libexec install location

### 4.0.5

* fix version info

### 4.0.4

* use proper installer for mulle-test

### 4.0.3

* fix installer for mulle-test

### 4.0.2

* try to fix brew again

### 4.0.1

* fix brew formula, improve exekutor logging, remove find warning on linux

# 4.0.0

* big overhaul. the build part is now done with mulle-sde.
* this means mulle-test is now dependent on mulle-sde, unless you use ./build-test scripts
* started use of mulle-platform to query platform specifica (more to come)
* last version before move to mulle-sde for build


### 3.0.13

* fix some wordings to track changes in mulle-sde

### 3.0.12

* fix some ugliness

### 3.0.11

* fix wrong function call

### 3.0.10

* load a .mulle-test/etc/environment.sh config if present

### 3.0.9

* need a little mulle-sde support

### 3.0.8

* fix extremely stupid init bug

### 3.0.7

* fix dependencies

### 3.0.6

* fix CMakeLists.txt again and again and again and again

### 3.0.5

* fix CMakeLists.txt again and again and again

### 3.0.4

* fix CMakeLists.txt again and again

### 3.0.3

* fix CMakeLists.txt again

### 3.0.2

* fix CMakeLists.txt

### 3.0.1

* improved environment setup for standalone operation w/o mulle-sde

# 3.0.0

* mulle-test 3.0 renamed from mulle-tests 2
* init is now done my mulle-test. There is a separate -env for
* reorganized project


### 2.2.11

* Various small improvements

### 2.2.9

* if objc do not allow CC defaults from travis unless OBJC_DIALECT is set

### 2.2.5

* dial down the convenience to support gcc. TEST_LIBRARIES must be linked inside tests CMakeLists.txt now

### 2.2.3

* fix return code on fails, fix cmake

### 2.2.1

* Various small improvements

### 2.1.1

* use MULLE_TEST to get os-specific-libraries.txt

## 2.1.0

* use MULLE_TESTS CMAKEFLAGS to let mulle-configuration produce os-specific-libs.txt for linkage


# 2.0.0

* use cmake instead of make as the multiple source file test builder


### 1.1.1

* use mulle-build 3.8 for build-test.sh


# 1.0.1

* Finally versioned this.
