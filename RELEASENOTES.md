# 2.0.0

* code reorg and bug fixes


# 1.0.0

* big function rename to `<tool>`::`<file>`::`<function>` to make it easier to read hopefully
* support etc/share style definition directories
* bug fix for dynamic library creation
* improved definition searchpath code
* you can now install two callbacks, before the dependency folder is initalizing
* the other callback when the dependency folder is complete. Sometimes useful for post-processing shared libraries on MacOS
* uses mulle-bashfunctions 4 now
* addes some undocumented switches to build --callback, --phases, --no-parallel-phase
* the command craftorder-searchpath had been renamed to **craftinfo-searchpath**, as it searches craftinfos
* fix problem with platform "Default" not being used as default in all cases
* major update to the **status** command
* mulle-craft can now run with **zsh** as well


## 0.19.0

* new commands style and donefiles, for improved introspection
* uses craft-configuration, craft-platform, craft-sdk marks now
* support for the addiction directory being a symbolic link to the dependency directory of another related project and sharing the donefile to skip compilation of shareable projects
* more elaborate no-require marks
* use `TARBALLS` instead of `DEPENDENCY_TARBALL_PATH` now
* improved **qualifier** command and gave it a new option `--no-lf`
* added qualifier command to get the sourcetree qualifier used to match entries for the craftorder
* allow --craftorder-file NONE

### 0.18.3

* Fix phases overwriting each others logfiles

### 0.18.2

* .mulle/share/craft is now properly used as a fallback to .mulle/etc/craft

## 0.18.0

* add option --serial-make passed to mulle-make, so that ninja/make hopefully not parallelize the build


### 0.17.1

* harp more on the distinction that craft -> build is 1:n

## 0.17.0

* changed to mulle-bashfunctions 2 call convention
* moved to mulle-bashfunctions v2


## 0.16.0

* changed buildorder to craftorder for orthogonality
* changed `BUILD_DIR` to `KITCHEN_DIR` mainly for fun
* added --test / Test as a recognized configuration
* added dispensestyle relax and inverse styles prefixed with i-. This will become a formatter in the future (e.g. %sdk-%configuration/%platform)
* mulle-craft can now build for multiple platforms
* added a searchpath command


### 0.15.6

* change log directory naming again for simplicity
* output log command on compile error

### 0.15.5

* fix frivolous use of id :)

### 0.15.4

* fix no-inplace parallel build

### 0.15.3

* no-dispense mark is now inverted as inplace and therefore now the new default

### 0.15.2

* add --parallel/--serial option to execute
* use definition instead of mulle-make like mulle-make
* improved dependency folder setup and incompleteness detection

### 0.15.1

* add --parallel/--serial option to execute
* use definition instead of mulle-make like mulle-make
* improved dependency folder setup and incompleteness detection

## 0.15.0

* use definition instead of mulle-make like mulle-make
* improved dependency folder setup and incompleteness detection


### 0.14.11

* return 2 on quickstatus not ready

### 0.14.10

* improve detection of broken builds

### 0.14.9

* fix missing parallel parameters

### 0.14.8

* fix regression with -- parameter

### 0.14.7

* fix some usage calls, --craftorder-file is moved to flags for convenience

### 0.14.6

* add quickstatus command

### 0.14.5

* parallel build now handles rval 2 correctly

### 0.14.4

* no-require builds do not error anymore

### 0.14.3

* fix ...

### 0.14.2

* be more verbose on errors, allow `BUILD_DIR` and `CRAFTORDER_KITCHEN_DIR` to be a symlink

### 0.14.1

* unified installer logic

## 0.14.0

* add support for triple phase builds
* dependency.tmp is moved into the build folder
* tarballs environment variable renamed to `DEPENDENCY_TARBALL_PATH` tentatively
* add script support for mulle-make 0.7.0
* create --path option for mulle-make 0.7.0


## 0.13.0

* use `r_` functions of mulle-bashfunctions 1.8.0


## 0.12.0

* rename buildinfo to craftinfo/makeinfo to have two different terms


## 0.11.0

* support of mixed Release/Debug builds with ``<name>`_MAP_CONFIGURATIONS`


## 0.10.0

* remove -V option that was passed to mulle-make


### 0.9.2

* fix debug build with buildinfo

### 0.9.1

* craftorder no-require flag is recognized

## 0.9.0

* fixes for mingw


### 0.8.2

* pretty up code

### 0.8.1

* add `MULLE_CRAFT_MAIN_PROJECT_MAKE_FLAGS` to figure out problems in travis os x

## 0.8.0

* rename --global to --no-platform, add --no-local option


### 0.7.3

* fix multiple configuration builds

### 0.7.2

* usage bug fix

### 0.7.1

* let log output the main project logs by default

## 0.7.0

* add log command


### 0.6.23

* remove false comment

### 0.6.22

* propagate name to mulle-make

### 0.6.21

* add --touch option for clean and tidy up code a bit

### 0.6.20

* deal with them even more properly by raising an error

### 0.6.19

* deal with no-os and only-os marks properly for craftorder

### 0.6.18

* add `._.DS_Store` to .gitignore

### 0.6.17

* small style change

### 0.6.16

* improve usage

### 0.6.15

* fix capitalization on log string

### 0.6.14

* use `LC_ALL=C` for sort

### 0.6.13

* Various small improvements

### 0.6.12

* simplify README

### 0.6.11

* make README.md more lazy

### 0.6.10

* improved brew formula defintion

### 0.6.9

* add --global to search

### 0.6.8

* fix for -e operation

### 0.6.7

* fix .mulle-make detection for mainproject, can live without LOGNAME

### 0.6.6

* fix package dependencies more

### 0.6.5

* fix package dependencies

### 0.6.4

* fix homebrew install ruby script

### 0.6.3

* place .mulle-craft-built better, add search command for buildinfo

### 0.6.2

* improved build and clean

### 0.6.1

* rename install to installer, because of name conflict

## 0.6.0

* remove command 'all' ; craftorder now requires a filename


### 0.5.6

* small beauty fix

### 0.5.5

* make project the default

### 0.5.4

* distribute again

### 0.5.3

* rename install.sh to install
* rename install, improve README.md

### 0.5.1

* rename install, improve README.md

## 0.5.0

* changed the mulle-make search scheme, fix some bugs


### 0.4.2

* fix some bugs and improve bash completion

### 0.4.1

* fix some bugs and improve bash completion

## 0.4.0

* cut the dependency to mulle-sourcetree. mulle-craft now gets a craftorder file and builds that


### 0.3.13

* make the update/fetch an option instead of checking every time

### 0.3.12

* reworked clean

### 0.3.11

* reorganize build folder a bit

### 0.3.10

* need to preserve craftorder strictly, fixed that

### 0.3.9

* use canonical overview pic

### 0.3.8

* changed searchpath again, update dox a bit

### 0.3.7

* use different search paths for info-dir now

### 0.3.6

* singular directory names

### 0.3.5

* fix a quoting bug

### 0.3.4

* pass arguments after -- to sourcetree builds too for the moment

### 0.3.3

* add fetch command for explicit sourcetree updates

### 0.3.2

* * fix option handling for project

## 0.3.0

* Various small improvements


### 0.2.2

* Various small improvements

### 0.2.1

* Various small improvements

## 0.2.0

* adapt to new mulle-bashfunctions 1.3
* change info searchpaths and document it


### 0.1.1

* initial stuff
* renamed to mulle-craft so that it can cooexist with the ancestor mulle-build
* add TEST_PATH_PREFIX environment for run-test
* check for presence of mulle-xcode-settings when in xcode_mode

## 0.1.0

* initial stuff
* renamed to mulle-craft so that it can cooexist with the ancestor mulle-build
* add TEST_PATH_PREFIX environment for run-test
* check for presence of mulle-xcode-settings when in xcode_mode


### 3.14.3

* OPTION_SKIP_MULLE_BOOTSTRAP is default NO if it looks like there was never a bootstrap

### 3.14.2

* Various small improvements

## 3.14.0

* depends on mulle-bootstrap 3.14 for tmp mechanism functions


### 3.13.3

* improve -V trace and environment dump

### 3.13.2

* fix --homebrew not building dependencies (or will I regret this soon) ?

### 3.13.1

* use ninja for sublime

## 3.13.0

* add mulle-sublime (mulle-craft -sublime) to the commands


### 3.12.3

* use --no-build also for tests

### 3.12.2

* MAKEFLAGS and CMAKEFLAGS instead of MAKE_FLAGS and CMAKE_FLAGS for cultural compliance

## 3.12.0

* improve mingw compatibility

## 3.11.0

* improve working with multiple Xcode projects


### 3.9.2

* fix URL install and travis

### 3.9.1

* specify different or multiple rebuild files to watch with .dependencies.inc

## 3.9.0

* cleaned up a lot of options, some old favorites may be gone
* improved install


## 3.8.1

* check if src/dependencies.inc has been changed by the build, and if yes
rebuild once more

## 3.8.0

* when installing or homebrewing, **mulle-install** always trys to mirror git repos
if only temporary for the sake of faster fetches
* also cleanup test directory build folders, still need something to clean
tests output
* wipe the cmake cache, if any CMake*.txt files have been edited. Hopefully
this avoids a lot of grief I am suffering... :)
* add --no-bootstrap --build-dir options to use mulle-craft to be run in
build-test.sh


### 3.7.0

* pass --debug to run-test
* never skip bootstrap when doing mulle-install
* fixed some typos

3.6.4
=====

* fixed `version`
* added `minimum-bootstrap-version` for packaging
* added CMakeLists.txt for packaging on Linux


3.6.3
=====

* run_install is a little more complex than I remembered...

3.6.2
=====

* fix install

3.6.0
=====

* keep version number similiar to mulle-bootstrap


3.4.1
=====

* Improve finding of the tests folder.
* mulle-craft --tests-path will output the tests folder path
* Improve output of paths from ./run-test.sh
* mulle-update is too dangerous and it's a goner


3.1.0
=====

Keep version in lockstep with mulle-bootstrap for the moment.

3.0.0
=====

Lot's of changes to be in lock-step with mulle-bootstrap. One nice feature
gained is mulle-analyze (you need mulle-scan-build or scan-build) for it to
work.

0.10.5
=====

More stupidity fixes..

0.10.4
=====

Aimless dicking around with --prefix and --homebrew, because I am kind of
on holiday and brain is turned off. Sorry.


0.10.3
=====

Fix a version check

0.10.2
=====

--homebrew and --prefix are no mutually incompatible, which makes
the most sense.

0.10.1
=====

--homebrew option needs to be after --prefix for linuxbrew
compatibility.


0.10.0
=====

Depends now on mulle-bootstrap 2.5 and incorporates internal changes to
support it.
mulle-install is now more efficient installing single libraries, that do
not need to fetch the dependencies.

--no-build-dependencies does not imply --no-install-dependencies anymore.


0.9.2
=====

* the -e option now also adds the prefix/include and prefix/lib directories
to the search path.


0.9.1
=====

* fix --homebrew flag for linux

0.9.0
=====

* use eval exekutor for cmake/make to protect parameters
* add --homebrew switch to fix mulle-clang builds inside homebrew


0.8.2
=====

* protect homebrew shims from PATH shenanigans
* improve fail output


0.8.1
=====

* pass all flags -D*|-W* to cmake

0.8.0
=====

* mulle-craft assumes mulle-bootstrap is installed besides it, if it is, that
becomes its preferential path for it
* allow to specify cmake commandline flags with -DCMAKE (will not get passed
to mulle_bootstrap)
* add --dump-environment as a debug option

0.7.0
=====

* adapt to mulle-bootstrap 2.4.0

0.6.1
=====

* pass --debug to ./build-test.sh

0.6
=====

* added mulle-status, because I use it so often
* adapt to changes in mulle-craft


0.5.3
=====

* mulle-update is more verbose and better at detecting remotes, who are not
named "origin"

0.5.2
=====

* be more verbose when tagging

0.5.1
=====

* fix use of CMAKE_INSTALL_PREFIX
* remove some unnecesary refresh calls to make things go faster

0.5
===

Mostly changes how flags are interpreted and passed to mulle-bootstrap.

* change -nb flag to -nbd

0.4
===

* Much improved documentation
* Fix mulle-clean a bit

0.3
===

* base code on mulle-bootstrap library functions for exekutor and logging
* add multiple options
* check for mulle-bootstrap version
* rename project from mulle-install to mulle-craft
* do local command first, mulle-bootstrap later (f.e. for tagging). That way
more numerous local failures don't dirty dependencies.
* this version needs to be pushed out now, because I need it in travis.yml

0.2
===

* allow to specify a tag and a scm for URL install
