# Maintainer: liberodark

pkgname=quick-n-easy-web-builder-6
pkgver=6.0.3
pkgrel=1
pkgdesc="An Web builder"
arch=('x86_64')
url="http://www.quickandeasywebbuilder.com/"
license=('Custom')
depends=('xdg-utils')
source_x86_64=("https://www.quickandeasywebbuilder.com/quick-n-easy-web-builder-6_${pkgver}_amd64.deb")
sha512sums_x86_64=('58fb43d2f9c4a7b0bff45fffabfaf0315b2587f730b272d676e3d6059c9f986b7c54491ff0425dc3bed83f3dedd98cdb2f38faf0f6060b8b3e8e1cf19f082629')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r opt $pkgdir
  cp -r usr $pkgdir
}