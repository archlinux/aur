# Maintainer: Coelacanthus <coelacanthus@outlook.com>

pkgname=fcitx5-skin-base16-material-darker
#_pkgname=fcitx5-dark-numix
pkgver=0.0.0.20210313
_commit=c03f8b690c38f98622d9d12e7ff90a57ba3ac1f5
pkgrel=1
pkgdesc="A base16-material-darker theme for Fcitx5. "
arch=('any')
url="https://github.com/btstream/fcitx5-skin-base16-material-darker"
license=('GPL')
source=("$url/archive/$_commit/$pkgname-$_commit.tar.gz")
b2sums=('5ccf36a081bdc7f15bedf9be7139eb480883d347f142347af5e7fc53653b15f803d0fc685822fd5691e6f4e7b091bd6ee8b62fb2468c85f065ff45ff1661af60')

package() {
  _variant_name=base16-material-darker
  cd $pkgname-$_commit
  install -Dm644 highlight.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/highlight.png
  install -Dm644 panel.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/panel.png
  install -Dm644 arrow.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/arrow.png
  install -Dm644 radio.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/radio.png
  install -Dm644 next.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/next.png
  install -Dm644 prev.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/prev.png
  install -Dm644 theme.conf "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/theme.conf

  #install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
