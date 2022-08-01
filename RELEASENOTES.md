### 1.1.3

* fix craftinfo command

### 1.1.2

* fix duplicate display of current state

### 1.1.1

* fix config copy/remove command

## 1.1.0

* new command **env-identifier**
* support for multiple sourcetrees with the improved **config** command
* fixed --analyze option of the **craft** command
* use style none/wild for project type none, instead of mulle/wild during the **init** command
* new subcommand *variables* for the **project** command


### 1.0.1

* fix installer
* big function rename to `<tool>`::`<file>`::`<function>` to make it easier to read hopefully
* improve install command and especially the usage dox, to make it more transparent how to build static or dynamic product
* introduce some shortcuts: dep for dependency, lib for library, ext for extension, pat for patternfile, sub for subprojects. Aliases are nice but mulle-sde dep is also nice...
* the list command has changed to only list files by default
* runs under zsh if bash is not installed
* supports crafthelp in addition to craftinfo as well
* uses mulle-bashfunctions 4 now
* experimental **project remove** command
* bequeath ``MULLE_SOURCETREE_USE_PLATFORM_MARKS_FOR_FETCH`` and ``MULLE_SOURCETREE_RESOLVE_TAG`` to newly iniited test projects

# 1.0.0

* big function rename to `<tool>`::`<file>`::`<function>` to make it easier to read hopefully
* improve install command and especially the usage dox, to make it more transparent how to build static or dynamic product
* introduce some shortcuts: dep for dependency, lib for library, ext for extension, pat for patternfile, sub for subprojects. Aliases are nice but mulle-sde dep is also nice...
* the list command has changed to only list files by default
* runs under zsh if bash is not installed
* supports crafthelp in addition to craftinfo as well
* uses mulle-bashfunctions 4 now
* experimental **project remove** command
* bequeath ``MULLE_SOURCETREE_USE_PLATFORM_MARKS_FOR_FETCH`` and ``MULLE_SOURCETREE_RESOLVE_TAG`` to newly iniited test projects


## 0.47.0

* add "test fetch" sub-command
* add freshen sub-command to extension to update extra extension content


## 0.45.0

* allow mulle-sde init without giving a type
* make dependency add command more convenient by infering from address name


### 0.44.1

* fix extension add changing directory permissions

## 0.44.0

* experimental command 'steal' added
* improve extension user experience a bit
* added —qualifier option to „dependency list“ command
* added —usage option to „extension show“
* added —qualifier option to „library list“ command
* new „no-actual-link“ mark for dependencies, that want to bequeath their dependencies but are header only (mulle-dlfcn for instance)
* add `ignore` command
* template generation is done via the external project mulle-template now
* support github.com download URLs
* add extension remove command

### 0.43.2

* fix migration code

### 0.43.1

* remove objc-loader.inc on migration

## 0.43.0

* fix some mulle-sde test inconsistencies
* fixed add command, add command has now an `-a` option to show all vendors
* fix some init bugs
* migrate now removes a duplicate `.mulle/etc/craft` folder
* fix ``PROJECT_UPCASE_IDENTIFIER`` being upcase
* environment variables defined via mulle-sde -Dxxx are not correctly passed to the mulle-test environment
* forward --search-as-is --search-here --search-none to mulle-env
* allow inheritance of meta extensions now (experimental, but mulle-web-developer depends on it)
* improved install command with new options --c --objc --linkorder --only-project
* forward --no-bequeath option of linkorder command now
* new `files` shortcut for mulle-sde list --files
* standard project variables like `MULLE_FETCH_MIRROR_DIR` or `KITCHEN_DIR` can be overridden like mulle-sde `-DKITCHEN_DIR=/foo` after an mulle-sde upgrade
* new project-oneshot extension feature for files that are required, so don't fit into demo


### 0.42.0

* add vendors command to mulle-sde extension
* add command is now more supportive, especially out of environment

### 0.41.0

* add --branch and --tag options to install command, to test prerelease legacy install

### 0.40.1

* add a -t `<type>` option to the add command

## 0.40.0

* the **rename** command is now **project rename**
* the template variable ``PROJECT_GITHUB_NAME`` is now ``GITHUB_USER`` for consistency across tools
* craftinfos on github are now craftinfo instead
* **clean** gains the `--no-graveyard` option
* linkorder output for OS libraries prefers the first alias name now
* rename command update to reflect
* command rename added to rename a project
* improved status/doctor command now with options
* template files can now have a `<|HEADER|>` and `<|FOOTER|>` include, used for inserting user copyright info
* new **add** command creates source files from oneshot extensions
* new *find* subcommand of **extension** command
* enhanced archive URLs now properly use `MULLE_TAG` and not `MULLE_BRANCH` as previously
* RENAMED **update** to **reflect**, for the mantra "organize, reflect, craft"
* renamed ``MULLE_SDE_UPDATE_CALLBACKS`` to ``MULLE_SDE_REFLECT_CALLBACKS``
* renamed ``MULLE_SDE_REFLECT_CALLBACKS`` to ``MULLE_SDE_REFLECT_BEFORE_CRAFT``
* renamed alias `update` to `reflect`
* renamed alias `u` to `r`
* craftinfos can now be cleaned with `clean craftinfos`
* removed bash-completion from documentation, since it's very stale now


### 0.39.4

* force singlephase for startup links, as they have no header

### 0.39.3

* improved ordering of dependency --startup marks generation

### 0.39.2

* fix mulle-sde init

### 0.39.1

* fix extension show bug and another ugly

## 0.39.0

* changed to mulle-bashfunctions 2 call convention
* moved to mulle-bashfunctions v2
* support craftinfo repositories
* add craftinfo create and exists commands
* ask mulle-env for the location of ETC SHARE and VAR directories
* new command craftinfo create, fix build script
* add --analyze to craft command to run the clang analyzer
* the doctor/status command now lists the stash and shows symlinks, broken links etc.
* fixed upgrading subprojects (which are still not well supported)
* Total -- 203.48kb -> 182.07kb (10.52%)


### 0.38.6

* do not fail on linkorder emission for no-require dependencies that are absent

### 0.38.5

* use in-order for linkorder walk

### 0.38.4

* remove accidental duplicate `sde::craftinfo::add_craftinfo_subproject_if_needed`

### 0.38.3

* let tidy clean stash

### 0.38.2

* use subenv environment for tool and environment commands

### 0.38.1

* add mulle-test to dependencies, improve template output if variables are undefined

## 0.38.0

* improved mulle-sde test (init/linkorder)
* renamed command buildstatus to craftstatus for orthogonality
* added craftinfo shortcut for dependency craftinfo
* added craftorder command
* status can now show more interesting information and check for some problems
* improved linkorder generation and made it more flexible
* test will be setup to use shared libraries and not a standalone libary anymore
* added support for the test generator
* renamed buildorder to craftorder mainly for the benefit of shortcuts ‚c‘ ‚CC‘ ‚cc‘
* with error/warning grepper in place, we don’t craft the main project with -v by default anymore
* allow different sourcetree init depending on projecttype (experimental, could go away)
* library add gains -—marks and —-ifmissing
* improved linkorder emission with own —-dedupe, support for only-startup mark
* experimental support for test generation
* improved list commands, now shows everything much nicer including libraries and dependencies
* use default vendor mulle-sde
* use new mulle-env tools feature to add additional tools more quickly
* allow "empty" projects to be upgraded
* redid linkorder, which is now slower but more correct
* fix performance and order of linkorder
* on a failed init, mulle-sde will now try to remove everything it created until then
* the dependency archive URL branch information can now be set with the branch field
* fixes in the clean code (as usual)


### 0.37.4

* added hostname ans status commands

### 0.37.3

* add platform to bin/installer-all

### 0.37.2

* improved upgrade with subprojects

### 0.37.1

* fix tool upgrade by erasing proper prior files

## 0.37.0

* adapt to mulle-env changes


## 0.36.0

* no more tool/optionaltool distinction
* installs all tool.osspecific files properly now


### 0.35.4

* install gains --standalone flag and builds Release by default. init unprotects/protects files with `MULLE_SDE_PROTECT_PATH` now

### 0.35.3

* rename mulle-test build to mulle-test craft for consistency, also file dependency to dependencies

### 0.35.2

* fix mulle-test being mandatory

### 0.35.1

* adapt to new and improved mulle-sourcetree
* adapt to newer mulle-sde test
* uses .mulle directory instead of .mulle-sde
* adapted to changes in other mulle-sde tools

## 0.35.0

* uses .mulle directory instead of .mulle-sde
* adapted to changes in other mulle-sde tools


## 0.34.0

* linkorder is simpler, because tests now are based on mulle-sde, which means we don't need the linkmanifest files anymore


### 0.33.15

* adapt to changes in mulle-craft

### 0.33.14

* make mulle-sde `<url>` happen, also don't clean .mulle/var/env

### 0.33.13

* so much fun with find and symbolic links

### 0.33.12

* hardcode some share searchpaths again

### 0.33.11

* more fun with extension paths

### 0.33.10

* use /tmp for extensions in developer mode

### 0.33.9

* use restrict as new default, be smarter to detect installdir for extensions

### 0.33.8

* fix quoting problem in eval

### 0.33.7

* modified and simplified extension searchpath

### 0.33.6

* more verbose error output to catch osx problem

### 0.33.5

* try to fix brew installation

### 0.33.4

* try to debug curious error
* try to debug travis

### 0.33.3

* use mulle-env plugin-installpath to locate place for plugin

### 0.33.2

* simplify and improve extension search

### 0.33.1

* only walk dependencies in linkorder

## 0.33.0

* clean has two new domains craftorder and dependency
* the craft command doesn't support clean anymore (use clean for that)
* new --github option for dependency add command
* --multiphase mulle-make support
* `PROJECT_UPCASE_IDENTIFIER` and friends are now saved into the environment
* added linkorder command for the benefit of external tools
* added test command that supports and simplified the new mulle-test
* overhauled the environment scheme. mulle-env plugin moved from mulle-env to mulle-sde
* Changed icon
* renamed "show" command to "list"
* renamed "makeinfo" command to "definition"
* added "buildstatus" and "treestatus" commands
* changed craftinfo to a somewhat more intuitive layout
* improve detection of misspelled clean target
* support mulle-env 1.0.0 with our own plugin (migrated from mulle-env)
* support script builds
* fix URLS starting with a digit
* allow multiple extension paths for same vendor


### 0.31.1

* mulle-sde craft -V will silently ignore the -V flag, to fix some old travis scripts

## 0.31.0

* use `r_` functions of mulle-bashfunctions 1.8.0
* rename mulle-sde find to mulle-sde show, so that a shortcut alias doesnt clash with unix find
* migrated to mulle-bashfunctions 1.8.0, making mulle-sde perceptively snappier
* added very experimental install command


## 0.30.0

* rename buildinfo to craftinfo/makeinfo. mulle-sde/craftinfo extension is now part of mulle-sde
* remove rebuild clean target
* project build is verbose by default
* rename buildinfo to makeinfo and craftinfo to keep the two concepts distinct


### 0.28.7

* fix some error message, fix dependency makeinfo, fix update not running

### 0.28.6

* lose the -V flag in a test

### 0.28.5

* fix tidy clean target

### 0.28.4

* remove debug stuff

### 0.28.3

* fixes for mingw

### 0.28.2

* be more verbose about post-mulle-sde-init

### 0.28.1

* fix wrong label in graphic

## 0.28.0

* run user script ${HOME}/bin/post-mulle-sde-init after initial init to setup more environment (like `MULLE_FETCH_SEARCH_PATH)`


### 0.27.1

* less verbose during init

## 0.27.0

* fix bug when giving craft a target, turn off fetching with `MULLE_SDE_FETCH`


### 0.26.10

* add -D option to define environment variables

### 0.26.9

* fix bugs with symbolic links created by brew on osx

### 0.26.8

* add a debug statement

### 0.26.7

* fix recently introduced bug

### 0.26.6

* use `MULLE_SDE_EXTENSION_PATH` for override and `MULLE_SDE_EXTENSION_BASE_PATH` for default setting of extensions searchpath

### 0.26.5

* add refetch clean target, fix an unsightliness during init

### 0.26.4

* fix installer-all for mulle-c-developer, experimentally allow init from inside environment

### 0.26.3

* mulle-sde searches extensions relative to its install space now

### 0.26.2

* do not generate craft motd if no builtool extension is installed

### 0.26.1

* fix problem with delete add `INCLUDE_COMMAND` as template identifier
* add --objc --private options to library
* add delete folder to extensions, which obsoletes clobber

## 0.25.0

* add some more options to dependency add command
* clean up after a failed init


### 0.24.5

* fix subproject update

### 0.24.4

* add convenient experimental run command

### 0.24.3

* add "fluff" command enter

### 0.24.2

* bug fixes for --upgrade-project-file

### 0.24.1

* better support for --upgrade-project-file

## 0.24.0

* add log command, forwarding it to mulle-craft


### 0.23.4

* rename tests to test, fix some bugs, add new clean target craftorder

### 0.23.3

* dont be so harsh if craftorderfile doesnt exist

### 0.23.2

* improved usage info, removed definition command, improved makeinfo command

### 0.23.1

* fix craft bug forgetting to build dependencies

## 0.23.0

* redid the clean command
* redid the craft command
* subprojects are now properly rebuilt everytime, but dependencies aren't


### 0.22.1

* add some more subproject subcommands: find,match,patternfile

## 0.22.0

* subprojects can now be manipulated from the main shell and subenv isn't needed (as much)
* reinit can not be run from the subshell. it does mulle-env environment upgrade now


## 0.21.0

* use new mulle-sourcetree -V flag to good effect
* improved subproject functionality (but still not complete)
* improved identifier de-camel-case added (incompatible PROJECT identifiers will be produced)


### 0.20.1

* fix various bugs recently introduced

## 0.20.0

* redo the way templates are written to match my expectations (deja vu)


## 0.19.0

* inheritmarks added, so that an extension can turn off parts of another extension


### 0.18.8

* use `LC_ALL=C` for sorting, fix some bugs

### 0.18.7

* remove some old text from README

### 0.18.6

* simplify README

### 0.18.5

* use -RLa for homebrew

### 0.18.4

* remove file from git

### 0.18.3

* simplify README

### 0.18.2

* rename definition to makeinfo, fix extension searchpath

### 0.18.1

* improve makeinfo a bit more

## 0.18.0

* add makeinfo command (incomplete)


### 0.17.7

* use -C option of mulle-env to pass commandline

### 0.17.6

* fix useless quoting for mulle-env

### 0.17.5

* add definition command

### 0.17.4

* fix dependencies

### 0.17.3

* fix package dependencies more

### 0.17.2

* fix homebrew install ruby script

### 0.17.1

* fix lost commands

## 0.17.0

* fixed reinit to work with older projects
* clean dependency now does what I expect it to do
* now most commands can be run without entering a subshell
* a problem with the order of template files writes has been corrected


### 0.16.3

* improved cleaning, improved reinit

### 0.16.2

* fix installer-all

### 0.16.1

* rename install to installer, because of name conflict

## 0.16.0

* subproject support added. Fix various extension problems


### 0.15.17

* and even nicers

### 0.15.16

* fix

### 0.15.15

* improve install-all

### 0.15.14

* add install-all, rename install.sh to install
* add install-all, rename install.sh to install

### 0.15.13

* add install-all, rename install.sh to install

### 0.15.12

* started work on dependency definition subcommand

### 0.15.11

* even more dox improvements

### 0.15.10

* improve README.md

### 0.15.9

* fix upgrade and reinit

### 0.15.8

* improve extension handling again, use new mulle-craft

### 0.15.7

* use : as separator for environment variables, extra extensions can be inherited from all

### 0.15.6

* support `DIALECT_EXTENSION`

### 0.15.5

* fix cmake

### 0.15.4

* move extension out of project, meta extensions now only inherit
* move extension out of project, meta extensions now only inherit

### 0.15.2

* add support for include for library

### 0.15.1

* fix CMakeLists.txt

## 0.15.0

* use only singular directory names
* mulle-sde craft can now be called from outside of the subshell


### 0.14.3

* Various small improvements

### 0.14.2

* make upgrade a bit more foolproof

### 0.14.1

* improved usage texts, support clobber and all extension folders

## 0.14.0

* simplify ignore by just looking into src and tests (and .mulle/etc/sourcetree)
* extension add should work now well
* dial back to `MULLE_VIRTUAL_ROOT` for a choice of commands
* simplify upgrade
* reinit is now a proper command


### 0.13.1

* bug fixes, save extensions with quotes and use --aux for init environment

## 0.13.0

* use / as vendor extension separator instead of :
* added bash completion
* adapt to changes in inferior tools


### 0.12.5

* uniform help, remove obsolete cmake-include

### 0.12.4

* fix -D environment variables not showing up in templates

### 0.12.2

* Various small improvements

### 0.12.1

* Various small improvements


## 0.12.0

* Greatly improved extension handling


### 0.11.1

* Various small improvements

## 0.10.0

* lots of work and refinement on extensions


## 0.9.0

* redo extension lookup so its more amenable to development
* improve and simplify documentation
* move c and cmake extensions into their own projects


## 0.8.0

* use a gitignore like scheme to classify files and directories


### 0.7.4

* allow extensions to suppress functionality of inherited extensions with marks

### 0.7.2

* redid the extensions, so it is now much easier to create one

## 0.7.0

* rewrite monitor to be more functional even if cmake is not used
* improve README.md somewhat


### 0.6.1

* general progress on all fronts

## 0.6.0

* working as intended with c and cmake extensions


## 0.5.0

* use .mulle-sde subdirectory for configuration


## 0.4.0

* use -- to separate options from mulle-bootstrap flags


### 0.3.1

* Various small improvements

## 0.3.0

* add -c option
* MULLE_BOOTSTRAP_VIRTUAL_ENVIRONMENT is now MULLE_SDE_VIRTUAL_ENVIRONMENT
* search for .mulle-sde-environment.sh to determine root of virtual environment
* source .environment.sh if present
* fix mulle-bootstrap running if there is not .bootstrap or .bootstrap.local folder


### 0.1.1

* Various small improvements

## 0.1.0

* Various small improvements


### 0.0.3

* Various small improvements

### 0.0.2

* various improvements and bugfixes
