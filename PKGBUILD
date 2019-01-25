# Maintainer: Mathias Walters <waltersm@protonmail.com>

pkgname=maptool-nerps-bin
pkgver=1.4.5.4
pkgrel=1
pkgdesc="An open source virtual tabletop program, now infused with Nerps!"
arch=('x86_64')
url="https://maptool.nerps.net"
license=('AGPL3')
provides=('maptool')
conflicts=('maptool')
source=("https://github.com/JamzTheMan/MapTool/releases/download/${pkgver}/maptool-${pkgver}.deb")
sha256sums=('d0474fa117ad876c732f07b69f55caae86897ea86479b0c9f5d30717117bb5c7')

package() {

	tar -C "${pkgdir}" -xf data.tar.xz

	install -Dm644 "${pkgdir}/opt/MapTool/runtime/legal/jdk.zipfs/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${pkgdir}/opt/MapTool/runtime/legal/jdk.zipfs/COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
	install -Dm644 "${pkgdir}/opt/MapTool/MapTool.desktop" "${pkgdir}/usr/share/applications/MapTool.desktop"

}
