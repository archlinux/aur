# Maintainer: Christopher Patrick Fair <christopherpatrickfair@gmail.com>
pkgname=newscid-bin
pkgver=2.1.1
pkgrel=1
pkgdesc="Chess Information Database (Scid v4 compatible) — prebuilt binary"
arch=('x86_64')
url="https://github.com/chrisfair/newscid"
license=('GPL-3.0-or-later')
depends=('gtk3' 'webkit2gtk-4.1' 'hicolor-icon-theme')
optdepends=(
    'stockfish: strong default UCI chess engine'
    'fruit: legacy UCI chess engine'
    'scid: legacy database tools (tcscid)'
)
provides=('newscid')
conflicts=('newscid')
options=('!strip')
source_x86_64=("newscid-${pkgver}-linux-x86_64.tar.gz::https://github.com/chrisfair/newscid/releases/download/v${pkgver}/newscid-${pkgver}-linux-x86_64.tar.gz")
sha256sums_x86_64=('8c17829838396b50fa4b83416119cc29400518eff8e68f6c5ff6d5d00eb347a9')

package() {
    cp -a "${srcdir}/usr" "${pkgdir}/usr"
}
