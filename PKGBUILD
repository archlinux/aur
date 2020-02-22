# Maintainer: Anton Karmanov <bergentroll@insiberia.net>

pkgname=sound-theme-smooth
pkgver=1.2
pkgrel=1
pkgdesc='Complete system sound theme with 58 event sounds.'
arch=('any')
url='https://www.pling.com/p/1187979/'
license=('combined free')
source=("$pkgname-$pkgver.tar.gz::http://my.opendesktop.org/s/QrcjmXiTpqQsciE/download")
md5sums=('604fad389740b481d16a40d74c3b49fd')

package() {
  cd ${srcdir}

  install -dm755 "${pkgdir}/usr/share/sounds/Smooth"
  install -dm755 "${pkgdir}/usr/share/sounds/Smooth/stereo"
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"

  install -m644 Smooth/documentation/* \
    "${pkgdir}/usr/share/doc/${pkgname}"

  install -m644 Smooth/index.theme "${pkgdir}/usr/share/sounds/Smooth"
  install -m644 Smooth/stereo/* \
    "${pkgdir}/usr/share/sounds/Smooth/stereo"
}
