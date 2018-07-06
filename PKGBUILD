## Package Maintainer: Karl-K

pkgname=virtualshield
pkgver=1.0
pkgrel=1
pkgdesc="You have the right to remain private! VirtualShield VPN"
arch=('any')
license=('https://virtualshield.com/legal/eula/')
url="https://virtualshield.com/"
depends=('openvpn' 'mono' 'mono-tools' 'mono-addins')
optdepends=('filemanager-actions' 'openvpn-runit' 'openvpn-openrc' 'virtualshield-runit'
'virtualshield-openrc' 'virtualshield-systemd')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/karl-k/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('66c2816f445fec824de555f50209696f314589a6edf883b15578792133532bdcf9e560014eef4c4ec7c1ccae454535657bea15a9c755a7b3b68d9de7c11d6586')


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

}
