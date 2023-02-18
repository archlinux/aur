# Maintainer:  Josh Dye <jpenguin@duck.com>

pkgname=ttf-apple-fontpack
pkgver=1
pkgrel=1
pkgdesc='A 1992 collection of fonts from Apple'
arch=('any')
url='https://www.macintoshrepository.org/37914-apple-font-pack'
license=('custom')
depends=()
conflicts=()
source=("https://filedn.com/lHGef0SOQKnBTotcJeEfshJ/Fonts/AppleFontPack.zip")
md5sums=('a810992b68c37f988c772fa4765e9402')

package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}/usr/share/fonts/ttf-apple-fontpack"
    cp */*ttf "${pkgdir}/usr/share/fonts/ttf-apple-fontpack"
}
