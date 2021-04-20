# Maintainer: Daniel Menelkir <menelkir at itroll dot org>
pkgname=g15stats-systemd
pkgver=20210420
pkgrel=1
pkgdesc="g15stats init script for systemd"
arch=('any')
url="https://gitlab.com/menelkir/g15stats"
license=('GPL2')
depends=('g15stats' 'systemd')
_filename='g15stats.run'
source=("https://gitlab.com/menelkir/g15stats/-/raw/master/contrib/init/g15stats.service")
sha512sums=('c74bc8965dd6152088d3c558b0f27580b8c038d3a51e1e5ac8dab4a64d25affa3ee512ecc6075e4852976921407d603f75045773153b502bc58857c133e945d6')

pkgver() {
   date +%Y%m%d
}

package() {
install -D -m 644 "g15stats.service" "${pkgdir}/usr/lib/systemd/system/g15stats.service"
}
