# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Colin Booth <colin@heliocat.net>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Timofey Titovets <nefelim4ag@gmail.com>
# Contributor: linuxer <linuxer@artixlinux.org>

pkgname=ananicy-s6
_alias=ananicy
pkgver=2.2.0.r55.g5559e01
pkgrel=1
pkgdesc="Ananicy - is Another auto nice daemon, with community rules support"
arch=('any')
url="https://github.com/Nefelim4ag/Ananicy"
license=('ISC')
depends=('ananicy' 's6' 'bash' 'schedtool')
makedepends=('git' 'make')
source=("ananicy.run"
        "ananicy.finish")
b2sums=('SKIP'
        'SKIP')
install=$pkgname.install

package() {
  mkdir -p "$pkgdir/etc/s6/sv/$_alias"
  cp ananicy.run $pkgdir/etc/s6/sv/$_alias/run
  cp ananicy.finish $pkgdir/etc/s6/sv/$_alias/finish
  install=ananicy-s6.install
}
