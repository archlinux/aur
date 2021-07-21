# Maintainer: Dringsim <dringsim@qq.com>

pkgname=rime-tangut_xhzd
pkgver=0.2
pkgrel=1
pkgdesc="Tangut input (Xia-Han Zidian number & Four-Corner code) for RIME"
arch=('any')
url="http://www.ccamc.co/fonts_tangut.php"
license=('unknown')
source=("file://tangut_xhzd.schema.yaml" "file://tangut_xhzd.dict.yaml")
md5sums=('1cc3da1026a0d878dabf6586eacf4639' '9f053b4c85c225a6009aafc21945dbc3')

package() {
  install -Dm 644 tangut_xhzd.schema.yaml -t "$pkgdir/usr/share/rime-data/"
  install -Dm 644 tangut_xhzd.dict.yaml -t "$pkgdir/usr/share/rime-data/"
}