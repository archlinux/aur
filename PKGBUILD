# Maintainer: kusanaginoturugi <kusanaginoturugi(at)gmail.com>
# Contributor: yuhr <sdn.pate(at)gmail.com>

pkgname=otf-harenosora-mincho
pkgver=1.00
pkgrel=1
pkgdesc="Japanese curvy and old style font."
url="http://fontopo.com/?p=377"
license=('custom')
arch=('any')
depends=('fontconfig' 'xorg-font-util')
install=$pkgname.install
source=(hare.zip::https://github.com/qothr/cabinet/blob/master/hare.zip?raw=true)
md5sums=('378062934c47a6ae4c79af28008730ef')

package() {
  cd ${srcdir}
  install -dm755 "${pkgdir}"/usr/share/fonts/OTF
  install -m644 Harenosora.otf "${pkgdir}"/usr/share/fonts/OTF/

  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 IPA_Font_License_Agreement_v1.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}
