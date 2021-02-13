### 1.8.3

* up to 3000 github tags can be fetched now, instead of 30 as before

### 1.8.2

* improved tar info output a little bit

### 1.8.1

* installer verbose toggle

## 1.7.0

* changed to mulle-bashfunctions 2 call convention
* moved to mulle-bashfunctions v2
* new command "exists"


### 1.6.10

* dont warn on symlink if branch is latest or master
* small beauty fixes in output and code

### 1.6.9

* git does not need to be installed anymore for the sourcetree support functions

### 1.6.8

* check for git presence before failing in a more obscure way

### 1.6.7

* improved typeguess from url
* improve nodetype guessing a little bit

### 1.6.6

* Various small improvements

### 1.6.5

* fix `source_validate_file_url`

### 1.6.4

* fix default git branch checkout, be less verbose on fetch

### 1.6.3

* can now fetch repositories who dont have master

### 1.6.2

* a bit less verbose when fetching

### 1.6.1

* better search-local with file:// urls

## 1.6.0

* support file:// for local search
* rename list to showcommand


## 1.5.0

* improved debian packaging with recommends. uses mulle-bashfunctions 1.8.0 now


### 1.4.3

* fixes for mingw

### 1.4.2

* remove obsolete verbose output

### 1.4.1

* internal rename of clone command to fetch

## 1.4.0

* rename `MULLE_FETCH_CACHE_DIR` to `MULLE_FETCH_ARCHIVE_DIR` (as used by rest of mulle-sde)


### 1.3.25

* use more exekutor wrappers for git commands

### 1.3.24

* nicer output

### 1.3.23

* add `._.DS_Store` to .gitignore

### 1.3.22

* add support for gitlab.com archive guessing

### 1.3.21

* improve usage info

### 1.3.20

* remove file from git

### 1.3.19

* simplify README

### 1.3.18

* improved brew formula defintion

### 1.3.17

* use wget if curl is not available

### 1.3.16

* fix package dependencies more

### 1.3.15

* fix package dependencies

### 1.3.14

* fix homebrew install ruby script

### 1.3.13

* rename install to installer, because of name conflict

### 1.3.12

* small beauty fix

### 1.3.11

* improve CMakeLists.txt, update README.md, rename install.sh to install

### 1.3.10

* simpler CMakeLists.txt

### 1.3.9

* fix usage bug

## 1.4.0

* be more convenient, by supporting mulle-fetch `<url>`


### 1.3.8

* fix potential bugs

### 1.3.7

* README fix

### 1.3.6

* miniscule code improvement

### 1.3.5

* use `MULLE_UNAME` instead of UNAME

### 1.3.4

* improve documentation

### 1.3.3

* unify mulle-bashfunctions-env usage and help, also some refactoring

### 1.3.2

* * make help command/option more uniform

## 1.3.0

* improve gitlist recognition


## 1.2.0

* use new mulle-init from mulle-bashfunctions to reduce init size


### 1.1.6

* Various small improvements

### 1.1.5

* improved name guessing of github archives

### 1.1.4

* libexec-dir is now used properly instead of library-path

### 1.1.3

* fix test bug and some uglies

### 1.1.2

* Various small improvements

### 1.1.1

* improve documentation a bit
* two new plugins, local and file

## 1.1.0

* rename test runner, add travis, general improvements too


# 1.0.0

* forked off from mulle-bootstrap. based on mulle-bashfunctions 1.0.0
