# Maintainer: Taiki Sugawara <buzz.taiki@gmail.com>

_pkgname=hadolint

pkgname=$_pkgname-bin
pkgver=2.8.0
pkgrel=1
pkgdesc="Dockerfile linter, validate inline bash, written in Haskell"
arch=('x86_64')
url="https://github.com/hadolint/hadolint"
license=('GPL3')
provides=('hadolint')
conflicts=('hadolint')
options=('!strip')
source=("$_pkgname-$pkgver::https://github.com/hadolint/hadolint/releases/download/v$pkgver/$_pkgname-Linux-x86_64")
sha256sums=('9dfc155139a1e1e9b3b28f3de9907736b9dfe7cead1c3a0ae7ff0158f3191674')

package() {
  install -D -m755 "$srcdir/$_pkgname-$pkgver"  "$pkgdir/usr/bin/$_pkgname"
}

# vim:set ts=2 sw=2 et:
