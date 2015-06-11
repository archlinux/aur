# Maintainer: xpt <user.xpt@gmail.com>

pkgname=otf-ryman-eco
pkgver=1.0
pkgrel=0
pkgdesc="The world's most beautiful sustainable font"
arch=('any')
url="http://rymaneco.co.uk"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
install=otf.install
source=('http://rymaneco.co.uk/download/ryman-eco.zip')
md5sums=('faca025548b89add18d3891593f800e5')

package() {
  cd "$srcdir/Ryman Eco"
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 'Ryman Eco'/*.otf "$pkgdir/usr/share/fonts/OTF/"
  install -Dm644 "Ryman Eco End User License Agreement.pdf" "$pkgdir/usr/share/licenses/$pkgname/License.pdf"
}
