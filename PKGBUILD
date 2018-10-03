# Maintainer: liberodark

pkgname=quick-n-easy-web-builder-6
pkgver=6.0.2
pkgrel=1
pkgdesc="An Web builder"
arch=('x86_64')
url="http://www.quickandeasywebbuilder.com/"
license=('Custom')
depends=('xdg-utils')
source_x86_64=("https://www.quickandeasywebbuilder.com/quick-n-easy-web-builder-6_${pkgver}_amd64.deb")
sha512sums_x86_64=('d617f64381822a2593f0472b7f5e88f2f5ed2e70ea1857cf23d9723662176462e3af221766601c4ba0e81cedab995b410fcca916b2ec61c04610bcc2423e4166')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r opt $pkgdir
  cp -r usr $pkgdir
}