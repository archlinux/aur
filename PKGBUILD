#Maintainer: Alia Skywol <skywol@qq.com>

pkgname=marea-icon-theme
pkgver=5.3.2
pkgrel=1
pkgdesc="Marea Icons"
arch=('any')
url="https://github.com/Marea-Icons/Marea"
license=('GPL3')
depends=('gtk-update-icon-cache')
makedepends=('git')
replaces=('')
conflicts=('')
source=("git+https://github.com/Marea-Icons/Marea.git")
sha512sums=('SKIP')

package() {
  install -dm755 "$pkgdir"/usr/share/icons
  cp -r Marea "$pkgdir"/usr/share/icons/
  rm -rf "$pkgdir"/usr/share/icons/Marea/.git
}
