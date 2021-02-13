## 3.3.0

* r_resolve_all_path_symlinks added


### 3.2.1

* use sysctl for loadavg on freebsd/darwin

## 3.2.0

* added `remove_duplicate_lines` functions
* changed/fixed parameter order in `merge_line_into_file` now line,file
* keep `exekutor_print` output down to 240 characters
* added `logging_tee_eval_exekutor` from mulle-make
* upped cmake requirement ot 3.13


### 3.1.1

* no color if TERM is dumb + one obvious bug fix in `merge_line_into_file`

## 3.1.0

* added `r_expanded_string` to do eval printf -v a bit more safely


### 3.0.1

* remove unused `add_cmake_path` and `add_cmake_path_if_exists`
* added `file_is_binary` to file functions
* the `logging_tee_eval_exekutor` has moved to mulle-make as it is only used there
* lost the init command, this is now handled by `mulle-sde add`, consequently had to up the version to 3
* `_init` now should call main via `call_main` to enable insertion of FLAGS via environment
* use ``NO_COLOR`` instead of ``MULLE_NO_COLOR`` since its a standardization attempt i can deal with

# 3.0.0

* added `file_is_binary` to file functions
* the `logging_tee_eval_exekutor` has moved to mulle-make as it is only used there
* lost the init command, this is now handled by `mulle-sde add`, consequently had to up the version to 3
* `_init` now should call main via `call_main` to enable insertion of FLAGS via environment
* use `NO_COLOR` instead of `MULLE_NO_COLOR` since its a standardization attempt i can deal with


### 2.0.2

* symlink resolver fix

### 2.0.1

* fix wrong caseconversion

# 2.0.0

* version 2
* remove `r_prepend_path_if_relative`
* remove some old unused functions for version 2
* standardize on `r_dirname` and `r_basename` and remove all the other variations
* redo mulle-init to use RVAL functions
* fix some bugs found by shellcheck


## 1.12.0

* mulle-bashfunctions-env gains an init command for quick script setup


## 1.11.0

* `find_item` added
* `r_basename` and `r_dirname` supplant `r_basename` and `r_dirname`
* improved the old array code with less backticks
* improved quoting code
* added `r_available_core_count` with heuristics
* added `log_grep_warning_error` for mulle-make
* exekutor routines now set `MULLE_EXEKUTOR_RVAL` for status
* fix escaping but in `de_camel_case`
* add `r_remove_lin,`  `r_add_unique_line` , `r_reverse_lines`
* change `filepath_concat` to respect trailing / if part of filename
* use $'\n' instead of literal linefeed
* removed unused function `write_protect_directory`


### 1.10.4

* `path_extension` returns empty on no path extension now

### 1.10.3

* add some missing files

### 1.10.2

* improved exekutor output with nicer quoting
* `MULLE_HOSTNAME` is prefixed with `'_'` if the first character is '.'
* add -t- and -l- option to negate debug flags
* renamed `reval_exekutor` to `eval_rexekutor`

### 1.10.1

* `MULLE_HOSTNAME` is prefixed with `'_'` if the first character is '.'
* add -t- and -l- option to negate debug flags
* renamed `reval_exekutor` to `eval_rexekutor`

## 1.10.0

* add -t- and -l- option to negate debug flags
* renamed `reval_exekutor` to `eval_rexekutor`


### 1.9.1

* fix installer

## 1.9.0

* support for parallel execution of commands
* moved some unused code to mulle-legacy.sh
* tmpfile support with RVAL interface
* version support with RVAL interface


## 1.8.0

* Various small improvements


## 1.7.0

* add `redirect_eval_exekutor`
* `inplace_sed` moved to mulle-file.sh to fix problems on freebsd

### 1.6.3

* fixes for mingw
* fix hostname for mingw

### 1.6.2

* fix hostname for mingw

### 1.6.1

* small cleanups

## 1.6.0

* add `MULLE_USER_PWD` and mulle-case.sh


### 1.5.7

* fix installer rename in brew formula

### 1.5.6

* add bash and uuidgen dependencies for debian

### 1.5.5

* fix README.md

### 1.5.4

* rename install to installer, because of name conflict

### 1.5.3

* fix README.md some more

### 1.5.2

* fix README.md

### 1.5.1

* improve README, rename install.sh to install

## 1.5.0

* add `escaped_singlequotes,` add `MULLE_HOSTNAME`


## 1.4.0

* add escaping function and `sed_inplace` replace
* fix display bugs


### 1.3.2

* less confusing pid logging in exekutors
* don't use gratuitous subshell in eval exekutors if they can be avoided

### 1.3.1

* use MULLE_UNAME instead of UNAME in the future

## 1.3.0

* improve startup time greatly
* avoid globbing problems in for loops
* fast_dirname and basename -- added


### 1.2.3

* make minimal loading possible, useful for many scripts
* fix bugs in versioning checks

### 1.2.2

* fix bad and superflous mktemp use

### 1.2.1

* fix for filepath concat

## 1.1.0

* improved concat
* remove snip, which is too specialized and was buggy
* add path_extension


# 1.0.0

* Initial spin-off from mulle-bootstrap. Heavily under-documented
