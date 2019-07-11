# Maintainer: liberodark

pkgname=quick-n-easy-web-builder-6
pkgver=6.2.2
pkgrel=1
pkgdesc="An Web builder"
arch=('x86_64')
url="http://www.quickandeasywebbuilder.com/"
license=('Custom')
depends=('xdg-utils')
source_x86_64=("https://www.quickandeasywebbuilder.com/quick-n-easy-web-builder-6_${pkgver}_amd64.deb")
sha512sums_x86_64=('028fb10301da0d9d56486340c3e426d3667cd43ec19e7307e70688aee8c5cc47a3b8ad7f340cc9bd6269dfb88af4f46e23be5b149108f57d0629ff06946ae432')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r opt $pkgdir
  cp -r usr $pkgdir
}
