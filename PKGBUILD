# Maintainer: whriedplanck

pkgname=fcitx5-simple-theme
pkgver=0.0.0.20200618
_commit=ccaa0d959bec24b81c04f14e353bc008a8326150
pkgrel=1
pkgdesc="A simple (gray) theme for fcitx5"
arch=('any')
url="https://github.com/iovxw/fcitx5-simple-theme"
license=('Unlicense')
source=("https://github.com/iovxw/fcitx5-simple-theme/archive/$_commit/$pkgname-$_commit.tar.gz")
md5sums=('c6591b50cb886c71474e8496f2c5eff5')

package() {
    _variant_name=fcitx5-simple-theme
    cd $_variant_name-$_commit
    install -Dm644 arrow.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/arrow.png
    install -Dm644 highlight.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/highlight.png
    install -Dm644 input_panel.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/input_panel.png
    install -Dm644 panel.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/panel.png
    install -Dm644 radio.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/radio.png
    install -Dm644 theme.conf "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/theme.conf
    
    install -Dm644 UNLICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
