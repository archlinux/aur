#Maintainer: Alia Skywol <skywol@qq.com>

pkgname=marea-icon-theme
pkgver=4.7
pkgrel=1
pkgdesc="Marea Icons"
arch=('any')
url="https://github.com/Skywol/marea-icon-theme"
license=('GPL3')
replaces=('')
conflicts=('')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Skywol/marea-icon-theme/archive/${pkgver}.tar.gz")
sha512sums=('SKIP')

package() {
  cd $pkgname-$pkgver
  install -dm755 "$pkgdir"/usr/share/icons
  cp -r Marea "$pkgdir"/usr/share/icons/
}
