# Maintainer: Pavel Finkelshteyn <pavel.finkelshtein+AUR@gmail.com>

pkgname=goful-bin
pkgdesc='Goful is a CUI file manager written in Go'
pkgver=1.0.0
pkgrel=2
url='https://github.com/fareedst/goful'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=()
depends=()
_source_prefix="https://github.com/fareedst/goful/releases/download/v$pkgver/goful_linux_"
source_x86_64=("goful_$pkgver::${_source_prefix}amd64")
source_aarch64=("goful_$pkgver::${_source_prefix}arm64")
b2sums_x86_64=('61fd73d4bfa5bf0e0bd4e7a569bf832b0dbeea996be0539130e1be91c2fcbc69c8db5d04d8594c5a8974a0fcd9d9c6a1342a4d70f704e3f5073aa5fc33ba8d8a')
sha256sums_aarch64=('7a838d285ad97db2068c0b4858d9936e9ad3f074cf86cc6c9919fa3890f3243d')

package() {
    install -Dm755 "$srcdir/goful_$pkgver" "$pkgdir/usr/bin/goful"
}
