# Maintainer: zephyrdrh <zephyrdrh at gmx dot de>
# Based on the 'sddm-minesddm-theme-git' package by Jia Yin <lok-ation at outlook dot com>

pkgname=sddm-minesddm-theme
pkgver=2.0.1
pkgrel=1
pkgdesc='A Minecraft SDDM theme'
arch=('any')
url="https://github.com/Davi-S/sddm-theme-minesddm"
license=('AGPL-3.0-only')
depends=('sddm' 'qt5-quickcontrols2' 'layer-shell-qt5')
makedepends=('git')
source=("$pkgname::git+$url#tag=v$pkgver")
b2sums=('c61e476c42c4fb200d4c9e7890f0dfe311c0c5722d79f090cb2d3d652913487d1b5016cc60e1ce78f198a1af7eed92f551d94c251319d2b20f92d91083969416')

package() {
    cd $pkgname
    find minesddm -type f -exec install -Dm 644 "{}" "$pkgdir/usr/share/sddm/themes/{}" \;
}

