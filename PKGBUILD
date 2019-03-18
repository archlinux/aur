# Maintainer: Taiki Sugawara <buzz.taiki@gmail.com>

_pkgname=hadolint
pkgname=$_pkgname-bin
pkgver=1.16.1
pkgrel=2
pkgdesc="Dockerfile linter, validate inline bash, written in Haskell"
arch=('x86_64')
url="https://github.com/hadolint/hadolint"
license=('GPL3')
provides=('hadolint')
conflicts=('hadolint')
source=("https://github.com/hadolint/hadolint/releases/download/v$pkgver/$_pkgname-Linux-x86_64")
sha256sums=('e50ce3f56ad764cb50a0c913b56a34381df833c15e2c2fe055184cf7128cf3e6')

package() {
  install -D -m755 "$srcdir/$_pkgname-Linux-x86_64"  "$pkgdir/usr/bin/$_pkgname"
}

# vim:set ts=2 sw=2 et:
