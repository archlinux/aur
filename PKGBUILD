# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=fcitx5-skin-dark-numix
_pkgname=fcitx5-dark-numix
pkgver=0.0.0.20200618
_commit=bf0049dd46f6336e3f7db60a17e61a4c34dd082c
pkgrel=1
pkgdesc="Modified Material-Color to fit in the numix dark theme. "
arch=('any')
url="https://github.com/cjxgm/fcitx5-dark-numix"
license=('Apache')
source=("https://github.com/cjxgm/fcitx5-dark-numix/archive/$_commit/$_pkgname-$_commit.tar.gz")
sha512sums=('d8cad03869bbd909ee6f7883e8d5d52ff659852c04a3c955c51ba99b0113eba354185b08b0b3445c3e2354489f11834c6c8fd06541c01fff88418abdaa054c45')

package() {
  _variant_name=dark-numix
  cd $_pkgname-$_commit
  install -Dm644 highlight.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/highlight.png
  install -Dm644 panel.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/panel.png
  install -Dm644 arrow.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/arrow.png
  install -Dm644 radio.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/radio.png
  install -Dm644 theme.conf "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/theme.conf
  
  #install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
