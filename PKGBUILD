#Maintainer: Alia Skywol <skywol@qq.com>

pkgname=marea-icon-theme
pkgver=5.2
pkgrel=1
pkgdesc="Marea Icons"
arch=('any')
url="https://github.com/Marea-Icons/Marea"
license=('GPL3')
replaces=('')
conflicts=('')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Marea-Icons/Marea/archive/master.tar.gz")
sha512sums=('e7cd62022f8af6be79ab8008e355d99002d2eeecdfcc8b6e232f97ed3e53d045d943040848130fccb43f070b95ed2fb3fe9e72165022706e6c603157a5bf1fd9')

package() {
  mkdir $pkgname-$pkgver
  mv Marea-master $pkgname-$pkgver/Marea
  install -dm755 "$pkgdir"/usr/share/icons
  cp -r $pkgname-$pkgver/Marea "$pkgdir"/usr/share/icons/
}
