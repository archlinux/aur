# Maintainer: <darehanl@150mail.com>
# Contributor: atie H. <atie.at.matrix@gmail.com>

pkgname=ttf-nanumgothic_coding
pkgver=2.5
pkgrel=1
pkgdesc="Nanum series fixed width TrueType fonts"
arch=('any')
url="https://github.com/naver/nanumfont"
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
provides=('ttf-font')
install=ttf.install
source=("https://github.com/naver/nanumfont/releases/download/VER2.5/NanumGothicCoding-${pkgver}.zip")
md5sums=('e9083cd0788b3c9598e690e2715f0406')

package() {
    install -dm 755 ${pkgdir}/usr/share/fonts/TTF

    install -m 644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
}

