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
sha512sums=('3853f9fe550f6f41d9856f1e83435c9c27e0f1c39d7e45b05397b89cf83b4452f8e16c59403cabf6b496e65356e62703a70358c7ed5cb3757b7f81807d2a0975')


package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -D -m666 "VirtualShield.exe"	"${pkgdir}/usr/share/virtualshield/VirtualShield.exe"
	install -D -m666 "VirtualShieldSvc.exe" "${pkgdir}/usr/share/virtualshield/VirtualShieldSvc.exe"
	install -D -m666 "virtualshield.desktop" "${pkgdir}/usr/share/applications/VirtualShield.desktop"
	install -D -m666 "nautilus-actions.conf" "${pkgdir}/usr/share/virtualshield/nautilus-actions.conf"
	install -D -m666 "AppIcon.png"	"${pkgdir}/usr/share/virtualshield/AppIcon.png"
	install -D -m666 "VirtualShieldSetup.exe" "${pkgdir}/usr/share/virtualshield/VirtualShieldSetup.exe"
	install -D -m666 "virtualshield.deb" "${pkgdir}/usr/local/share/virtualshield/virtualshield.deb"
	install -D -m666 "c5c988bb-fa14-487d-b7bf-2ccb8c2eec4d.desktop" "${pkgdir}/usr/share/virtualshield/c5c988bb-fa14-487d-b7bf-2ccb8c2eec4d.desktop"
	install -D -m755 "VirtualShield-bin" "${pkgdir}/usr/bin/VirtualShield"

}
