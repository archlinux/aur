# Maintainer: Cryolitia <cryolitia at gmail dot com>

pkgname=fcitx5-theme-deepin
pkgver=1.0.0
pkgrel=1
pkgdesc="Deepin theme for fcitx5"
arch=('any')
url="https://github.com/linuxdeepin/fcitx5-theme-deepin"
license=('CC-BY-SA-4.0')
source=("https://github.com/linuxdeepin/fcitx5-theme-deepin/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('528c79534787ec5ad341f67724ead5610175ab37f1beac7a95d12c7e18606064892fc81e0cc3355fe70b319a29f6544e2818d1d4f7c923cf14f9b4e04d2474b7')

package() {
  cd fcitx5-theme-deepin-$pkgver
  for _variant in light dark; do
    _variant_name=deepin-$_variant
    install -Dvm644 -t "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/ $_variant_name/*
  done
}
