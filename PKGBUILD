# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=ttf-gallaudet
pkgver=v0.0.1
pkgrel=1
pkgdesc="An American Sign Language and fingerspelling font."
arch=('any')
url="https://www.lifeprint.com/asl101/pages-layout/gallaudettruetypefont.htm"
license=('custom:proprietary')
source=("https://www.lifeprint.com/asl101/fingerspelling/gallaudet/GALLAUDET.ttf"
        "LICENSE")
sha256sums=('70c7e805faaec0c71e9bf057d3ec850777079671116701cff36e03fba6ff7d31'
            '9bcd26d71fe1a2c47eeb92049384abed87e781e1d6ab314e4e901b1f2af4cb60')

package() {
  install -d ${pkgdir}/usr/share/fonts/TTF
  install -Dm644 ${srcdir}/GALLAUDET.ttf ${pkgdir}/usr/share/fonts/TTF/

  install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
