# Install ponyc from .rpm files
This installs ponyc using `makepkg -si` from the release .rpm
files on [bintray](https://bintray.com/pony-language/ponyc-rpm).

The current ponyc package installed via pacman is not compatible with
LLVM5 and fails, see Arch Linux bug
[55170](https://bugs.archlinux.org/task/55170) archlinux bug.
It is also not possible to build ponyc from source for
the same reason. [Issue 2303](https://github.com/ponylang/ponyc/pull/2303)
is tracking the problem.

This was based on a guide from
[nemrod](http://nemrod.se/guides/install-rpm-packages-on-arch-linux)
and in particular the
[comment from Hi-Angel](http://nemrod.se/guides/install-rpm-packages-on-arch-linux/#comment-183470)
in January 2017.

## Pony install/uninstall using ponyc-rpm
### Prerequisites: `git` `zlib` `ncurses5-compat-libs`

Install `git` and `zlib` using pacman:
```
sudo pacman -Syu git zlib
```

Install AUR package [`ncurses5-compat-libs`](https://aur.archlinux.org/packages/ncurses5-compat-libs/)
manually by cloning its git repo, install the gpg see using `gpg --recv-keys <KEYID - See 'validpgpkeys' in PKGBUILD>, use makepkg to install. For example:
```
git clone https://aur.archlinux.org/ncurses5-compat-libs.git
cd ncurses5-compat-libs
gpg --recv-keys C52048C0C0748FEE227D47A2702353E0F7E48EDB
makepkg -si
```

### Install:
Clone the repo, change directory to the repo, run `makepkg -si`
or use your favorite AUR package manager.
```
git clone https://github.com/winksaville/ponyc-rpm
cd ponyc-rpm
makepkg -si
```

### Uninstall:
```
sudo pacman -Rs ponyc-rpm
```

## Ponyc Usage
You must pass the `--pic` parameter to ponyc on Arch Linux
```
ponyc --pic
```

## Example
Create a directory `helloworld`, with the file `main.pony`,
compile with `ponyc --pic` and then run `./helloworld`:
```
mkdir helloworld
cd helloworld
echo 'actor Main
  new create(env: Env) =>
    env.out.print("Hello, world!")' > main.pony
ponyc --pic
./helloworld
```
This should result in something like:
```
$ mkdir helloworld
wink@wink-envy:~/prgs/ponylang
$ cd helloworld
wink@wink-envy:~/prgs/ponylang/helloworld
$ echo 'actor Main
>   new create(env: Env) =>
>     env.out.print("Hello, world!")' > main.pony
wink@wink-envy:~/prgs/ponylang/helloworld
$ ponyc --pic
Building builtin -> /usr/lib/pony/0.20.0-4003.0b2a2d2/packages/builtin
Building . -> /home/wink/prgs/ponylang/helloworld
Generating
 Reachability
 Selector painting
 Data prototypes
 Data types
 Function prototypes
 Functions
 Descriptors
Optimising
Writing ./helloworld.o
Linking ./helloworld
Warning: environment variable $CC undefined, using gcc as the linker
wink@wink-envy:~/prgs/ponylang/helloworld
$ ./helloworld
Hello, world!
```
