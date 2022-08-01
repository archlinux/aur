## 4.1.0

* some fixes for zsh
* new commands mulle-bin-dir and mulle-libexec-dir for script support
* new environment::get options for script support


### 4.0.2

* fix installer (?)

### 4.0.1

* fix version check for new version 4
* big function rename to `<tool>`::`<file>`::`<function>` to make it easier to read hopefully
* added invoke command to substitute env -i
* add `MULLE_USERNAME` to list of exported/injected environment variables
* new **doctor** command
* used mulle-bashfunctions 4 now
* compatible with zsh and will run zsh, if bash is not installed

# 4.0.0

* big function rename to `<tool>`::`<file>`::`<function>` to make it easier to read hopefully
* added invoke command to substitute env -i
* add `MULLE_USERNAME` to list of exported/injected environment variables
* new **doctor** command
* used mulle-bashfunctions 4 now
* compatible with zsh and will run zsh, if bash is not installed


## 3.4.0

* clarify distinction between os (host) and plaform (target) a bit
* allow environment set FOO=1 along with set FOO 1
* protect and unprotect files a bit more cleverly
* there is now a hardcoded scope, so we can list hardcoded values
* the "project" and "extension" scopes are now known to mulle-env
* new option --protect-flag to speed up mulle-sde init


### 3.3.2

* preserve leading whitespace on -C arguments

### 3.3.1

* improve info for tools a bit

## 3.3.0

* allow entry of environment if required tool is missing with -f


### 3.2.1

* fix PATH for tight/restrict/inherit to include .env/bin (again)
* tight now forwards LOGNAME, because environment files and style command needs it

## 3.2.0

* add --search-here, mostly for calling mulle-tool-env
* there are now shortcut commands get/set/list for environment get/set/list
* the var directories can be rerouted outside of the project by setting `MULLE_ENV_HOST_VAR_DIR` and `MULLE_ENV_VAR_DIR`


# 3.0.0

* added scope command
* project file (mulle-sde) moves from share to etc, which is an incompatible change
* mudo gains the -f flag so you can run mudo outside of environments
* remove --share opion from environment commands
* add --if-missing to environment add command
* add --create-file to environment add command
* pass-thru NO_COLORS environment variable

## 2.6.0

* improved setting of comment text for `environment set`
* new command "local"
* enable per-project bash history
* fix mudo quoting
* add -aef option to add temporary environment
* new command "local"
* use 4 instead of 2 as error return code to distinguish from shell error code 2
* -ef can now accept an absolute path, which will bypass searches in .mulle


### 2.5.1

* remove --no-search from flags

## 2.5.0

* moved to mulle-bashfunctions v2
* use stubs instead of symlinks for windows native executables
* make it possible to move .mulle/var somewhere else

## 2.4.0

* mudo gains the -e flag to call executables with the "outside" environment


### 2.3.1

* remove environment key in proper reverse file order

## 2.3.0

requires mulle-bashfunctions 1.11.0

* fix escaping problem
* relax and strict switch meanings, because relax sounds looser than strict, but wasn't
* added a reset command, to fix broken symlinks from the outside
* allow addition of multiple tools with --csv option
* pass `MULLE_NO_COLOR` through environment, give style -h flag
* proper environment get
* proper sed replacement escape support
* fix some more protection problems
* fix problems when rsyncing projects across platforms

### 2.2.7

* fix another protection problem

### 2.2.6

* tool defaults to list command, fix protect problem

### 2.2.5

* improved upgrade experience when little things go wrong

### 2.2.4

* fix incomplete subshell entry

### 2.2.3

* improved verbosity when logging

### 2.2.2

* fix wrong error function call

### 2.2.1

* remove optionaltool on migration

## 2.2.0

* proper tool migration to 2.2


### 2.1.2

* fix plentfiful regressions

### 2.1.1

* fix plugin tools not being reconsidered after init

## 2.1.0

* reworked the tool command


### 2.0.2

* resolve plugin installdir path

### 2.0.1

* don't protect bindir anymore, since its in var now
* use common .mulle folder instead of .mulle-env

# 2.0.0

* use common .mulle folder instead of .mulle-env


### 1.0.17

* ... and fix awk

### 1.0.16

* fix awk for mawk, which dont like substr index 0

### 1.0.15

* fix README.md

### 1.0.14

* fix wrong optionality filename check

### 1.0.13

* reinstate ed and vi as optional developer tools

### 1.0.12

* remove command, ed and vi from developer tools

### 1.0.11

* mingw can only do wild, as it has no symlinks

### 1.0.10

* use /tmp in developer mode

### 1.0.9

* fix tool placement, recognize src `MULLE_ENV_LIBEXEC_DIR`

### 1.0.8

* install-dir instead of installpath

### 1.0.7

* fix plugins path in installer

### 1.0.6

* fix typo in installer :/

### 1.0.5

* provide plugins directory for external plugins

### 1.0.4

* add plugin-searchpath and plugin-installpath commands

### 1.0.3

* use -D defines as environment during init

### 1.0.2

* debug installer for mulle-env

### 1.0.1

* fix wrong plugin search path, add plugins-path command

# 1.0.0

* -D is ignored on init with warning now
* mulle-env doesnt climb to a parent environment by default anymore
* make mulle-env as a command available in the subshell (developer)
* also expose `MULLE_HOSTNAME` because its used in mulle-sde so much
* added the long missing environment remove command and add some tests too
* finally move mulle.sh plugin to mulle-sde, where it belongs
* redo the way script mode is invoked to fix redirection problem
* plugins can now be easily installed via /share and custom plugin path


## 0.17.0

* use `r_` functions of mulle-bashfunctions 1.8.0


### 0.16.2

* improve usage info

### 0.16.1

* fixes for mingw

## 0.16.0

* rename scopes to scope, improve usage info a little


### 0.15.7

* improve usage a bit

### 0.15.6

* fix PATH bug

### 0.15.5

* dont show reload info in non-interactive shells

### 0.15.4

* unset `MULLE_USER_PWD` and fix some texts

### 0.15.3

* fix aux set code

### 0.15.2

* slightly improved error messages

### 0.15.1

* cd w/o parameter now goes to `MULLE_VIRTUAL_ROOT`

## 0.15.0

* add -D option to define environment variables on the fly


### 0.14.1

* fix aux list, export PATH propely for mulle plugin

## 0.14.0

* reintroduction of environment-aux fot plugin env values, improved usage info


### 0.13.11

* mulle-plugin modifies PATH for dependency/bin ...

### 0.13.10

* return status from -c command properly

### 0.13.9

* use scope host instead of hostname

### 0.13.8

* Various small improvements

### 0.13.7

* simplify README

### 0.13.6

* improved brew formula defintion

### 0.13.5

* add mudo to CMakeLists.txt

### 0.13.4

* separate is now default, and default is merged for environment list

### 0.13.3

* dont attempt terminal title sets in script

### 0.13.2

* delete empty value for real now, because empty values mess up overrides

### 0.13.1

* add -C option for passing in command lines

## 0.13.0

* mulle-env -c behaves now like sh -c with respect to variable expansion etc (need to reinit\!)


### 0.12.6

* deal better with absence of USER env var

### 0.12.5

* add missing file to distribution

### 0.12.4

* fix package dependencies more

### 0.12.3

* fix package dependencies

### 0.12.2

* fix homebrew install ruby script

### 0.12.1

* rename install to installer, because of name conflict

## 0.12.0

* Separate environment-project.sh file for mulle-sde


### 0.11.19

* rename install.sh to install

### 0.11.18

* simplified CMakeLists.txt
* add subenv command to eventually support subprojects

### 0.11.17

* fix bug in list, add experimental --output-command

### 0.11.16

* add toolstyls and envstyles command for completion

### 0.11.15

* fix README

### 0.11.14

* improve README

### 0.11.13

* fix dox, fix an ugly

### 0.11.12

* use : as += value delimiter, allow addition

### 0.11.11

* list as single quoted environment variables

### 0.11.10

* fix problems when cding out of the wilderness

### 0.11.9

* fix -c execution, make bin/libexec dependent on hostname

### 0.11.8

* bug fix

### 0.11.7

* fix single quote escapes for sed output

### 0.11.6

* do not write protect share for the benefit of git checkouts

### 0.11.5

* make it possible to append to envionement variables

### 0.11.4

* don't clobber share on init -f, gain reinit command

### 0.11.3

* mulle-env gains environment-aux.sh and a cd catcher

### 0.11.2

* some fixes for different style with / instead of :

### 0.11.1

* update documentation a little

## 0.11.0

* style scheme now uses / as separator for easier bash completion
* experimental bash completion now available


### 0.10.8

* * fix option handling for project, lose .bak seds

### 0.10.6

* improved grokability of mulle-env by subdividing plugins

### 0.10.1

* Various small improvements

## 0.10.0

* change environment file scheme a bit to make it easier for --output-eval
* moved tool from mulle-sde to mulle-env where it belongs
* added environment editing functionality

## 0.9.0

* renamed restricted to restrict


### 0.8.1

* adapt to new mulle-bashfunctions 1.3

### 0.7.4

* improve README.md a bit
* optional tools added
* use --posix mode to avoid SYS_BASHRC backdoor on debian/linux
* add mudo command
* improve TRACE facility
* add environment-aux.sh to read files

### 0.7.3

* optional tools added
* use --posix mode to avoid SYS_BASHRC backdoor on debian/linux
* add mudo command
* improve TRACE facility
* add environment-aux.sh to read files

### 0.7.2

* use mulle-craft instead of mulle-build now

### 0.7.1

* various bugfixes

## 0.7.0

* moved to a plugin architecture


## 0.6.0

* fix stuff for newer mulle-project, don't depend on cmake for install (necessarily)
* changed name to mulle-env for clarity of purpose
