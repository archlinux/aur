# Maintainer: Taiki Sugawara <buzz.taiki@gmail.com>

_pkgname=hadolint
pkgname=$_pkgname-bin
pkgver=1.16.0
pkgrel=1
pkgdesc="Dockerfile linter, validate inline bash, written in Haskell"
arch=('x86_64')
url="https://github.com/hadolint/hadolint"
license=('GPL3')
provides=('hadolint')
conflicts=('hadolint-git')
source=("https://github.com/hadolint/hadolint/releases/download/v$pkgver/$_pkgname-Linux-x86_64")
sha256sums=('104bb5cec00de99a2a041b584877581125bcc2607c0e24fe730a55cbec4043f3')

package() {
  install -D -m755 "$srcdir/$_pkgname-Linux-x86_64"  "$pkgdir/usr/bin/$_pkgname"
}

# vim:set ts=2 sw=2 et:
