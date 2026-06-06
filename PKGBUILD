# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=otf-e73
pkgdesc='Rendering of the ECMA-42 standard bitmap printer font from 1973'
pkgver=2.0
pkgrel=1
url=https://scruss.com/blog/2026/05/29/new-font-e73/
arch=(any)
license=(OFL-1.1)
source=("e73-regular-$pkgver.otf::https://github.com/scruss/E73/releases/download/v$pkgver/E73-Regular.otf")
sha256sums=('df16b6f6f868e4ec0ae89180c29e25d6eed08b9f03df55491f5bf09cdffb7e01')

build () {
        : Nothing to do
}

package () {
        install -Dm644 "e73-regular-$pkgver.otf" "$pkgdir/usr/share/fonts/OTF/e73-regular.otf"
}

