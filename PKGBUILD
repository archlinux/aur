# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=oscill8
pkgver=2.0.11
pkgrel=1
pkgdesc='Time course, parameter scan and bifurcation analysis of ODE systems'
arch=('i686' 'x86_64')
url=('http://oscill8.sourceforge.net/')
license=('BSD')
depends=('mono')
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/oscill8_mac_manual_setup.zip/download" "oscill8_starter")
md5sums=('53bf86373bb4245414ac6c67a3cfe99c'
         '4411a2ae23364fabb6aae78862894daa')

package() {
  mkdir -p "$pkgdir/opt"
  cp -R "$srcdir/oscill8" "$pkgdir/opt"
  install -Dm755 oscill8_starter "$pkgdir/usr/bin/oscill8"
}
