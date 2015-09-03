pkgname=wol-systemd
pkgver=20150903
pkgrel=1
pkgdesc="A systemd unit file for enabling Wake-On-LAN automatically"
arch=('any')
url="https://bitbucket.org/instarch/wol-systemd"
license=('MIT')
depends=('ethtool')
install=wol-systemd.install
source=('wol@.service' 'wol-systemd.install')

package() {
  install -Dm 644 wol@.service "${pkgdir}/usr/lib/systemd/system/wol@.service"
}
sha1sums=('2fae47e792b954f8e70a2dbe9df56458e65ff75b'
          '7d1c8ce6f187316746e11fc403f469137ad3a6b4')
