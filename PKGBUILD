# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: Taiki Sugawara <buzz.taiki@gmail.com>

pkgname=hadolint-bin
_pkgname=${pkgname%-bin}
pkgver=2.13.1
pkgrel=1
pkgdesc="Dockerfile linter, validate inline bash, written in Haskell"
arch=('x86_64')
url="https://github.com/hadolint/hadolint"
license=('GPL-3.0-or-later')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/hadolint-Linux-x86_64")
sha256sums=('f8b05e4c724cdeb84c0dca07e40936c3d875c0af5d120a27c94026a0f370b2cf')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}

# vim:set ts=2 sw=2 et:
