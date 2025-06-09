# libexecinfo

[![License: BSD-2-Clause](https://img.shields.io/badge/License-BSD_2--Clause-orange.svg)](https://opensource.org/licenses/BSD-2-Clause)
[![Build Status](https://github.com/fam007e/libexecinfo/workflows/CI/badge.svg)](https://github.com/fam007e/libexecinfo/actions)
[![AUR Package](https://img.shields.io/aur/version/libexecinfo)](https://aur.archlinux.org/packages/libexecinfo)

A modern, BSD-licensed clone of the backtrace facility found in GNU libc. This library is primarily intended for porting Linux code to BSD platforms and other systems that don't have built-in backtrace support.

## ✨ Features

- **Full GNU libc compatibility**: Drop-in replacement for GNU libc's backtrace API
- **Modern C11 implementation**: Enhanced security and memory safety features
- **Cross-platform support**: Linux, BSD, macOS, and other POSIX systems
- **Performance optimized**: Fast backtrace capture with minimal overhead
- **Comprehensive testing**: Extensive test suite with performance benchmarks
- **Easy integration**: pkg-config support and build system integration
- **Python-generated code**: Configurable stack depth with code generation
- **Production ready**: Memory safe with proper error handling

## 🚀 Quick Start

### Arch Linux Installation

```bash
# Install from AUR
yay -S libexecinfo
# Or using paru
paru -S libexecinfo
```

### Build from Source

```bash
# Clone repository
git clone https://github.com/fam007e/libexecinfo.git
cd libexecinfo

# Generate source files (configurable stack depth)
python gen.py --max-depth 128 --output stacktraverse.c

# Build
make all

# Test
make test

# Install
sudo make install PREFIX=/usr
```

## 📋 Requirements

- **C Compiler**: GCC 7+ or Clang 6+
- **Python**: 3.6+ (for code generation)
- **Make**: GNU Make
- **Development tools**: Standard POSIX utilities

## 📖 Usage

### Basic Example

```c
#include <execinfo.h>
#include <stdio.h>
#include <stdlib.h>

void print_backtrace() {
    void *buffer[64];
    char **strings;
    int size, i;
    
    size = backtrace(buffer, 64);
    strings = backtrace_symbols(buffer, size);
    
    printf("Backtrace (%d frames):\n", size);
    for (i = 0; i < size; i++) {
        printf(" [%d] %s\n", i, strings[i]);
    }
    free(strings);
}

void function_c() { print_backtrace(); }
void function_b() { function_c(); }
void function_a() { function_b(); }

int main() {
    function_a();
    return 0;
}
```

### Compilation

```bash
# Basic compilation
gcc -o myprogram myprogram.c -lexecinfo

# With symbol information (recommended)
gcc -Wl,--export-dynamic -o myprogram myprogram.c -lexecinfo

# Using pkg-config
gcc -o myprogram myprogram.c $(pkg-config --cflags --libs libexecinfo)
```

### Signal Handler Example

```c
#include <execinfo.h>
#include <unistd.h>
#include <signal.h>

// Signal handler for crash reports
void crash_handler(int sig) {
    void *buffer[128];
    int size;
    
    size = backtrace(buffer, 128);
    
    // Write directly to stderr (safe in signal handlers)
    write(STDERR_FILENO, "Crashed! Backtrace:\n", 20);
    backtrace_symbols_fd(buffer, size, STDERR_FILENO);
    exit(1);
}

int main() {
    signal(SIGSEGV, crash_handler);
    signal(SIGABRT, crash_handler);
    
    // Your program code here
    return 0;
}
```

## 🔧 Build System Integration

### CMake

```cmake
find_package(PkgConfig REQUIRED)
pkg_check_modules(EXECINFO REQUIRED libexecinfo)

add_executable(myapp main.c)
target_link_libraries(myapp ${EXECINFO_LIBRARIES})
target_include_directories(myapp PRIVATE ${EXECINFO_INCLUDE_DIRS})
```

### Meson

```meson
execinfo_dep = dependency('libexecinfo')
executable('myapp', 'main.c', dependencies: execinfo_dep)
```

### Autotools

```m4
PKG_CHECK_MODULES([EXECINFO], [libexecinfo])
AC_SUBST([EXECINFO_CFLAGS])
AC_SUBST([EXECINFO_LIBS])
```

## 🧪 Testing

The library includes a comprehensive test suite:

```bash
# Run all tests
make test

# Run specific test categories
./test

# Performance testing
make test DEBUG=0  # Optimized build for benchmarks
```

**Test coverage includes:**
- Basic functionality verification
- Edge cases and error conditions
- Memory safety validation
- Performance benchmarks
- Cross-platform compatibility

## ⚙️ Configuration

### Build Options

```bash
# Debug build with sanitizers
make DEBUG=1 clean all

# Release build with optimizations
make DEBUG=0 clean all

# Custom stack depth (default: 128)
python gen.py --max-depth 256 --output stacktraverse.c
make clean all
```

### Environment Variables

- `CC` - C compiler (default: cc)
- `CFLAGS` - Additional compiler flags
- `PREFIX` - Installation prefix (default: /usr/local)
- `DEBUG` - Enable debug build (0/1)
- `PYTHON` - Python interpreter (default: python3)

## 📚 API Reference

### Functions

#### `int backtrace(void **buffer, int size)`

Capture return addresses from the current call stack.

**Parameters:**
- `buffer` - Array to store return addresses
- `size` - Maximum number of addresses to capture

**Returns:** Number of addresses actually captured

#### `char **backtrace_symbols(void *const *buffer, int size)`

Convert return addresses to symbolic information.

**Parameters:**
- `buffer` - Array of return addresses from `backtrace()`
- `size` - Number of addresses in buffer

**Returns:** Array of strings with symbol information (must be freed)

#### `void backtrace_symbols_fd(void *const *buffer, int size, int fd)`

Write symbolic backtrace directly to file descriptor.

**Parameters:**
- `buffer` - Array of return addresses from `backtrace()`
- `size` - Number of addresses in buffer
- `fd` - File descriptor to write to

### Macros and Constants

- `EXECINFO_MAX_FRAMES` - Maximum supported stack depth (128)
- `PRINT_BACKTRACE()` - Convenience macro to print backtrace to stderr
- `EXECINFO_VERSION_*` - Version information macros

## 🔍 Troubleshooting

### No symbol names shown

```bash
# Compile with export-dynamic flag
gcc -Wl,--export-dynamic -o myprogram myprogram.c -lexecinfo
```

### Compilation errors

```bash
# Make sure development packages are installed
sudo pacman -S base-devel

# Check pkg-config setup
pkg-config --exists libexecinfo && echo "OK" || echo "Missing"
```

### Runtime crashes

```bash
# Enable debug build
make DEBUG=1 clean all
./test
```

## ⚡ Performance Notes

- `backtrace()` is relatively fast (~1-10μs per call)
- `backtrace_symbols()` is slower due to symbol resolution (~1-100ms)
- Use `backtrace_symbols_fd()` in signal handlers (no memory allocation)
- Consider caching results for frequently called code paths

## 🤝 Contributing

Contributions are welcome! Please see our [Contributing Guidelines](CONTRIBUTING.md) for details.

### Quick Development Setup

```bash
git clone https://github.com/fam007e/libexecinfo.git
cd libexecinfo

# Set up development environment
make clean
python gen.py --max-depth 128 --output stacktraverse.c
make DEBUG=1 all test
```

### Contribution Process

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes with tests
4. Ensure all tests pass (`make test`)
5. Commit your changes (`git commit -m 'Add amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

## 📄 License

This project is licensed under the BSD 2-Clause License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Maxim Sobolev** - Original author of libexecinfo
- **GNU libc maintainers** - For the original backtrace API design
- **Arch Linux community** - For packaging support and feedback

## 📞 Support

- **GitHub Issues**: [https://github.com/fam007e/libexecinfo/issues](https://github.com/fam007e/libexecinfo/issues)
- **Email**: [faisalmoshiur@gmail.com](mailto:faisalmoshiur@gmail.com)
- **AUR Package**: [libexecinfo](https://aur.archlinux.org/packages/libexecinfo)

## 🔗 Related Projects

- [GNU libc backtrace](https://www.gnu.org/software/libc/manual/html_node/Backtraces.html) - Original implementation
- [libunwind](https://www.nongnu.org/libunwind/) - Alternative stack unwinding library
- [backward-cpp](https://github.com/bombela/backward-cpp) - C++ backtrace library

---

**Made with ❤️ for the open source community**