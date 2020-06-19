# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=fcitx5-skin-materia-exp
_pkgname=fcitx5-materia-exp
pkgver=0.0.0.20200618
_commit=09b9f878923efa6136f60e77440860f92392a932
pkgrel=1
pkgdesc="Materia EXP color theme for fcitx5"
arch=('any')
url="https://github.com/hosxy/Fcitx5-Materia-EXP"
license=('Apache')
source=("https://github.com/hosxy/Fcitx5-Materia-EXP/archive/$_commit/$_pkgname-$_commit.tar.gz")
sha512sums=('f4d59e16a6d20cc6f69df0c0796ba3b920ca6f5423a776d32df1078f4910b1ce4b0a92434ce2468a593d4ba4360f6fcc9b1d5693b2176e1ddcabe5b28b24af52')

package() {
  _variant_name=Materia-EXP
  cd Fcitx5-Materia-EXP-$_commit
  install -Dm644 highlight.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/highlight.png
  install -Dm644 highlight-EXP.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/highlight-EXP.png
  install -Dm644 panel.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/panel.png
  install -Dm644 arrow.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/arrow.png
  install -Dm644 radio.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/radio.png
  install -Dm644 theme.conf "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/theme.conf
}
