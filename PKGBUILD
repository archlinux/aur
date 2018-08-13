# Maintainer: liberodark

pkgname=elcalc
pkgver=4.0.8
pkgrel=1
pkgdesc="Simple, Cross-Platform calculator built with Electron! In less than 100 lines of code."
arch=('x86_64')
url="https://github.com/elcalc/elcalc/"
license=('GPL')
depends=('xdg-utils')
source_x86_64=("https://github.com/elcalc/elcalc/releases/download/4.8/elcalc_${pkgver}_amd64.deb")
source=($pkgname.desktop
        $pkgname.png)
sha512sums=('b078f9108b73f79b5ead6bda9a7dacc1e7806413f549c8132fe6f37548c5e93a0a7505b3397cf49a6fe8c7827ba3430b4242c2fd67fcd722482dd4372891aa14'
         'a15838f134ac3a85cb2dbbb508ee6fca18923156d17a05ef8a64778e573a28605e45475b6d4e21e3a5f00ebd1f0d4e2f6b058537c0d919e174e67444afa64ead')
sha512sums_x86_64=('4d97cec298aaca8ae76e3a36a25c0f270fc0b12cec853d3fc700cfc15c5b44d85817d807d9acb6cda3335cef39c23f84c49eebb420cd390718d2c91eb7dd4ad5')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r opt $pkgdir
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}

