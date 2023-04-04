# 2.0.0

* allow mulle-make to pick up `DEFINITION_...` values from the environment (can be disabled with --clear)
* better support for pkg-config
* better support for cleaning


### 1.1.1

* fix command -v being used with mudo

## 1.1.0

* add build --analyze flag for scan-build/mulle-scan-build
* some fixes for Windows


# 1.0.0

* big function rename to `<tool>`::`<file>`::`<function>` to make it easier to read hopefully
* enables an 'aux' definition directory, to support share/etc style definition placements
* mulle-make will no longer clobber an existing build directory, that it hasn't created itself
* the autoconf plugin now looks to a bootstrap script in addition to autogen.sh, still prefering autogen.sh though
* definition **remove** is now definition **unset**. That was necessary because a remove may reestablish a default value, where as an unset really NULLs the value so to speak
* experimental support to build Makefile projects
* recognizes and forwards the ``OTHER_CFLAGS`` (as well as CPP, CXX, LD) environment variables
* ninja will not be used by default, unless the version is >= 1.11 (which is not released yet)
* runs with zsh if bash is not installed
* if there are no headers to install, ninja install will be skipped in the cmake Headers phase, which circumvents a useless error
* mulle-make uses mulle-bashfunctions 4 now


## 0.16.0

* Various small improvements


## 0.15.0

* "project" is now the 'official' default command name and not the synonymous make/build
* scripts are now called with --logfile and --teefile arguments *BREAKING CHANGE*
* logfiles are now more usefully numbered to enable mulle-sde log to show them all in proper succession


### 0.14.4

* fix overview picture

### 0.14.3

* modernize overview picture

### 0.14.2

* add debug output for travis strangeness

### 0.14.1

* update README a tiny bit

## 0.14.0

* -D defined variables ending in `_PATH` or `_FILES` undergo a substitution of : to ;

## 0.13.0

* definitions read from files are evaled now
* add --serial option, so that ninja/make don't paralleliz build for easier log reading

## 0.12.0

* add --serial option, so that ninja/make don't parallelize build for easier log reading
* do not use CC/CXX/LD environment variable values to pass to cmake, since this is superflous
* somewhat more flexible handling of the script searchpath (you could use subdirectories now) e.g. bin/craftinfo/foobar-build

## 0.11.0

* changed to mulle-bashfunctions 2 call convention
* moved to mulle-bashfunctions v2
* ask mulle-env for the location of ETC SHARE and VAR directories


### 0.10.2

* fix bug

### 0.10.1

* mulle-make without command and options is now promoted to mulle-make build

## 0.10.0

* fixed a lot of quoting problems
* general improvements with respect to building iphoneos libraries
* you can now specify a platform in addition to configuration and sdk


### 0.9.3

* do not emit --sdk macosx if no or Default sdk is defined on darwin

### 0.9.2

* try to fix tty problems when compiling with sued user

### 0.9.1

* use .mulle definition now instead of mulle-make
* will consider .mulle/etc/craft/definition my default now if not invoked by mulle-craft

## 0.9.0

* use .mulle definition now instead of mulle-make
* will consider .mulle/etc/craft/definition my default now if not invoked by mulle-craft


### 0.7.2

* improve README.md

### 0.7.1

* multiple -D+= definitions dont overwrite each other, they append now

## 0.7.0

* improved logfile output
* suppress cmake undefined CLI values by default (reenable with -v)
* support three phase cmake builds
* rename "plugins" command to "show"
* rename --info-dir to --definition-dir
* added --phase support for cmake
* new and more powerful definition commands
* list is now listing the definitions
* add -l option for ninja
* purge some of the old shortcut options, because they were never used and obscure ninja/make flags
* BUILDPATH is no longer silently constructed from `DEPENDENCY_DIR,` let mulle-craft do that
* fix and simplify option overriding in cmake plugin
* add script plugin, to accomodate build systems mulle-make does not accomodate


### 0.6.1

* export `CMAKE_INCLUDE_PATH` again for mulle-c11

## 0.6.0

* use `r_` functions of mulle-bashfunctions 1.8.0


### 0.5.2

* add `${DEPENDENCY_DIR}/${configuration}/bin` to BUILDPATH

### 0.5.1

* improve usage information

## 0.5.0

* Various small improvements


### 0.4.27

* configure must use "real" make on mingw (mingw32-make)

### 0.4.26

* rename build to project, so that it fits better with mulle-craft lingo
* fixes for mingw

### 0.4.25

* allow NONE for --info-dir option

### 0.4.24

* use .log as default logdir

### 0.4.23

* smallish improvement

### 0.4.22

* logfile name is much smaller now, fix possible bug with cpp options

### 0.4.21

* improve startup speed, cmake: find more errors to display

### 0.4.20

* protect case globs from extglob

### 0.4.19

* use `LC_ALL=C` for sort

### 0.4.18

* remove file from git

### 0.4.17

* simplify README

### 0.4.16

* improved brew formula defintion

### 0.4.15

* fix broken completion script

### 0.4.14

* fix proper order of defining `MULLE_MAKE_PROJECT_DIR` and reading the info-dir

### 0.4.13

* expose environment in logs for all plugins

### 0.4.12

* add keys subcommand to definition

### 0.4.11

* fix `MULLE_MAKE_PROJECT_DIR` export also `MULLE_MAKE_DESTINATION_DIR`

### 0.4.10

* smallish doc upgrades for mulle-sde

### 0.4.9

* remove some debug code

### 0.4.8

* expose `MULLE_MAKE_PROJECT_DIR` for convenience

### 0.4.7

* fix package dependencies more

### 0.4.6

* fix package dependencies

### 0.4.5

* fix homebrew install ruby script

### 0.4.4

* fix README.md

### 0.4.3

* improved debug

### 0.4.2

* rename install to installer, because of name conflict

### 0.4.1

* rename install.sh to install, fix bug

## 0.4.0

* initial rudimentary support for .mulle-make management


### 0.3.12

* fix potential bug

### 0.3.11

* fix quoting problem

### 0.3.10

* mulle-make gains a print command

### 0.3.9

* And back to .mulle-make being used ...

### 0.3.8

* mulle-make does not look for a default .mulle-make folder anymore

### 0.3.7

* Various small improvements

### 0.3.6

* use -n as shortcut for --project-name in all mulle- tools

### 0.3.5

* don't use ninja for autoconf projects

### 0.3.4

* small clean up

### 0.3.3

* unify mulle-bashfunctions usage

### 0.3.2

* * make help command/options more uniform

## 0.3.0

* use new mulle-init from mulle-bashfunctions to reduce init size


### 0.2.2

* Various small improvements

### 0.2.1

* libexec-dir is now used properly instead of library-path

## 0.2.0

* fix configure environment flag passing
* add experimental support for meson


### 0.1.2

* fix tests for linux

### 0.1.1

* Various small improvements

# 0.1.0

* Various small improvements
