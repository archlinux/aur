# Maintainer: Benjamin Goodger <ben at goodger dot nl>
# Contributor: Marcos Heredia <chelqo at gmail dot com>

pkgname=ttf-impallari-encode-sans

pkgver=2.0
pkgrel=2

pkgdesc="Professional font optimized for web use"
arch=('any')
url="https://github.com/impallari/Encode-Sans"
license=('OFL')
groups=('impallari-fonts')

source=("https://github.com/impallari/Encode-Sans/archive/370cdccdb22daf862c6fca0636aad64b6835decd.zip")

md5sums=('28feb5d966eea66326b57c23f1fcf53b')

package() {
  cd ${srcdir}/Encode-Sans*/

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/impallari/encode-sans"
  install -Dpm644 fonts/*.ttf "${pkgdir}/usr/share/fonts/TTF/impallari/encode-sans/"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dpm644 AUTHORS.txt CONTRIBUTORS.txt README.md "${pkgdir}/usr/share/doc/${pkgname}/"
}
