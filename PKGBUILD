# Maintainer: Mathias Walters <waltersm at protonmail dot com>

pkgname=maptool-stable-bin
pkgver=1.4.1.8
pkgrel=4
pkgdesc="The stable release of an open source virtual tabletop program"
arch=('x86_64')
url="https://rptools.net/tools/maptool"
license=('AGPL3')
optdepends=('gvfs: access virtual filesystem')
provides=('maptool')
conflicts=('maptool')
source=("https://download.rptools.net/zip/maptool-linux64-${pkgver}.tar" "MapTool.desktop")
options=(!strip)
sha256sums=('e0a96e7349db16d2553ec976d2db8f810a3fa4b5b4ba4c22aee5e609e10ff15b' 'b99e854c0ecab9ce600dcaf87e255f87e9a0f056a5583cae672dc1975afcb678')

package() {
    install -Dm 644 "$srcdir"/MapTool.desktop -t "$pkgdir"/usr/share/applications/
    install -Dm 755 "$srcdir"/MapTool-linux64-offline -t "$pkgdir"/usr/bin/
}
