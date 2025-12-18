# aurx
The Archlinux User Repository eXplorer.

## Motivation
A simple bash script for easily managing AUR installs.

## Installation
```
git clone https://github.com/mvtab/aurx
cd aurx/

# install from AUR (normally identical with upstream)
./aurx install aurx

# install from local copy
# makepkg -sirc

source <(aurx completion bash)

aurx --help
```

## Usage
```
aurx [OPERATION] [OPTION].. [PACKAGE]..
``` 

### Requirements
base-devel, curl>=7.68.0, git, jq.

### Operations

operation  | description
:--------- | :----------
install    | install any package from AUR or the working directory.
remove     | Remove packages from system and the package list.
update     | pseudofunction - install any package from AUR using temp dir as work dir.
search     | query the AUR database via the HTTP RPC API.
suggest    | completion results via the AUR HTTP RPC API.
completion | generate completion for the specified shell.
list       | pseudofunction - search for all locally installed AUR packages.

## Configuration

### Environment variables
Capitalized long option names with `AURX_` prefix. For example for `--tmp-path`: `AURX_TMP_PATH`.  

### Values
A comprehensive list of the possible configurations can be found with `aurx --help` or by using the bash completion.  

## Considerations

### Rate limit
Package completions are using the AUR HTTP RPC API, which has a daily rate limit of 4000 requests per IP per day.  

## Examples

### Install

#### Install a new package from AUR or an existing source from the work directory.
```bash
aurx install some-package
```

#### Download a package to modify before install.
```bash
aurx install some-package --download-only --source-path /tmp
cd /tmp/some-package
# modifications
cd -
aurx install some-package --source-path /tmp
```

### Remove

#### Remove a package with custom pacman remove flags.
```bash
aurx remove some-package --remove-opts '-Rsncu'
```

### Update

#### Update a package only if the present source's version is higher than the installed one.
```bash
aurx install some-package --verify-versions --comparison-criteria pkgbuild
```

#### Update a package to the latest version available online and delete source after.
```bash
aurx update some-package
```

##### Try to update all installed packages.
```bash
aurx update --all
```

### Search

##### List all installed packages and mark available updates.
```bash
aurx list
```

##### Query the AUR looking for only up to date and maintainted packages, sorting results by votes.
```bash
aurx search some-package --no-out-of-date --maintained --sort-by votes
```

##### Search for packages from a maintainer and return results in JSON format.
```bash
aurx search some-maintainer --search-criteria maintainer --sort-by firstsubmitted --order-by ascending --search-results 10 --output json
```

### Completion

##### Get bash completion for custom executable name (where `aurx` is not correct).
```bash
source <(/specific/path/aurx completion bash --executable-name /specific/path/aurx)
```

