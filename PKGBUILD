#Maintainer: Alia Skywol <skywol@qq.com>

pkgname=marea-icon-theme
pkgver=1.0
pkgrel=1
pkgdesc="Marea Icons"
arch=('any')
url="https://github.com/Skywol/marea-icon-theme"
license=('GPL3')
replaces=('')
conflicts=('')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Skywol/marea-icon-theme/archive/$pkgver.tar.gz")
sha512sums=('16e95b4d7895154dbbe8ad90bdf7db102958759f9e98d614ddb05811f1f2ec351a7dedd0be2b4f374e42c2ffbf7b471367ae860c7dfff439ac0fb329fb4da419')

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
