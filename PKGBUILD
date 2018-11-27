# Maintainer: Taiki Sugawara <buzz.taiki@gmail.com>

_pkgname=hadolint
pkgname=$_pkgname-bin
pkgver=1.15.0
pkgrel=1
pkgdesc="Dockerfile linter, validate inline bash, written in Haskell"
arch=('x86_64')
url="https://github.com/hadolint/hadolint"
license=('GPL3')
provides=('hadolint')
conflicts=('hadolint-git')
source=("https://github.com/hadolint/hadolint/releases/download/v$pkgver/$_pkgname-Linux-x86_64")
sha256sums=('4b542e50aa5d5298ee7df55348cb157405dd2507404fdda8718aef19bfa7de2c')

package() {
  install -D -m755 "$srcdir/$_pkgname-Linux-x86_64"  "$pkgdir/usr/bin/$_pkgname"
}

# vim:set ts=2 sw=2 et:
