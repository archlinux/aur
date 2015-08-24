# Maintainer: Javier Tia <javier dot tia at gmail dot com>
pkgname=aurvote
pkgver=1.8
pkgrel=1
pkgdesc="Tool to vote for favorite AUR packages"
url="https://github.com/archlinuxfr/aurvote"
license="GPL"
arch=('any')
depends=('curl')
source=(${pkgname})
sha256sums=('076ee52d72662a2a33b0120fbbc0de49459404ffdbb966b14ebc85383420cb95')

package() {
  install -D -m 755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ft=sh ts=2 sw=2 et:
