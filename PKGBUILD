pkgname=openvpn-update-resolv-conf
pkgver=r42.43093c2
pkgrel=0
pkgdesc="OpenVPN Update resolvconf"
arch=('any')
url="https://github.com/masterkorp/openvpn-update-resolv-conf"
license=('GPL')
depends=('openvpn' 'openresolv' 'bash')
source=("$pkgname::https://github.com/masterkorp/openvpn-update-resolv-conf/archive/43093c2f970bf84cd374e18ec05ac6d9cae444b8.zip")
makedepends=('zip')
sha256sums=('a4d52a771e1e88dc1eb5a3f67234709dcd9c3bccee7b7d61bfe5b0e0e7ba5e04')
conflicts=('openvpn-update-resolv-conf-git')

package() {
  cd "$srcdir/openvpn-update-resolv-conf-43093c2f970bf84cd374e18ec05ac6d9cae444b8"
  ls -laR
  install -D -m755 update-resolv-conf.sh "${pkgdir}/etc/openvpn/update-resolv-conf"
}

# vim:set ts=2 sw=2 et:
