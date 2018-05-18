#Maintainer: Alia Skywol <skywol@qq.com>

pkgname=marea-icon-theme
pkgver=5.1
pkgrel=1
pkgdesc="Marea Icons"
arch=('any')
url="https://github.com/Marea-Icons/Marea"
license=('GPL3')
replaces=('')
conflicts=('')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Marea-Icons/Marea/archive/master.tar.gz")
sha512sums=('85df2ed6e1bd76c200d264e16ca52fb9b1e2f03015a21512b47e132da598bb11944985dce8e036f969d6473d500815942a4f7ca266414ce2a041f2509781f0f0')

package() {
  mkdir $pkgname-$pkgver
  mv Marea-master $pkgname-$pkgver/Marea
  install -dm755 "$pkgdir"/usr/share/icons
  cp -r $pkgname-$pkgver/Marea "$pkgdir"/usr/share/icons/
}
