# Maintainer: schopenhauer

pkgname=quick-n-easy-web-builder-7
pkgver=7.3.2
pkgrel=1
pkgdesc="WYSIWYG web builder"
arch=('x86_64')
url='https://www.quickandeasywebbuilder.com/'
license=('Custom')
depends=('xdg-utils')
source=("https://www.quickandeasywebbuilder.com/quick-n-easy-web-builder-7_${pkgver}_amd64.deb")
sha512sums=('125a25054eca73a997050e1ed2ffc94256c7da63305978ca08d1d10ee8ee1bdc9d9062192fa9da81b8ae4a60cf5589eba5f0b7cc39e387b86a47126fbff114af')
replaces=('quick-n-easy-web-builder-5' 'quick-n-easy-web-builder-6')

package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r opt $pkgdir
  cp -r usr $pkgdir
}
