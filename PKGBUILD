# Maintainer: Christopher Patrick Fair <christopherpatrickfair@gmail.com>
pkgname=newscid-bin
pkgver=2.1.3
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
    "https://github.com/chrisfair/newscid/releases/download/v${pkgver}/newscid-${pkgver}-${pkgrel}-linux-x86_64.tar.gz"
    "https://github.com/chrisfair/newscid/releases/download/v${pkgver}/newscid-${pkgver}-${pkgrel}-linux-x86_64.tar.gz.asc"
)
sha256sums_x86_64=(
    '2ce1e493d67c0ab8238e942f5148abed0b75f51fe01fb29947f15e67417ee6e2'
    'SKIP'
)

package() {
    cp -a "${srcdir}/usr" "${pkgdir}/usr"
}
