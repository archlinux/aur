## Package Maintainer: chrispaul
pkgname=virtualshield-git
pkgver=1.0
pkgrel=1
pkgdesc="You have the right to remain private! VirtualShield VPN"
arch=('any')
license=('https://virtualshield.com/legal/eula/')
url="https://virtualshield.com/"
depends=('openvpn' 'mono' 'mono-tools' 'mono-addins')
optdepends=('filemanager-actions' 'openvpn-runit' 'openvpn-openrc' 'virtualshield-runit-git'
'virtualshield-openrc-git' 'virtualshield-systemd-git')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/wchurch58/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('4c1847d81696ebf6292f0f5ba9547cfdd209de66d1ddac5578398844c22598184f6a733c2a3a31ad0be7912714b48311b3eaf01132cdc475c2dcbda7db64a129')
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
