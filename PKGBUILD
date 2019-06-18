# Maintainer: wafflefrisbee ( dev [at] longfam [dot] org )

pkgname=ttf-bevan
pkgver=1.0
pkgrel=1
pkgdesc="Bevan is a web font design based on a number of old pre-digital typeface designs."
arch=('any')
license=('custom:OFL')
url="https://github.com/vernnobile/BevanFont"
depends=('fontconfig')
install=ttf.install
source=('git+https://github.com/vernnobile/BevanFont.git' 'ttf.install')
md5sums=('SKIP' 'SKIP')

package () {
  install -Dm644 ${srcdir}/BevanFont/1.0/Bevan.ttf "${pkgdir}/usr/share/fonts/TTF/Bevan.ttf"
  install -Dm644 ${srcdir}/BevanFont/1.0/OFL.txt "${pkgdir}/usr/share/licenses/$pkgname/OFL.txt"
}