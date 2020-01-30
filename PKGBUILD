# Maintainer: Taiki Sugawara <buzz.taiki@gmail.com>

_pkgname=hadolint
pkgname=$_pkgname-bin
pkgver=1.17.5
pkgrel=1
pkgdesc="Dockerfile linter, validate inline bash, written in Haskell"
arch=('x86_64')
url="https://github.com/hadolint/hadolint"
license=('GPL3')
provides=('hadolint')
conflicts=('hadolint')
source=("$_pkgname-$pkgver::https://github.com/hadolint/hadolint/releases/download/v$pkgver/$_pkgname-Linux-x86_64")
sha256sums=('20dd38bc0602040f19268adc14c3d1aae11af27b463af43f3122076baf827a35')

package() {
  install -D -m755 "$srcdir/$_pkgname-$pkgver"  "$pkgdir/usr/bin/$_pkgname"
}

# vim:set ts=2 sw=2 et:
