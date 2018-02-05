#Maintainer: Alia Skywol <skywol@qq.com>

pkgname=marea-icon-theme
pkgver=4.4
pkgrel=9
pkgdesc="Marea Icons"
arch=('any')
url="https://github.com/Skywol/marea-icon-theme"
license=('GPL3')
replaces=('')
conflicts=('')
source=("$pkgname-$pkgver.tar.xz::http://mirrors.ustc.edu.cn/deepin/pool/main/m/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha512sums=('SKIP')

package() {
  cd $pkgname-$pkgver
  install -dm755 "$pkgdir"/usr/share/icons
  cp -r Marea "$pkgdir"/usr/share/icons/
}
