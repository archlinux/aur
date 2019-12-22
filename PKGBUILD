# Maintainer: schopenhauer

pkgname=quick-n-easy-web-builder-7
pkgver=7.1.1
pkgrel=1
pkgdesc="An Web builder"
arch=('x86_64')
url='https://www.quickandeasywebbuilder.com/'
license=('Custom')
depends=('xdg-utils')
source=("https://www.quickandeasywebbuilder.com/quick-n-easy-web-builder-7_${pkgver}_amd64.deb")
sha512sums=('689d195c5d2e32361946af5f4da6fdd804afda37b46017a1f42c2b32fef8d178b5002fc1801fadd8bce71630f8e7671b8406c24fa61de3ddc1205f81cc5d6631')
replaces=('quick-n-easy-web-builder-5' 'quick-n-easy-web-builder-6')

package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r opt $pkgdir
  cp -r usr $pkgdir
}
