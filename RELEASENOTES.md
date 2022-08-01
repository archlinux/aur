## 1.1.0

* added mulle-sourcetree-edit-csv and friends


# 1.0.0

* big function rename to `<tool>`::`<file>`::`<function>` to make it easier to read hopefully
* list has now a -m option
* experimental support for os-specific config files
* implemented having a different config by uname, if so desired (needs reflect on each platform though)
* cmake now used no-dynamic-link and no-static-link for `find_library`
* fix wrong zombification, which means that mulle-sourcetree now doesn't refetch a lot of stuff gratuitously anymore *HUGE IMPROVEMENT*
* removed parallel clean because of an as of yet undiagnosed problem with it
* advertise tool in generated file
* added a **diff** command
* the status gained --shallow and --deep flags
* the sync operation can perform some node syncs in parallel now (turn off with --serial)
* needs mulle-bashfunctions 4.0.0 now
* runs with zsh when installed, which can double the speed of sourcetree walk operations


## 0.25.0

* change/fix --no-bequeath --bequeath flags so it does what it promises to do and not the opposite
* make column command optional


### 0.23.1

* fix indent for includes
* fix FreeBSD ifdef from `BSD4_3` to `__FreeBSD__` `(BSD4_3` now defined by Apple)

## 0.23.0

* support a local header overriding the dependency header for stealing sources
* added readwrite flag for writing protecting fetched content
* if `MULLE_SOURCETREE_TO_C_INCLUDE_FILE` is set to DISABLED then #include statements will appear in the #import file. Sames with private.


### 0.22.1

* add bequeath/no-bequeath to craftorder
* actually use bequeath mode in the walker code
* **the default reflection output directory is now cmake/reflect and src/reflect instead of cmake/ and src/**

## 0.22.0

* **the default reflection output directory is now cmake/reflect and src/reflect instead of cmake/ and src/**


## 0.21.0

* improved dotdump command
* fix share repositories being put to the graveyard too soon, which made syncs slower
* rewrote wrapping code to also wrap the tag, which will be more used than the branch wrap, which still exists
* sped up the walk a little
* you can now use `MULLE_TAG_OR_BRANCH` to evaluate URLs
* improved cmake `find_library` code emitter


### 0.20.1

* make marks behave additive/subtractive when given as --marks to the add command

## 0.20.0

* changed to mulle-bashfunctions 2 call convention
* moved to mulle-bashfunctions v2
* ask mulle-env for the location of ETC SHARE and VAR directories
* New marks no-bequeath, no-intermediate-link, no-dynamic-link
* Change echo pervasively to printf as to circumvent surprises if variables start with a minus
* Added wrap command to wrap nodetypes branches and URLs in environment variables
* -—stash-dir is now a synonym for —share-dir, which is deprecated
* Added commands etc-dir, project-dir, var-dir, stash-dir
* Improved cleaning again, added option —config
* Allow nodetype to be wrapped in an environment variable
* mulle-sourcetree-to-c: improved generated info text in headers
* mulle-sourcetree-to-cmake: improved generated info text in headers
* mulle-sourcetree-to-cmake: is now aware of the new no-bequeath mark


### 0.19.1

* make `NO_CMAKE_SYSTEM_PATH` configurable with mark no-suppress-system-path

## 0.19.0

* use in-order walk instead of post-order for craftorder
* try to get cmake to find dependency/lib first before searching system dirs (projects need update)
* fix bury code for osx if symlinks are involved (aka /tmp -> /private/tmp)


### 0.18.1

* mulle-sourcetree-to-c produced header code protects `__has_include` with #ifdef `__has_include`

## 0.18.0

* renamed buildorder to craftorder to keep this stringent
* unified output format specification with --output-format `<fmt>` instead of many different switches
* improved generation of header files
* allow limited regexp with --match for mark unmark and set
* improved command output
* bugfixed list command quite a bit
* majorly improved sourcetree walk facilities, like walk modes and deduping
* add mark no-bequeath to allow local redefinition of marks without propagation
* redid the sourcetree walker for greater readability and more speed
* commit fix duplicate emission of comment, fix wrong setting name in comment
* there is now a rename command
* more options for listing
* branch and tag are now evaled
* branch and tag are available for expansion in url as `MULLE_BRANCH` and `MULLE_TAG`
* similiarly fetchoption can be expanded with both and additionally `MULLE_URL`
* major performance improvement in the sourcetree buildorder generator


### 0.17.7

* improved clean code

### 0.17.6

* a bit less verbose on callback

### 0.17.5

* fix a verbosity annoyance

### 0.17.4

* add --no-callback-trace to walk as the output got tedious for buildorder

### 0.17.3

* fix installer script

### 0.17.2

* be less harsh if there is no sourcetree

### 0.17.1

* config files can be scoped to an OS when in dire straits
* aliases need to include the name, so you can determine the lookup order
* buildorder is now using breadth-first for marks and in-order for filename to make things easier
* support various dedupe options
* `sourcetree::node::printf` can print environment variables now with %v{ENVNAME,,}
* many commands lose the unused filter options --marks --nodetypes and --permissions
* there is now a duplicate command for nodes
* node typeguess is a bit better now
* when tar is available, graves are now archived and zipped
* the list command has seen a complete overhaul can now do recursive listings
* the qualifier has been split into a visit qualifier and a descend qualifier
* use .mulle instead of .mulle-sourcetree
* do not require -e anymore
* enable output of filename in status

## 0.17.0

* use .mulle instead of .mulle-sourcetree
* do not require -e anymore
* enable output of filename in status


### 0.16.2

* add desecrate command

### 0.16.1

* keep symlink alive if kept

## 0.16.0

* keep symlinks as long as the filename doesn't change
* performance improvements due to new mulle-bashfunction use
* update is now called sync, to unconfuse this with mulle-sde update
* experimental support for version checking with new VERSION filter command


### 0.15.1

* document two environment variables

## 0.15.0

* use `r_` functions of mulle-bashfunctions 1.8.0


### 0.14.6

* add no-cmakeadd no-cmakeloader to known flags

### 0.14.5

* improve usage info a bit

### 0.14.4

* fix local address getting mangled

### 0.14.3

* recognize some no-os- variant marks

### 0.14.2

* fix for mingw

### 0.14.1

* fix a bug when burying zombies experimentally add fetch-`<uname>` mark
* buildorder is now more clever about producing `MULLE_SOURCETREE_STASH_DIR` prefixed paths

### 0.13.1

* fix update flag and erroneous error message when cleaning

## 0.13.0

* add knownmarks command, renamed --extended-marks to --extended-mark


### 0.12.2

* make no-public known

### 0.12.1

* touch parent configs when config changed

## 0.12.0

* rewrote update, to enable sharing of symlinked repositories


## 0.11.0

* add --qualifier option to filter marks more cleverly, you can still use --marks though in limited cases
* add --callback option to buildorder


### 0.10.1

* fix subprojects dependencies not being properly shared

## 0.10.0

* improved symlink handling in the walker a lot, which has positive implications through out mulle-sourcetree
* local nodes are not silently augmented with required marks, but instead an error is thrown


### 0.9.10

* simplified code a little, improved add command semantics

### 0.9.9

* use `LC_ALL=C` for sort

### 0.9.8

* remove file from git

### 0.9.7

* simplify README

### 0.9.6

* improved brew formula defintion

### 0.9.5

* need bsdmainutils on debian for column

### 0.9.4

* fix package dependencies more

### 0.9.3

* fix homebrew install ruby script

### 0.9.2

* rename option --marks to --output-marks for buildorder

### 0.9.1

* rename install to installer, because of name conflict

## 0.9.0

* Allow output-no- as well as no-output- for list options
* Fix problem with share inside no-share


### 0.8.5

* remove filename from status output

### 0.8.4

* fix dox and install

### 0.8.3

* rename install.sh to install, fix trace bug

### 0.8.2

* CMakeLists.txt CMakePackage.txt LICENSE Makefile README.md RELEASENOTES.md TODO.md benchmark bin build install.sh movies mulle-column mulle-project mulle-sourcetree mulle-sourcetree-overview.dot mulle-sourcetree-overview.png mulle-sourcetree.sublime-project mulle-sourcetree.sublime-workspace pic.png research src test tmp.62MuALC5 tmp.8TihBMhs tmp.8meNZ6Gb tmp.EaPl8Kw5 tmp.FJzuDhTS tmp.JBcS0N48 tmp.LX05Aq2p tmp.LfE1PWHv tmp.Me6QNGhI tmp.TNU1AnKf tmp.dxYEPghb tmp.gHlgWdiP tmp.mz667t1s tmp.qbWLdiJX tmp.rXe64Rrl tmp.ruRELjzu tmp.tqRbdouz tmp.ueLGLOck tmp.ytNCkWea simplified CMakeLists.txt, simplify printf stuff

### 0.8.1

* fix some bugs

## 0.8.0

* add dbstatus command


### 0.7.15

* considerable speed improvements

### 0.7.14

* fix test

### 0.7.13

* fix README

### 0.7.12

* address prefixed with . is not allowed, as the mulle tools depend on that

### 0.7.11

* fix CMakeLists.txt

### 0.7.10

* support no-all-load

### 0.7.9

* add move command

### 0.7.8

* fix bug with only-share

### 0.7.7

* fix two harmless bugs

### 0.7.6

* share is the new default now

### 0.7.5

* a bit faster marks checking

### 0.7.4

* store marks sorted, don't update sourcetrees of symlinked projects

### 0.7.3

* up the version
* lose outdated and unmaintained migration tool for now, improve fix code, make db local to host

### 0.7.2

* fix column output
* fix column output
* fix listing bug

### 0.7.1

* fix column output


## 0.7.0

* change format to use % like other tools
* nodemarks are now always stored sorted
* don't produce .bak files anymore


### 0.6.2

* don't produce .bak files anymore

## 0.6.0

* new -if-missing option


## 0.5.0

* Various small improvements


## 0.4.0

* adapt to new mulle-bashfunctions 1.3


### 0.3.3

* add no-fs mark

### 0.3.2

* add some more nodemarks for mulle-sde

### 0.3.1

* changes for mulle-sde

## 0.3.0

* use no- instead of no, allow only- markers too


### 0.2.1

* fix stuff for linux

## 0.2.0

* use evaled url to unique sharable nodes


### 0.1.1

* Various small improvements

## 0.1.0

* reorganize support files into own .mulle-sourcetree subdirectory
* callback environment scheme redone
* fix code improved
* run-test without .sh extension now
* forked off from mulle-bootstrap
* rename "scm" to "source", because it fits better.
* added mulle-bootstrap shared to remove .build folders from .bootstrap
* added a convenience interface to edit repositories and embedded_repositories


# 1.0.0

* forked off from mulle-bootstrap
