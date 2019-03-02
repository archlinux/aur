# Maintainer: Mathias Walters <waltersm@protonmail.com>

pkgname=maptool-nerps-bin
pkgver=1.4.5.4
pkgrel=2
pkgdesc="An open source virtual tabletop program, now infused with Nerps!"
arch=('x86_64')
url="https://maptool.nerps.net"
license=('AGPL3')
provides=('maptool')
conflicts=('maptool')
source=("https://github.com/JamzTheMan/MapTool/releases/download/${pkgver}/maptool-${pkgver}.deb")
sha256sums=('9dc9be32feb91b76d64b89c47719259fddb7de5f3582256f82ece8ad177c74a3')

package() {

	tar -C "${pkgdir}" -xf data.tar.xz

	install -Dm644 "${pkgdir}/opt/MapTool/runtime/legal/jdk.zipfs/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${pkgdir}/opt/MapTool/runtime/legal/jdk.zipfs/COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
	install -Dm644 "${pkgdir}/opt/MapTool/MapTool.desktop" "${pkgdir}/usr/share/applications/MapTool.desktop"

}
