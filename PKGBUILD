# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: Taiki Sugawara <buzz.taiki@gmail.com>

pkgname=hadolint-bin
_pkgname=${pkgname%-bin}
pkgver=2.12.0
pkgrel=2
pkgdesc="Dockerfile linter, validate inline bash, written in Haskell"
arch=('x86_64')
url="https://github.com/hadolint/hadolint"
license=('GPL-3.0-or-later')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/hadolint-Linux-x86_64")
sha256sums=('56de6d5e5ec427e17b74fa48d51271c7fc0d61244bf5c90e828aab8362d55010')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}

# vim:set ts=2 sw=2 et:
