# Maintainer: Christopher Patrick Fair <christopherpatrickfair@gmail.com>
pkgname=newscid-bin
pkgver=2.1.2
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
validpgpkeys=('72258688D0C74A460621B38B0EBAF09296D92C11')
source_x86_64=(
    "newscid-${pkgver}-linux-x86_64.tar.gz::https://github.com/chrisfair/newscid/releases/download/v${pkgver}/newscid-${pkgver}-linux-x86_64.tar.gz"
    "newscid-${pkgver}-linux-x86_64.tar.gz.asc::https://github.com/chrisfair/newscid/releases/download/v${pkgver}/newscid-${pkgver}-linux-x86_64.tar.gz.asc"
)
sha256sums_x86_64=(
    '8c541378790617135bf24444cb9f99f8a4ae9275fdd6d2300685f89268944a34'
    'SKIP'
)

package() {
    cp -a "${srcdir}/usr" "${pkgdir}/usr"
}
