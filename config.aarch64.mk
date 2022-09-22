## Install configuration

PREFIX = /usr
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/share/man
SRCDIR = $(PREFIX)/src

# Where to install the stdlib tree
STDLIB = $(SRCDIR)/hare/stdlib

# Default HAREPATH
HAREPATH = $(SRCDIR)/hare/stdlib:$(SRCDIR)/hare/third-party

## Build configuration

# Platform to build for
PLATFORM = linux
ARCH = aarch64

# External tools and flags
HAREC = harec
HAREFLAGS =
QBE = qbe
AS = as
LD = ld
AR = ar
SCDOC = scdoc

# Where to store build artifacts
HARECACHE = .cache
BINOUT = .bin

# Cross-compiler toolchains
AARCH64_AS=as
AARCH64_AR=ar
AARCH64_CC=gcc
AARCH64_LD=ld

RISCV64_AS=riscv64-linux-gnu-as
RISCV64_AR=riscv64-linux-gnu-ar
RISCV64_CC=riscv64-linux-gnu-gcc
RISCV64_LD=riscv64-linux-gnu-ld

X86_64_AS=x86_64-linux-gnu-as
X86_64_AR=x86_64-linux-gnu-ar
X86_64_CC=x86_64-linux-gnu-gcc
X86_64_LD=x86_64-linux-gnu-ld
