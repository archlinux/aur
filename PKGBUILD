# Maintainer:  Josh Dye <jpenguin@duck.com>

pkgname=ttf-monterey-fonts-en
pkgver=1
pkgrel=1
pkgdesc='Fonts extracted from the MacOS Monterey image'
arch=('any')
url='https://archive.org/details/macos_iso'
license=('custom')
depends=()
conflicts=()
source=("https://filedn.com/lHGef0SOQKnBTotcJeEfshJ/Fonts/Monterey.tar.zst")
md5sums=('b3ae9a1235048c2d67506a583108450c')

package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}/usr/share/fonts/ttf-monterey-fonts-en"
    cp */*ttf "${pkgdir}/usr/share/fonts/ttf-monterey-fonts-en"
    cp */*ttc "${pkgdir}/usr/share/fonts/ttf-monterey-fonts-en"
    cp */*/*ttf "${pkgdir}/usr/share/fonts/ttf-monterey-fonts-en"
    cp */*/*ttc "${pkgdir}/usr/share/fonts/ttf-monterey-fonts-en"
}
