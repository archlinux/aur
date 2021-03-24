# Maintainer: Taiki Sugawara <buzz.taiki@gmail.com>

_pkgname=hadolint

pkgname=$_pkgname-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Dockerfile linter, validate inline bash, written in Haskell"
arch=('x86_64')
url="https://github.com/hadolint/hadolint"
license=('GPL3')
provides=('hadolint')
conflicts=('hadolint')
options=('!strip')
source=("$_pkgname-$pkgver::https://github.com/hadolint/hadolint/releases/download/v$pkgver/$_pkgname-Linux-x86_64")
sha256sums=('451858de05fa11de38401976e9a45f63bb27b448cbc6a59a9a0a60470968b091')

package() {
  install -D -m755 "$srcdir/$_pkgname-$pkgver"  "$pkgdir/usr/bin/$_pkgname"
}

# vim:set ts=2 sw=2 et:
