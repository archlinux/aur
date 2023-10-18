## Change Log

### v1.1.1

- Fixed inconsistency in version output in released packages

### v1.1.0

This release has a number of bug fixes in addition to a few new features.
Following a complete transition to Python 3, with dropped Python 2 support,
major work was made towards code modernization and quality.

- The code is now Black formatted and Flake8 tested
- Greatly improved unittest framework
- Embedded PLY version updated to 3.11
- New option: `--no-embed-preamble` create separate files for preamble and
  loader instead of embedding in each output file
- New option: `--allow-gnu-c` do not undefine `__GNUC__`
- Fixed library loader search path on macOS
- Fixed rare bug, processing (legacy) header files with MacRoman encoding
  on macOS
- Added full support for floating and integer constants
- Added support for sized integer types on Windows
- Added support to handle `restrict` and `_Noreturn` keywords
- Added name formats to posix library loader
- Fixed mapping of 'short int' to c_short
- Git tags are now using `x.y.z` format

### v1.0.2

Many issues fixed. Parse gcc attributes more

Implements automatic calling convention selection based on gcc attributes for
stdcall/cdecl.

- Simplify and unify library loader for various platforms. Improve library path
  searches on Linux (parsed ld.so.conf includes now).
- First implementaion of #pragma pack
- First implemenation of #undef
- Adds several command line options:
  `-D` `--define`
  `-U` `--undefine`
  `--no-undefs`
  `-P` `--strip-prefix`
  `--debug-level`

### v1.0.1

Fix handling of function prototypes 

Other minor improvments included.

### v1.0.0

Py2/Py3 support 

Various development branches merged back

In addition to the various developments from the different branches, this
tag also represents a code state that:

- ties in with Travis CI to watch code developments
- improves testsuite, including moving all JSON tests to testsuite
- includes a decent Debian package build configuration
- automatically creates a man page to be included in the Debian package
