![BCNA Logo](https://github.com/BitCannaGlobal/BCNA/blob/master/src/qt/res/images/bitcanna_logo_horizontal.png)

BitCanna is GNU AGPLv3 licensed.

[Website](https://www.bitcanna.io) — [PoS Web Wallet]() — [Block Explorer](https://explorer.bitcanna.io/) — [Blog](https://medium.com/@bitcannaglobal) — [Telegram](https://t.me/BitCannaGlobal) — [Twitter](https://www.twitter.com/BitcannaGlobal)

Features
=============

* Segwit
* PHI1612 PoS algorithm
* Static PoS

BitCanna will provide a decentralized payment network for the legal cannabis industry, by means of the BitCanna Coin (BCNA), created under an open source license, featuring a built-in cryptocurrency and end-to-end encrypted messaging. The decentralized network aims to provide anonymity and privacy for everyone through a simple user-friendly interface by taking care of all the advanced cryptography in the background.

## Coin Specifications

| Specification | Value |
|:-----------|:-----------|
| Block Size | `4MB` |
| Block Time | `30s` |
| Port | `12888` |
| RPC Port | `9888` |

#### Rewards

| Date | Masternode reward | PoS reward | Governance |
|:-----------|:-----------|:-----------|:-----------|
| 20.10.2019 | 3,3 | 2,6 | 0,7 |
| 20.10.2020 | 3,0 | 2,4 | 0,6 |
| 20.10.2021 | 2,6 | 2,1 | 0,5 |
| 20.10.2022 | 2,3 | 1,9 | 0,5 |
| 20.10.2023 | 2,0 | 1,6 | 0,4 |
| 20.10.2024 | 1,7 | 1,3 | 0,3 |
| 20.10.2025 | 1,3 | 1,1 | 0,3 |
| 20.10.2026 | 1,0 | 0,8 | 0,2 |
| 20.10.2027 | 0,7 | 0,5 | 0,1 |
| 20.10.2028 | 0,2 | 0,1 | 0,0 |
| 20.10.2029 | 0,0 | 0,0 | 0,0 |


Build BitCanna wallet
----------

### Building for 64-bit Windows

The first step is to install the mingw-w64 cross-compilation tool chain. Due to different Ubuntu packages for each distribution and problems with the Xenial packages the steps for each are different.

Common steps to install mingw32 cross compiler tool chain:

    sudo apt install g++-mingw-w64-x86-64

Ubuntu Xenial 16.04 and Windows Subsystem for Linux

    sudo apt install software-properties-common
    sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu zesty universe"
    sudo apt update
    sudo apt upgrade
    sudo update-alternatives --config x86_64-w64-mingw32-g++ # Set the default mingw32 g++ compiler option to posix.

Once the tool chain is installed the build steps are common:

Note that for WSL the BitCanna source path MUST be somewhere in the default mount file system, for example /usr/src/bitcanna, AND not under /mnt/d/. If this is not the case the dependency autoconf scripts will fail. This means you cannot use a directory that located directly on the host Windows file system to perform the build.

The next three steps are an example of how to acquire the source in an appropriate way.

    cd /usr/src
    git clone https://github.com/BitCannaGlobal/BCNA.git --recursive
    sudo chmod -R a+rw BCNA

Once the source code is ready the build steps are below.

    PATH=$(echo "$PATH" | sed -e 's/:\/mnt.*//g') # strip out problematic Windows %PATH% imported var
    cd depends
    make HOST=x86_64-w64-mingw32 -j$(nproc)
    cd ..
    ./autogen.sh # not required when building from tarball
    CONFIG_SITE=$PWD/depends/x86_64-w64-mingw32/share/config.site
    ./configure --prefix=`pwd`/depends/x86_64-w64-mingw32 --disable-tests
    make HOST=x86_64-w64-mingw32 -j$(nproc)

### Build on Ubuntu

    sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils git cmake libboost-all-dev
    sudo apt-get install software-properties-common
    sudo add-apt-repository ppa:bitcoin/bitcoin
    sudo apt-get update
    sudo apt-get install libdb4.8-dev libdb4.8++-dev

    # If you want to build the Qt GUI:
    sudo apt-get install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler

    git clone https://github.com/BitCannaGlobal/BCNA.git

    cd BCNA

    # Note autogen will prompt to install some more dependencies if needed
    ./autogen.sh
    ./configure --disable-tests
    make -j$(nproc)

### Build on OSX

The commands in this guide should be executed in a Terminal application.
The built-in one is located in `/Applications/Utilities/Terminal.app`.

#### Preparation

Install the OS X command line tools:

`xcode-select --install`

When the popup appears, click `Install`.

Then install [Homebrew](https://brew.sh).

#### Dependencies

    brew install cmake automake berkeley-db4 leveldb libtool boost --c++11 --without-single --without-static miniupnpc openssl pkg-config protobuf qt5 libevent imagemagick --with-librsvg

NOTE: Building with Qt4 is still supported, however, could result in a broken UI. Building with Qt5 is recommended.

#### Build BitCanna

1. Clone the BitCanna source code and cd into `BitCanna`

        git clone --recursive https://github.com/BitCannaGlobal/BCNA.git
        cd BCNA

2.  Build BitCanna:

    Configure and build the headless BitCanna binaries as well as the GUI (if Qt is found).

    You can disable the GUI build by passing `--without-gui` to configure.

        ./autogen.sh
        ./configure --disable-tests
        make

3.  It is recommended to build and run the unit tests:

        make check

### Run

Then you can either run the command-line daemon using `src/bitcannad` and `src/bitcanna-cli`, or you can run the Qt GUI using `src/qt/bitcanna-qt`

Setup and Build: Arch Linux
-----------------------------------
This example lists the steps necessary to setup and build a command line only, non-wallet distribution of the latest changes on Arch Linux:

    pacman -S git base-devel boost libevent python
    git clone https://github.com/BitCannaGlobal/BCNA.git
    cd BCNA/
    ./autogen.sh
    ./configure --without-miniupnpc --disable-tests
    make -j$(nproc)

Note:
Enabling wallet support requires either compiling against a Berkeley DB newer than 4.8 (package `db`) using `--with-incompatible-bdb`,
or building and depending on a local version of Berkeley DB 4.8. The readily available Arch Linux packages are currently built using
`--with-incompatible-bdb` according to the
As mentioned above, when maintaining portability of the wallet between the standard Bitcoin Core distributions and independently built
node software is desired, Berkeley DB 4.8 must be used.


ARM Cross-compilation
-------------------
These steps can be performed on, for example, an Ubuntu VM. The depends system
will also work on other Linux distributions, however the commands for
installing the toolchain will be different.

Make sure you install the build requirements mentioned above.
Then, install the toolchain and curl:

    sudo apt-get install g++-arm-linux-gnueabihf curl

To build executables for ARM:

    cd depends
    make HOST=arm-linux-gnueabihf NO_QT=1
    cd ..
    ./configure --prefix=$PWD/depends/arm-linux-gnueabihf --enable-glibc-back-compat --enable-reduce-exports LDFLAGS=-static-libstdc++
    make -j$(nproc)

For further documentation on the depends system see [README.md](../depends/README.md) in the depends directory.

Building on FreeBSD
--------------------

Clang is installed by default as `cc` compiler, this makes it easier to get
started than on [OpenBSD](build-openbsd.md). Installing dependencies:

    pkg install autoconf automake libtool pkgconf
    pkg install boost-libs openssl libevent
    pkg install gmake

You need to use GNU make (`gmake`) instead of `make`.
(`libressl` instead of `openssl` will also work)

For the wallet (optional):

    ./contrib/install_db4.sh `pwd`
    setenv BDB_PREFIX $PWD/db4

Then build using:

    ./autogen.sh
    ./configure BDB_CFLAGS="-I${BDB_PREFIX}/include" BDB_LIBS="-L${BDB_PREFIX}/lib -ldb_cxx"
    gmake

Development Process
-------------------

The `master` branch is regularly built and tested, but is not guaranteed to be
completely stable. [Tags](https://github.com/BitCannaGlobal/BCNA/tags) are created
regularly to indicate new official, stable release versions of BitCanna.

The contribution workflow is described in [CONTRIBUTING.md](CONTRIBUTING.md).
