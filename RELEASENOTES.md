### 1.0.2

* fixed monitor back into usability for more than just a task starter

### 1.0.1

* Various small improvements

# 1.0.0

* big function rename to `<tool>`::`<file>`::`<function>` to make it easier to read hopefully
* uses mulle-bashfunctions 4 now
* can now run under zsh if bash is not available


### 0.9.2

* Various small improvements

### 0.9.1

* installer verbose toggle

## 0.9.0

* added category filter
* improved *list* sub-command for **task** and **callback**


## 0.8.0

* changed to mulle-bashfunctions 2 call convention
* moved to mulle-bashfunctions v2
* ask mulle-env for the location of ETC SHARE and VAR directories


### 0.7.3

*  do not depend on inotifywait/fswatch since basic functionality works without (fix for 10.6)


### 0.7.2

* small beauty fixes in code

## 0.7.1

* use own .mulle folder now, no private storage of patternfiles or suc
* readde --craft in a more general way


### 0.6.4

* improve README.md

### 0.6.3

* suppress boring warning when cleaning

### 0.6.2

* added possibly ill-fated option to run tasks optonally async

### 0.6.1

* fix RVAL problem

## 0.6.0

* use `r_` functions of mulle-bashfunctions 1.8.0
* use `r_` functions of mulle-bashfunctions 1.8.0


### 0.5.13

* minor code improvements

### 0.5.12

* capitalize error message

### 0.5.11

* capitalize an error message properly

### 0.5.10

* return rval from main task run

### 0.5.9

* remove file from git

### 0.5.8

* simplify README

### 0.5.7

* improved brew formula defintion

### 0.5.6

* fix debian dependencies

### 0.5.5

* fix debian dependencies

### 0.5.4

* fix package dependencies more

### 0.5.3

* fix homebrew install ruby script

### 0.5.2

* improved -v debugging for clean and friends

### 0.5.1

* rename install to installer, because of name conflict

## 0.5.0

* run a task craft after other tasks if so desired (simplifies the mulle-sde-developer callbacks)


### 0.4.7

* rename install.sh to install, improve tracing

### 0.4.6

* CMakeLists.txt CMakePackage.cmake LICENSE README.md RELEASENOTES.md build dox install.sh mulle-monitor mulle-monitor.graffle mulle-monitor.png mulle-monitor.sublime-project mulle-monitor.sublime-workspace mulle-project src tests tmp.12ro4m9c tmp.F1LivqOc tmp.VcXsbUuX tmp.nQn0FGZ3 simplified CMakeLists.txt

### 0.4.5

* remove "lame but practical" hardcoded .mulle-sde dir

### 0.4.4

* use `MULLE_HOSTNAME` vor var/run

### 0.4.3

* fix bug with `_match_filepath`

### 0.4.2

* use `MULLE_UNAME` pervasively

### 0.4.1

* update dox

## 0.4.0

* make secondary command set more uniform across mulle-sde tools


### 0.3.4

* build CMakeLists.txt CMakePackage.cmake dox install.sh LICENSE mulle-monitor mulle-monitor.graffle mulle-monitor.png mulle-monitor.sublime-project mulle-monitor.sublime-workspace mulle-project README.md RELEASENOTES.md src tests tmp.0TzfdmXk tmp.1InwGGbY tmp.1Of0mhck tmp.6IxH9i3i tmp.90TuSlAk tmp.DVmRIPC5 tmp.HbdjIHtw tmp.lXYv2HQt tmp.wM9ySHfc fix for linux, use less backticks
* split off mulle-match into own project

### 0.3.3

* * fix option handling for project

### 0.3.1

* Various small improvements

## 0.3.0

* Various small improvements


## 0.2.0

* also search share/libexec and share/bin, so that extensions can install into share only
* experimentally add [ -? <pattern> ] to test for directory or file or some such
* add cat commands to task and callback


### 0.1.2

* Various small improvements

### 0.0.4

* fix stuff, add new tests

### 0.0.3

* much improved callback, task, patternfile commands

### 0.0.2

* Various small improvements
