# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=fcitx5-skin-dark-transparent
_pkgname=fcitx5-dark-transparent
pkgver=0.0.0.20200618
_commit=e196b8aa748d6a8747ff9f943a3ca25f45441c37
pkgrel=1
pkgdesc="一个简单的 fcitx5 的黑色透明主题"
arch=('any')
url="https://github.com/hosxy/fcitx5-dark-transparent"
license=('MIT')
source=("https://github.com/hosxy/fcitx5-dark-transparent/archive/$_commit/$_pkgname-$_commit.tar.gz")
sha512sums=('51eddd13fdd929dcbecac3a2dbe5078613a31a96f02193c9494eab3b4320bc1fb9af06722720b33c1a00d869a4b0fbc6260ca5ae24d6cef119abbb142e9994fc')

package() {
  _variant_name=dark-transparent
  cd $_pkgname-$_commit
  install -Dm644 highlight.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/highlight.png
  install -Dm644 panel-origin.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/panel-origin.png
  install -Dm644 panel-round.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/panel-round.png
  install -Dm644 arrow.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/arrow.png
  install -Dm644 radio.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/radio.png
  install -Dm644 theme.conf "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/theme.conf
  
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
