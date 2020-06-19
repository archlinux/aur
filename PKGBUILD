# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=fcitx5-skin-adwaita-dark
_pkgname=fcitx5-adwaita-dark
pkgver=0.0.0.20200618
_commit=8c1ed01b020672e26891cba4d9e426afef2b7436
pkgrel=1
pkgdesc="An Fcitx5 dark theme mimics GNOME Adwaita-dark"
arch=('any')
url="https://github.com/escape0707/fcitx5-adwaita-dark"
license=('AGPL3')
source=("https://github.com/escape0707/fcitx5-adwaita-dark/archive/$_commit/$_pkgname-$_commit.tar.gz")
sha512sums=('62a2590a631bf8aa4531a59bd887c45e529fa50db5c7a79302b19d782ffe859e3bee26b9390face69d93cb4199e7b8a01fddbb08460fd310c549d3c9045466a9')

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
