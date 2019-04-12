# git-pair
Pair Programming git Management Tool

## Build Instructions

```sh
$ gcc pair.c -o pair
```

## Usage

Run `./pair help` to see available commands.

<hr>

Initialize your workspace by adding and selecting git authors:
```sh
$ ./pair init
``` 

To select or change the current author/co-author, execute without parameters:

```sh
$ ./pair
```

Add new authors:

```sh
$ ./pair add
```

