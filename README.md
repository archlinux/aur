# god [![Build Status](https://travis-ci.org/KeyLo99/God.svg?branch=master)](https://travis-ci.org/KeyLo99/God)

### Linux utility for simplifying the Git usage.

### (!) work in progress

`God` parses the available Git commands from the retrieved list (`git help`) and turns them into an easy-to-type, one or two char format at the execution time.
Shortcuts of [commonly used git commands](https://github.com/joshnh/Git-Commands) are supported for simplifying the usage and speeding up typing even more.

## Installation


## CLI

### Commands

```
[god ~]$ ?
+---------+-----------------------------+
| COMMAND |         DESCRIPTION         |
+---------+-----------------------------+
| git     | List available git commands |
| sc      | List git shortcuts          |
| help    | Show this help message      |
| version | Show version information    |
| clear   | Clear the terminal          |
| exit    | Exit shell                  |
+---------+-----------------------------+
```

### `git`

```
[god ~]$ git
+---------+----------+
| COMMAND |   GIT    |
+---------+----------+
| c       | clone    |
| i       | init     |
| a       | add      |
| m       | mv       |
| r       | reset    |
| rm      | rm       |
| b       | bisect   |
| g       | grep     |
| l       | log      |
| s       | show     |
| st      | status   |
| bn      | branch   |
| ck      | checkout |
| cm      | commit   |
| d       | diff     |
| mr      | merge    |
| ra      | rebase   |
| t       | tag      |
| f       | fetch    |
| p       | pull     |
| ps      | push     |
| mt      | master   |
| o       | origin   |
+---------+----------+
```
_Example of shortened git commands._

### `sc`

```
[god ~]$ sc   
+----------+--------------------------------+
| SHORTCUT |            COMMAND             |
+----------+--------------------------------+
| aa       | add -A                         |
| cmt      | commit -m                      |
| rmt      | remote -v                      |
| rr       | rm -r                          |
| ll       | log --graph --decorate --all   |
| lo       | log --graph --decorate         |
|          | --oneline --all                |
| ls       | ls-files                       |
+----------+--------------------------------+
```

### Other

Other terminal commands can be executed with adding a `'#'` character before the command. It's necessary for non-git commands because the `god` executes all terminal inputs with `git`.

```
[god ~]$ # ps
PID   TTY    TIME     CMD
23965 pts/2  00:00:00 bash
30306 pts/2  00:00:00 go
30361 pts/2  00:00:00 god
30519 pts/2  00:00:00 ps
[god ~]$ # pwd
/home/k3/god
```

## Demo

## Example

```
[god ~]$ st
On branch master
	modified:   README.md
no changes added to commit (use "git add" and/or "git commit -a")

[god ~]$ a README.md

[god ~]$ cmt "README.md updated~"
[master fba7e79] README.md updated~
 1 file changed, 14 insertions(+)

[god ~]$ ps o mt
To https://github.com/KeyLo99/God.git
   45e8aba..fba7e79  master -> master
```
```
st -> status
a -> add
cmt -> commit -m
ps o mt -> push origin master
```

## Todo

* Support adding custom shortcuts.
* Add 'save' command to CLI for saving commands as Git config file.