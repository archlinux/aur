# Maintainer: schopenhauer

pkgname=quick-n-easy-web-builder-7
pkgver=7.0.4
pkgrel=1
pkgdesc="An Web builder"
arch=('x86_64')
url='https://www.quickandeasywebbuilder.com/'
license=('Custom')
depends=('xdg-utils')
source=("https://www.quickandeasywebbuilder.com/quick-n-easy-web-builder-7_${pkgver}_amd64.deb")
sha512sums=('52a6bff2d150355f35eebd0f7a8a691488ee9b66ed1275b2615815deb7f1d6c6241e887d86cd98b2cf957810ad3d2605d54851902264c35fe7b1c7e6949334cc')
replaces=('quick-n-easy-web-builder-5', 'quick-n-easy-web-builder-6')

package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r opt $pkgdir
  cp -r usr $pkgdir
}
