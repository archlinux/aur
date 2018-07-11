## Package Maintainer: wchurch58

pkgname=virtualshield
pkgver=1.0
pkgrel=2
pkgdesc="You have the right to remain private! VirtualShield VPN"
arch=('any')
license=('https://virtualshield.com/legal/eula/')
url="https://virtualshield.com/"
depends=('openvpn' 'mono' 'mono-tools' 'mono-addins')
optdepends=('filemanager-actions' 'openvpn-runit' 'openvpn-openrc' 'virtualshield-runit'
'virtualshield-openrc' 'virtualshield-systemd')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/wchurch58/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('445563b96b2f2624b8ea572a56dbbb3a8b736d5309461b547137c42f9feb9cd6a4f11fa8fc8e250f4b9da3ff6db9f33e6e2b12e8841bf1a279ae6ca74116c354')


package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -D -m666 "VirtualShield.exe"	"${pkgdir}/usr/share/virtualshield/VirtualShield.exe"
	install -D -m666 "VirtualShieldSvc.exe" "${pkgdir}/usr/share/virtualshield/VirtualShieldSvc.exe"
	install -D -m666 "virtualshield.desktop" "${pkgdir}/usr/share/applications/VirtualShield.desktop"
	install -D -m666 "nautilus-actions.conf" "${pkgdir}/usr/share/virtualshield/nautilus-actions.conf"
	install -D -m666 "AppIcon.png"	"${pkgdir}/usr/share/virtualshield/AppIcon.png"
	install -D -m666 "VirtualShieldSetup.exe" "${pkgdir}/usr/share/virtualshield/VirtualShieldSetup.exe"
	install -D -m666 "virtualshield.deb" "${pkgdir}/usr/share/virtualshield/virtualshield.deb"
	install -D -m666 "c5c988bb-fa14-487d-b7bf-2ccb8c2eec4d.desktop" "${pkgdir}/usr/share/virtualshield/c5c988bb-fa14-487d-b7bf-2ccb8c2eec4d.desktop"
	install -D -m755 "VirtualShield-bin" "${pkgdir}/usr/bin/VirtualShield"

}
