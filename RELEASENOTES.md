### 1.0.1

* Various small improvements

# 1.0.0

* big function rename to `<tool>`::`<file>`::`<function>` to make it easier to read hopefully
* uses mulle-bashfunctions 4 now
* can now run under zsh if bash is not available


## 0.8.0

* improved output of mulle-match-to-c
* made filename command more helpful by checking `MULLE_MATCH_FILENAMES` also
* not mulle-match-to-cmake outputs a `_Resources.file` for cmake
* use ``MULLE_MATCH_TO_CMAKE_SOURCE_PATTERNFILETYPE`` and ``MULLE_MATCH_TO_CMAKE_HEADER_PATTERNFILETYPE`` instead of ``MULLE_MATCH_TO_CMAKE_PATTERNFILETYPE`` for improved separation of sources and headers in files list
* renamed `-mf` flag to `-tf` (--type-filter) for improved readability
* improved output of header guards
* you can tweak the discrimination between Objetive-C or C headers with a bunch environment variables now
* rename match command to filename
* new `mulle-match-to-c` script
* nicer comment header for `mulle-match-to-cmake`
* `filename` command gains the `-l` option


## 0.7.0

* added ignore command
* add patternfile path command
* **the default reflection output directory is now cmake/reflect and src/reflect instead of cmake/ and src/**


## 0.6.0

* add --no-follow-symlink option, but follow by default
* add category filter
* add status command
* fix small display ugly in list command, where it doesn't show etc or share


### 0.5.3

* distributed too soon... now fix symlinks on darwin/freebsd for real

### 0.5.2

* fix -xtype for darwin

### 0.5.1

* do not ignore symbolic links anymore when listing files

## 0.5.0

* changed to mulle-bashfunctions 2 call convention
* moved to mulle-bashfunctions v2
* ask mulle-env for the location of ETC SHARE and VAR directories


### 0.4.5

* place kitchen into default `MULLE_MATCH_IGNORE_PATH`

### 0.4.4

* bug fix
* small beauty fixes in output and code

### 0.4.3

* remove *.dSYM from `MULLE_MATCH_IGNORE_PATH` default list, fix -I setting wrong variable, improve dox

### 0.4.2

* fix copy and rename command, clean var after changes

### 0.4.1

* repair also ignorefiles

## 0.4.0

* use own .mulle folder now instead of .mulle-match
* add init command


### 0.3.2

* improve README.md

### 0.3.1

* suppress boring warning when cleaning

## 0.3.0

* support show command
* rename find to list


### 0.2.1

* fixes for mulle-monitor

## 0.2.0

* use `r_` functions of mulle-bashfunctions 1.8.0


### 0.1.24

* small test improvement

### 0.1.23

* fix bug that surfaced on mingw

### 0.1.22

* add missing test files

### 0.1.21

* improve usage information

### 0.1.20

* capitalize error message

### 0.1.19

* make user defined patternfiles more detectable, be more verbose in match

### 0.1.18

* add new -pf option to test singular patternfiles

### 0.1.17

* fix for `PROJECT_SOURCE_DIR` being . and duplicate finds

### 0.1.16

* dont crash if not match.d is present

### 0.1.15

* extglob protect case globs

### 0.1.14

* use `LC_ALL=C` for sort

### 0.1.13

* simplify README

### 0.1.12

* fix package dependencies more

### 0.1.11

* fix homebrew install ruby script

### 0.1.10

* catch renumbered patternfiles in upgrade

### 0.1.9

* rename install to installer, because of name conflict

### 0.1.8

* better usage info

### 0.1.7

* rename install.sh to install

### 0.1.6

* CMakeLists.txt CMakePackage.cmake LICENSE README.md RELEASENOTES.md build dox install.sh mulle-match mulle-match.png mulle-match.sublime-project mulle-match.sublime-workspace mulle-project src test tmp.jbgUmYFd simplified CMakeLists.txt

### 0.1.5

* fix an ugly warning

### 0.1.4

* fix some bugs

### 0.1.3

* small code improvement

### 0.1.2

* update and fix test

### 0.1.1

* fix bug with build CMakeLists.txt CMakePackage.cmake dox install.sh LICENSE mulle-match mulle-match.png mulle-match.sublime-project mulle-match.sublime-workspace mulle-project README.md RELEASENOTES.md src tests tmp.m7MMdQ8d tmp.te71S9hn tmp.TE7jOCXo tmp.VAjnUgZa pattern

## 0.1.0

* improved the regexp speed once again
* do not use regexps to prune directories, like before, but just for filenames
* this greatly improves find speed


### 0.0.11

* speed up find a lot by using a proper batchsize for parallelism

### 0.0.10

* fix edit, use `MULLE_UNAME`

### 0.0.9

* adapt to singular directory name style

### 0.0.8

* fix perfomance bug, add repair command

### 0.0.7

* fix usage ugliness

### 0.0.6

* add patternfile copy

### 0.0.5

* use only -md filtering for less surprises, add bash completion

### 0.0.4

* Various small improvements

### 0.0.3

* use different format defaults

### 0.0.2

* update dox a little

### 0.0.1

* split off from mulle-monitor
