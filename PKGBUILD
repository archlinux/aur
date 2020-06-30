# Maintainer: <darehanl@150mail.com>
# Contributor: atie H. <atie.at.matrix@gmail.com>

pkgname=ttf-nanumgothic_coding
pkgver=2.5
pkgrel=2
pkgdesc="Nanum series fixed width TrueType fonts"
arch=('any')
url="https://github.com/naver/nanumfont"
license=('custom:OFL')
source=("https://github.com/naver/nanumfont/releases/download/VER${pkgver}/NanumGothicCoding-${pkgver}.zip")
sha256sums=('f4c9b1082cb36d793ccf75a331316c880ef9e4bc229408c22f9d2703b7619a3f')

package() {
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 "${srcdir}"/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
}

