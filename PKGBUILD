# Maintainer: heliary <rydesun@gmail.com>

pkgname=fcitx-table-flypy
pkgver=0.2.1
pkgrel=1
pkgdesc='XiaoHe shuangpin table for fcitx, also known as flypy or xhup.'
arch=('any')
license=('GPL')
depends=('fcitx')
url='http://www.flypy.com'
source=("git://github.com/rydesun/fcitx-table-flypy.git")
md5sums=('SKIP')

package() {
  cd $pkgname
  mkdir -p "$pkgdir/usr/share/fcitx/table"
  install -Dm644 flypy.conf flypy.mb "$pkgdir/usr/share/fcitx/table"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
