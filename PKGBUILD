# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Taiki Sugawara <buzz.taiki@gmail.com>

pkgname=hadolint-bin
_pkgname=${pkgname%-bin}
pkgver=2.14.0
pkgrel=1
pkgdesc="Dockerfile linter, validate inline bash, written in Haskell"
arch=('x86_64')
url="https://github.com/hadolint/hadolint"
license=('GPL-3.0-or-later')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/hadolint-Linux-$CARCH")
sha256sums=('6bf226944684f56c84dd014e8b979d27425c0148f61b3bd99bcc6f39e9dc5a47')

package() {
  install -vDm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}

# vim:set ts=2 sw=2 et:
