# Maintainer: Albert Lv <altiar.albert@gmail.com>

pkgname=fcitx5-table-flypy
pkgver=10.9.4.p3
pkgrel=1
pkgdesc='小鹤音形码表挂接'
arch=('any')
license=('custom')
depends=('fcitx5' 'fcitx5-chinese-addons')
url='http://www.flypy.com'
source=("https://github.com/cubercsl/rime-flypy/releases/download/v${pkgver}/fcitx5-table-flypy.zip")
sha256sums=('8cd740ea7509c8506c9f5df6bba5ecfdb70d9c43ba21769c72c631f713947bef')

package() {
  install -Dm644 flypy.conf "$pkgdir/usr/share/fcitx5/inputmethod/flypy.conf"
  install -Dm644 flypy.dict "$pkgdir/usr/share/fcitx5/table/flypy.dict"
  install -Dm644 flypy.dict "$pkgdir/usr/share/fcitx5/table/flypy.txt"
}
