pkgname=gtomb-bin
pkgver=0.8
pkgrel=1
pkgdesc="VPNKS protects you against leaks caused by disconnetction"
arch=('any')
url="https://github.com/plasticbrain/vpnkillswitch"
license=('GPL')
depends=('networkmanager' 'libnm-glib' 'networkmanager-openvpn' 'nm-connection-editor' 'openvpn' 'systemd')
makedepends=('bash')
source=(https://raw.githubusercontent.com/dyne/Tomb/master/extras/gtomb/gtomb
)
sha256sums=('6829039ad5f81f30582d11b92a10496f23a7e4252745936aa58f9683b9c10b34')
sha384sums=('089d8faeb18d529d7ad2c1e93bf7baa9d37895947a2eb88d218485c3a3f38529487ef107737177d8e3b1aa01ab6f6e98')
sha512sums=('1ed004fc871b0e9aefb79b607a15d4eda35d2b27a201eabe0e47ae99b929cf7cf0b08ee3fedf664a7f97a5b1320da1be79ec1f04b3be7b064f82e7a4297f5c25')
package() {
	mkdir -p "${pkgdir}/usr/bin"
	chmod +x ${srcdir}/gtomb
	cp ${srcdir}/gtomb ${pkgdir}/usr/bin/gtomb
}

# vim:set ts=2 sw=2 et: