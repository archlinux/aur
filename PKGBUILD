# Maintainer: Michael Egger

pkgname=vpndemon
pkgver=1.0
pkgrel=4
pkgdesc="a vpn killswitc MUST BE RUN AS ROOT"
arch=('any')
url="https://github.com/primaryobjects/vpndemon"
license=('GPL')
depends=('dbus' 'bash' 'networkmanager-openvpn' 'openvpn')
makedepends=('bash')
source=(https://github.com/primaryobjects/vpndemon/archive/master.zip)
sha384sums=('a750b66d813750d9aa63ed76e79d1c51c39b2619835fa9571fa2ead8b04d64333c7424646211cf53f4e6422aa0af88dc')
sha256sums=('e93b043e621644752d688f8c45836bd7b5f6f283fbcf2e9241afea35ed0221b7')
sha512sums=('38da3528540b4aa9cbe539dc2769ff76e73a734cd4a15ce2fe0f66978a9825d4e36a39c5dac8ce4deb5bac2a1f22b67d876d55a0c8b38544d9120b64597bf08a')

package() {	mkdir -p "${pkgdir}/usr/bin"
        for file in ${srcdir}/vpndemon-master/vpnde*
	do
		install -D -m644 "${file}" "${pkgdir}/usr/bin/"
	done
           mv "${pkgdir}/usr/bin/vpndemon.sh" "${pkgdir}/usr/bin/vpndemon"
          }

# vim:set ts=2 sw=2 et:
