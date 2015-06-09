# Maintainer: Philip Sequeira <phsequei at gmail dot com>

pkgname=otf-exo
pkgver=2.0
pkgrel=4
pkgdesc='A geometric sans serif font with a technological feel'
arch=('any')
url='http://ndiscovered.com/exo-2/'
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
install=otf.install
source=('http://www.ndiscovered.com/downloads/exo2/EXO_2_OTF.zip')
md5sums=('538ac351c1d0dc13b658625894646805')
sha256sums=('af21ab3a7df57544625ebaaa6a66a9cae7666ce6c994030106a1f7e1e3a67ade')

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF/"
}
