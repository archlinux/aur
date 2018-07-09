## Package Maintainer: Karl-K

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
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/karl-k/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('695a073b4621f88ef56c790c1c96cf14326191157cf333c996bc3bc04d7571b02dd0955162ea73c4a31ec7c5eec5b1585296c08c591aba6491526d56d3796b8f')


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
