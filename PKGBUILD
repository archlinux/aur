# Maintainer: Taiki Sugawara <buzz.taiki@gmail.com>

_pkgname=hadolint
pkgname=$_pkgname-bin
pkgver=1.18.2
pkgrel=1
pkgdesc="Dockerfile linter, validate inline bash, written in Haskell"
arch=('x86_64')
url="https://github.com/hadolint/hadolint"
license=('GPL3')
provides=('hadolint')
conflicts=('hadolint')
options=('!strip')
source=("$_pkgname-$pkgver::https://github.com/hadolint/hadolint/releases/download/v$pkgver/$_pkgname-Linux-x86_64")
sha256sums=('e973f17a4bee266287d035859f0318f1b43196dc5f2e60b348ec3ff1f122e450')

package() {
  install -D -m755 "$srcdir/$_pkgname-$pkgver"  "$pkgdir/usr/bin/$_pkgname"
}

# vim:set ts=2 sw=2 et:
