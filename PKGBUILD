# Maintainer: yuhr <sdn.pate(at)gmail.com>

pkgname=otf-hannari-mincho
pkgver=1.12
pkgrel=1
pkgdesc="Japanese curvy and gentle style font."
url="http://typingart.net/?p=44"
license=('custom')
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=(hannari.zip::https://github.com/qothr/cabinet/blob/master/hannari.zip?raw=true)
md5sums=('77b42a9edf5c43e3968f1d6ac87bfea7')

package() {
  cd ${srcdir}
  install -dm755 "${pkgdir}"/usr/share/fonts/OTF
  install -m644 Hannari.otf "${pkgdir}"/usr/share/fonts/OTF/

  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 IPA_Font_License_Agreement_v1.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}
