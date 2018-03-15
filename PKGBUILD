#Maintainer: Alia Skywol <skywol@qq.com>

pkgname=marea-icon-theme
pkgver=4.9
pkgrel=1
pkgdesc="Marea Icons"
arch=('any')
url="https://github.com/Marea-Icons/Marea"
license=('GPL3')
replaces=('')
conflicts=('')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Marea-Icons/Marea/archive/master.tar.gz")
sha512sums=('a4271be3ae4ea6e681143ccec465a0f699cd011e50c8b86de236ea0af6bfc2b69643941ccd5389ef6f0a72e0c5b96be923574bd5b8f2697ed808753f38007bc1')

package() {
  mkdir $pkgname-$pkgver
  mv Marea-master $pkgname-$pkgver/Marea
  install -dm755 "$pkgdir"/usr/share/icons
  cp -r $pkgname-$pkgver/Marea "$pkgdir"/usr/share/icons/
}
