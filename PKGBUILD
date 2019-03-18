# Maintainer: Mathias Walters <waltersm at protonmail dot com>

pkgname=maptool-stable-bin
pkgver=1.4.1.8
pkgrel=1
pkgdesc="The stable release of an open source virtual tabletop program"
arch=('x86_64')
url="https://rptools.net/tools/maptool"
license=('AGPL3')
provides=('maptool')
conflicts=('maptool')
source=("https://download.rptools.net/zip/maptool-linux64-${pkgver}.tar" "MapTool.desktop")
sha256sums=('e0a96e7349db16d2553ec976d2db8f810a3fa4b5b4ba4c22aee5e609e10ff15b' '524c13b4ebdbc392255c1fc7dbb112ab4bb9898186871fa23b3dab1c1edd16bd')

package() {

	tar -C "${pkgdir}" -xf maptool-linux64-${pkgver}.tar

    install -Dm755 "${pkgdir}/MapTool-linux64-offline" "${pkgdir}/usr/bin/MapTool-linux64-offline"
    install -Dm644 "$srcdir/MapTool.desktop" "${pkgdir}/usr/share/applications/MapTool.desktop"

}
