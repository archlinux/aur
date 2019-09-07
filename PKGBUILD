# Maintainer: Taiki Sugawara <buzz.taiki@gmail.com>

_pkgname=hadolint
pkgname=$_pkgname-bin
pkgver=1.17.2
pkgrel=1
pkgdesc="Dockerfile linter, validate inline bash, written in Haskell"
arch=('x86_64')
url="https://github.com/hadolint/hadolint"
license=('GPL3')
provides=('hadolint')
conflicts=('hadolint')
source=("$_pkgname-$pkgver::https://github.com/hadolint/hadolint/releases/download/v$pkgver/$_pkgname-Linux-x86_64")
sha256sums=('b23e4d0e8964774cc0f4dd7ff81f1d05b5d7538b0b80dae5235b1239ab60749d')

package() {
  install -D -m755 "$srcdir/$_pkgname-$pkgver"  "$pkgdir/usr/bin/$_pkgname"
}

# vim:set ts=2 sw=2 et:
