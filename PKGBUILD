# Maintainer: kusanaginoturugi <kusanaginoturugi(at)gmail.com>
# Contributor: yuhr <sdn.pate(at)gmail.com>

pkgname=otf-oriental
pkgver=1.00
pkgrel=1
pkgdesc="Japanese geometrical retro style Katakana font."
url="http://fontopo.com/?p=87"
license=('custom')
arch=('any')
depends=('fontconfig' 'xorg-font-util')
install=$pkgname.install
source=(oriental.zip::'https://github.com/qothr/cabinet/blob/master/oriental.zip?raw=true' LICENSE)
noextract=(LICENSE)
md5sums=('94a736491b24519ac504e8d7fa7ac7e8'
         '150bc93c45d300448425a812f7db4af5')

package() {
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"

  cd ${srcdir}
  install -dm755 "${pkgdir}"/usr/share/fonts/OTF
  install -m644 FontopoORIENTAL.otf "${pkgdir}"/usr/share/fonts/OTF/

}
