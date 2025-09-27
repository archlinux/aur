# Maintainer: zephyrdrh <zephyrdrh at gmx dot de>
# Based on the 'sddm-minesddm-theme-git' package by Jia Yin <lok-ation at outlook dot com>

pkgname=sddm-minesddm-theme
pkgver=2.1.0
pkgrel=2
pkgdesc='A Minecraft SDDM theme'
arch=('any')
url="https://github.com/Davi-S/sddm-theme-minesddm"
license=('AGPL-3.0-only')
depends=('sddm' 'qt5-quickcontrols2' 'layer-shell-qt')
makedepends=('git')
source=("$pkgname::git+$url#tag=v$pkgver")
b2sums=('a148d87c6d4f8d322162ddfed1a4780ad825825e3f624e93e877b3c4fbce3f17d38e05fd770bec707bfe802d80edc5adf2189b25457f4a7a76d906099f4dd9db')

package() {
    cd $pkgname
    find minesddm -type f -exec install -Dm 644 "{}" "$pkgdir/usr/share/sddm/themes/{}" \;
}

