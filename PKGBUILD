# Maintainer: Adria Arrufat <swiftscythe at gmail dot com>

pkgname=ugrep
pkgver=2.0
pkgrel=1
pkgdesc="Universal grep: ultra fast searcher of file systems, text and binary files, source code, archives, compressed files, documents, and more."
arch=(x86_64)
license=(BSD-3)
url="https://github.com/Genivia/ugrep"
depends=(pcre2 zlib bzip2 xz)
source=("https://github.com/Genivia/ugrep/archive/v${pkgver}.tar.gz")
sha256sums=('924797f60232ce7669e0747d2cf0a00a2b3036aa0e1e7711e127ab5b8540bad4')

build() {
    cd ${pkgname}-${pkgver}
    ./build.sh --prefix=${pkgdir}/usr/
}

package() {
    cd ${pkgname}-${pkgver}
    make install
}
