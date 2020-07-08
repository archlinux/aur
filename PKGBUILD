# Maintainer: schopenhauer

pkgname=quick-n-easy-web-builder-7
pkgver=7.3.1
pkgrel=1
pkgdesc="An Web builder"
arch=('x86_64')
url='https://www.quickandeasywebbuilder.com/'
license=('Custom')
depends=('xdg-utils')
source=("https://www.quickandeasywebbuilder.com/quick-n-easy-web-builder-7_${pkgver}_amd64.deb")
sha512sums=('ddd036f39a822b8aeb88cbc14c55f095435c5afbb3a04cd08f29e342e90720b35bdc58b0633a5037a20479a31c1106a1edb61e8aa7ebc12edfcee97ec053555f')
replaces=('quick-n-easy-web-builder-5' 'quick-n-easy-web-builder-6')

package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r opt $pkgdir
  cp -r usr $pkgdir
}
