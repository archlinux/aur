# Maintainer: Oleksandr Natalenko aka post-factum <oleksandr@natalenko.name>
# Original author: xduugu
pkgname=netctl-vpnc
pkgver=20130521
pkgrel=1
pkgdesc="VPNC support for netctl"
arch=(any)
url="http://www.archlinux.org"
license=('GPL')
depends=(netctl vpnc)
source=(vpnc.profile vpnc)
md5sums=('c29a06961b7e8d48cc854c29f4219e77'
         'a7992c43b6e2ee8806773181e317afaf')
sha256sums=('c463f7db0928be90b97988d992ace61b476a8c4c3e8eedc5be33a2393c81ed46'
	    '7cb902b19474b9842584e7b4f0f2146a1f11c89c29d3737013816bcecd0b756e')

package() {
  install -Dm644 "$srcdir/vpnc.profile" "$pkgdir/etc/netctl/examples/vpnc"
  install -Dm755 "$srcdir/vpnc" "$pkgdir/usr/lib/network/connections/vpnc"
}
