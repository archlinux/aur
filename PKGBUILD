# Maintainer: schopenhauer

pkgname=quick-n-easy-web-builder-7
pkgver=7.2.2
pkgrel=1
pkgdesc="An Web builder"
arch=('x86_64')
url='https://www.quickandeasywebbuilder.com/'
license=('Custom')
depends=('xdg-utils')
source=("https://www.quickandeasywebbuilder.com/quick-n-easy-web-builder-7_${pkgver}_amd64.deb")
sha512sums=('0052b7948f409abdb4a544858953ccf8ac68161db9f21d9fd1c50fa1d65e4bcce6c5f95b1a5394c11f525d36e5f73991bb94cd39d4243e47dff865b5da556cdb')
replaces=('quick-n-easy-web-builder-5' 'quick-n-easy-web-builder-6')

package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r opt $pkgdir
  cp -r usr $pkgdir
}
