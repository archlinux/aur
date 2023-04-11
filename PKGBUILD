# Maintainer: BeautyyuYanli <beautyyuyanli at gmail dot com>

pkgname=fcitx5-skin-materia-yanli
_pkgname=fcitx5-materia-yanli
pkgver=20230412
pkgrel=1
pkgdesc="Materia theme for fcitx5, by Yanli"
arch=('any')
url="https://github.com/BeautyyuYanli/Fcitx5-Materia-Yanli.git"
license=('Apache')
source=(
"highlight.png"
"highlight-EXP.png"
"panel.png"
"arrow.png" 
"radio.png"
"theme.conf"
)
sha512sums=(
"SKIP"
"SKIP"
"SKIP"
"SKIP"
"SKIP"
"SKIP"
)

package() {
  _variant_name=Materia-Yanli
  install -Dm644 highlight.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/highlight.png
  install -Dm644 highlight-EXP.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/highlight-EXP.png
  install -Dm644 panel.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/panel.png
  install -Dm644 arrow.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/arrow.png
  install -Dm644 radio.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/radio.png
  install -Dm644 theme.conf "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/theme.conf
}

