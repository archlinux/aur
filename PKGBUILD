# Maintainer: AnDenL <andenl145@gmail.com>
pkgname=crupp-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A Cargo-like build system for C and C++ with in-memory comptime (pre-built binary)"
arch=('x86_64')
url="https://github.com/AnDenL/crub-graper"
license=('MIT')
depends=('glibc')
optdepends=(
    'gcc: GNU C/C++ compiler backend'
    'clang: LLVM C/C++ compiler backend'
)
provides=('crupp')
conflicts=('crupp')
options=('!strip')

source=("crupp-x86_64.tar.gz::https://github.com/AnDenL/crub-graper/releases/download/v${pkgver}/crupp-x86_64.tar.gz")
sha256sums=('d00ad69f7967c7877d5786f4acd1e60361f11d7b60c27d2ef3208d15149b64f0')

package() {
    install -Dm755 "$srcdir/crupp" "$pkgdir/usr/bin/crupp"
}
