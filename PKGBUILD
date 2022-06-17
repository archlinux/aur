# Maintainer: Xiaotian Wu <yetist@gmail.com>

pkgname=open-chinese-fonts
pkgver=20200109
pkgrel=1
pkgdesc="open chinese fonts"
url="https://github.com/yetist/open-chinese-fonts"
arch=(any)
license=('GPL')
source=(https://github.com/yetist/open-chinese-fonts/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz)
sha256sums=('1525f6c2ce358e2c2352b347d74606d404d0ac630ea4031a35e4e9f9983c4593')

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
