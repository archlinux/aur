# Maintainer: GI_Jack <GI_Jack@hackermail.com>

# See README for use

pkgname=digispark-udev
pkgver=20210122
pkgrel=1
pkgdesc="udev rules for digispark adriuno"
arch=('any')
url="http://digistump.com/wiki/digispark/tutorials/linuxtroubleshooting"
license=('GPL')
depends=('udev')
install=${pkgname}.install
optdepends=('arduino: IDE for programming digispark devices')
source=("49-micronucleus.rules" "README")
sha256sums=('532d0c38faa9294c29ff280a60fd4e3d5fe4d680338d189091acf2818641c6ab'
            '7593393a00a626c957ec70d3a24fdb3c3df3ba93de7a560162b13442f97cfc0e')

package() {
  install -Dm644 49-micronucleus.rules "${pkgdir}/etc/udev/rules.d/49-micronucleus.rules"
  cat README
}
