# Maintainer: whriedplanck

pkgname=fcitx5-skin-simple-blue
pkgver=0.0.0.20200618
_commit=8b2b2e225c3d6b4f70082716e06d7bc93dca046c
pkgrel=1
pkgdesc="A simple blue theme for fcitx5"
arch=('any')
url="https://github.com/weearc/fcitx5-skin-simple-blue"
license=('Unlicense')
source=("https://github.com/weearc/fcitx5-skin-simple-blue/archive/$_commit/$pkgname-$_commit.tar.gz")
md5sums=('043749fb248f96c0dae14bb088557e43')

package() {
    _variant_name=fcitx5-skin-simple-blue
    cd $_variant_name-$_commit
    install -Dm644 highlight.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/highlight.png
    install -Dm644 input_panel.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/input_panel.png
    install -Dm644 theme.conf "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/theme.conf
    
    install -Dm644 UNLICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
