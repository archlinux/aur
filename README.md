## Symlink Your Damn Files

### Description:

_sydf_ is a small bash utility for managing files. Main purpose of this utility
is to make sharing and syncing dotfiles across devices as easy as possible. It is intended to be used in conjunction with git, syncthing, borgbackup,
nextcloud and other programs.

### Installation

Run these commands in your terminal to set up _sydf_ system-wide:
```sh
# Install latest version
curl -L "https://raw.githubusercontent.com/filiparag/sydf/master/sydf" > /tmp/sydf

# Install stable release 0.1
curl -L "https://github.com/filiparag/sydf/releases/download/0.1/sydf" > /tmp/sydf

chmod +x /tmp/sydf
sudo mv /tmp/sydf /usr/bin/sydf

```

### Usage

**Initialization**

Similar to a git repository, _sydf_ needs a working directory for file managment. Default directory is `$HOME/.sydf`.
```sh
sydf init <DIRECTORY>
```
**Adding files and directories**

Adding files to _sydf_ means that they will get moved to its working directory and a symbolic link will be placed in their original place. Linking a directory will move it same as it was a regular file, so its content won't be symlinked individually. Plan ahead and decide if moving individual files inside directory is better suited for your needs - wildcards are supported in both add and remove commands.
```sh
sydf add <FILE1> <DIRECTORY> <FILE2>...
```

**Removing files and directories**

Removing a file or a directory from _sydf_ means reversing what adding them did. Symbolic link is destroyed and the file is put back into its original place. This operation will not harm any of your files, unlike similar command for git.
```sh
sydf remove <FILE> <DIRECTORY>...
```

**List**

Show a list of all files and directories managed by _sydf_.
```sh
sydf list
```

**Hook**

Hooking will attempt to link all files and directories inside _sydf_'s working directory to their respective places on system. This comand is intended to be used for transfer of your managed files to another machine or sharing with another user. If a file already exists in targeted place, it will be safely moved to `.old` directory inside _sydf_'s working directory.
```sh
sydf hook
```

**Unhook**

Unhooking will replace all symbolic links created by _sydf_ with corresponding files and directories. Contents of _sydf_ working directory will stay unaffected by this operation.
```sh
sydf unhook
```
