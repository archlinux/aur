# aurx
The Archlinux User Repository eXplorer.

## Motivation
A simple bash script for easily managing AUR installs.

## Installation
```
git clone git@github.com:mvtab/aurx.git
#git clone https://github.com/mvtab/aurx
cd aurx/
chmod +111 ./aurx
./aurx --help

## Hard link and completion for comfort.
#sudo ln ${PWD}/aurx /usr/bin/aurx
#source <(aurx completion bash)
```

## Usage
```
aurx [OPERATION] [OPTION].. [PACKAGE]..
``` 

### Requirements

##### install / update
> curl, echo, git, grep, jq, pacman, sed, tee.

##### remove
> grep, pacman, sed.

##### search / list
> curl, echo, jq.  
> optional: pacman (for package installation status).

##### completion
> curl, echo, jq.

### Operations

operation  | description
:--------- | :----------
install    | install any package from AUR or the working directory.
remove     | Remove packages from system and the package list.
update     | force install any package from AUR and delete source after.
search     | query the AUR database via the HTTP RPC API.
completion | generate completion for the specified shell.
list       | search for all locally installed AUR packages.

## Configuration

#### Environment variables
Capitalized long option names with `AURX_` prefix. For example for `--search-criteria`: `AURX_SEARCH_CRITERIA`.

#### Values
A comprehensive list of the possible configurations can be found with `aurx --help` or by using the bash completion.

## Examples

##### Install a new package from AUR or an existing source from the work directory.
```bash
aurx install some-package
```

##### Remove a package with custom pacman remove flags.
```bash
aurx remove some-package --remove-opts '-Rsncu'
```

##### Download a package to modify before install.
```bash
aurx install some-package --download-only --source-path /tmp
cd /tmp/test
# modifications
cd -
aurx install some-package --source-path /tmp
```

##### Update a package only if the present source's version is higher than the installed one.
```bash
aurx install some-package --verify-versions --comparison-criteria pkgbuild
```

##### Update a package to the latest version available online and delete source after.
```bash
aurx update some-package
```

##### List all installed packages and mark available updates.
```bash
aurx list
```

##### Update all installed packages.
```bash
aurx update --all
```

##### Query the AUR looking for only up to date and maintainted packages, sorting results by votes.
```bash
aurx search some-package --no-out-of-date --maintained --sort-by votes
```

##### Grab the all-time first 5 submitted packages of a maintainer.
```bash
aurx search SomeMaintainerName --search-criteria maintainer --sort-by firstsubmitted --order-by ascending --search-results 5
```

##### Grab the latest 5 modified packages that have gcc as makedepends.
```bash
aurx search some-package --search-criteria makedepends --sort-by lastmodified --search-results 5
```

##### Get bash completion for custom executable name (where `aurx` is not correct).
```bash
source <(/specific/path/aurx completion bash --executable-name /specific/path/aurx)
```

## Considerations

### Sudo password
This script intentionally does not handle sudo passwords directly in any way.  
It only prompts for sudo when removing packages with `pacman` and `makepkg` does it's own sudo calls. 

### Completion
Package completions are using the AUR HTTP RPC API, which has a daily rate limit of 4000 requests per IP per day.  

### Search installed mark
Packages may be falsely marked as installed in search operations, if coincidentally an installed package is called exactly like one found online.   
When using the `list` operation, which is also `search` under the hood, appearence of not installed packages means a package is in `aurx`'s package_list but not installed on the system. Search errors from `list` mean a package is in `aurx`'s package_list (installed on system or not) and not on AUR.

### Containers
You can find an example Containerfile in the root of the repository.  
You will need to set an user password as soon as you're in a runtime environment.  

### Subdependencies
`base-devel` is required to build packages with `makepkg`.  
You can read more about it [here](https://wiki.archlinux.org/title/Makepkg#Usage).

## Changelog

### 2024.09.16 Breaking changes - Default source directory changed.
While adding the --persistent-path configuration option, I also refactored and changed the default work directory for more scalability.
To migrate any old data simply copy it to these locations:
```
package_list:   ${HOME}/.aurx/cfg/package_list
sources:        ${HOME}/.aurx/src/
```

Or just set the old directories with options or environment variables.

