# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=fcitx5-skin-adwaita-dark
_pkgname=fcitx5-adwaita-dark
pkgver=0.0.0.20200806
_commit=2938a7cf417ec149aa26fc35949911ae297b0799
pkgrel=1
pkgdesc="An Fcitx5 dark theme mimics GNOME Adwaita-dark"
arch=('any')
url="https://github.com/escape0707/fcitx5-adwaita-dark"
license=('AGPL3')
source=("https://github.com/escape0707/fcitx5-adwaita-dark/archive/$_commit/$_pkgname-$_commit.tar.gz")
sha512sums=('452463eab11e481ad81ef100c43284dd00d2bff1d75978afdcfba42ca75e54d34ae02d0da9aa8018d981c76241431b860c35d07cb3ceeb25170a5cc6939b7faf')

package() {
  _variant_name=adwaita-dark
  cd $_pkgname-$_commit
  install -Dm644 highlight.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/highlight.png
  install -Dm644 no_highlight.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/no_highlight.png
  install -Dm644 panel.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/panel.png
  install -Dm644 arrow.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/arrow.png
  install -Dm644 radio.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/radio.png
  install -Dm644 theme.conf "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/theme.conf

  #install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
