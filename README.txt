jrnlc - Tiny terminal journaling tool in C++

A minimal, fast, and predictable journaling tool that stores entries in plain-text files.
No database, no cloud sync — just text on disk. Supports local (directory-specific) 
and global journals.

Features:
- Add entries via command line or stdin
- Optional tags with automatic tag continuation
- Display entries using ranges or time filters (--before, --after)
- Atomic file writes and human-readable storage
- Configurable ANSI color output

Installation:
Build from source using CMake:

git clone https://github.com/manjunathamajety/jrnlc.git
cd jrnlc
mkdir build
cd build
cmake ..
make
sudo make install

Usage examples:
jrnlc init --local        # initialize local journal
jrnlc init --global       # initialize global journal
jrnlc add "met a cat today" mood
jrnlc show *              # display all entries
jrnlc show --after "2025-01-01" "*5"

For more details, see the GitHub repository:
https://github.com/manjunathamajety/jrnlc

