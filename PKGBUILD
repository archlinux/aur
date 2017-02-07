# Maintainer: pitan <inoue(at)pitan.org>

pkgname=ttf-genshin-gothic
pkgver=20150607
pkgrel=1
pkgdesc="Japanese TrueType font based on Source Hans Sans (GennoKakuGothic)"
url="http://jikasei.me/font/genshin/"
license=('custom:SIL Open Font License 1.1')
arch=('any')
depends=()
install=$pkgname.install
source=(genshingothic-20150607.7z::https://osdn.jp/downloads/users/8/8634/genshingothic-20150607.7z)
md5sums=('9e803a9690584a125781115a587146a0')

package() {
  cd "${srcdir}"
  install -dm755 "${pkgdir}"/usr/share/fonts/TTF
  install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF/

  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 SIL_Open_Font_License_1.1.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
