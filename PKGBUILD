# Maintainer: Taiki Sugawara <buzz.taiki@gmail.com>

_pkgname=hadolint

pkgname=$_pkgname-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="Dockerfile linter, validate inline bash, written in Haskell"
arch=('x86_64')
url="https://github.com/hadolint/hadolint"
license=('GPL3')
provides=('hadolint')
conflicts=('hadolint')
options=('!strip')
source=("$_pkgname-$pkgver::https://github.com/hadolint/hadolint/releases/download/v$pkgver/$_pkgname-Linux-x86_64")
sha256sums=('048ca227d596df3d9d0a461d35fe8d082ed4f8f73cf266e77f5d0ee37ca4c78f')

package() {
  install -D -m755 "$srcdir/$_pkgname-$pkgver"  "$pkgdir/usr/bin/$_pkgname"
}

# vim:set ts=2 sw=2 et:
