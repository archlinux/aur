# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=fcitx5-skin-base16-material-darker
#_pkgname=fcitx5-dark-numix
pkgver=0.0.0.20200627
_commit=38bf71ad459a1ba6c84e212939f50541428d7ef3
pkgrel=1
pkgdesc="A base16-material-darker theme for Fcitx5. "
arch=('any')
url="https://github.com/btstream/fcitx5-skin-base16-material-darker"
license=('custom')
source=("$url/archive/$_commit/$pkgname-$_commit.tar.gz")
sha512sums=('57f4bdded3ee6b290c0eca76ec3eb4309bfa663fc3beae0121c2478d2528a60fe95f44046e1136050c2e90c659e09b78b85c61d078a9bf53fb65b8ba4e3343c3')

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
