pkgname=openvpn-update-resolv-conf
pkgver=r24.994574f
pkgrel=1
pkgdesc="OpenVPN Update resolvconf"
arch=('any')
url="https://github.com/masterkorp/openvpn-update-resolv-conf"
license=('GPL')
depends=('openvpn' 'openresolv' 'bash')
source=('https://github.com/masterkorp/openvpn-update-resolv-conf/archive/994574f36b9147cc78674a5f13874d503a625c98.zip')
makedepends=('zip')
sha256sums=('7ce60ec549f953e092d1d3509fdda4a4f9029734742fa82b6e81c02b3ef02c6f')

package() {
  # Install vim files.
  cd $srcdir
  mv openvpn-update-resolv-conf-994574f36b9147cc78674a5f13874d503a625c98 openvpn-update-resolv-conf
  cd $srcdir/openvpn-update-resolv-conf
  install -D -m655 update-resolv-conf.sh "${pkgdir}/etc/openvpn/update-resolv-conf"
}

# vim:set ts=2 sw=2 et:
