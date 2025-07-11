# Maintainer: zephyrdrh <zephyrdrh at gmx dot de>
# Based on the 'sddm-minesddm-theme-git' package by Jia Yin <lok-ation at outlook dot com>

pkgname=sddm-minesddm-theme
pkgver=1.2.1
pkgrel=1
pkgdesc='A Minecraft SDDM theme'
arch=('any')
url="https://github.com/Davi-S/sddm-theme-minesddm"
license=('AGPL-3.0-only')
depends=('sddm' 'qt5-quickcontrols2' 'layer-shell-qt5')
makedepends=('git')
source=("$pkgname::git+$url#commit=9771dae")
sha256sums=('SKIP')

package() {
    cd $pkgname
    find minesddm -type f -exec install -Dm 644 "{}" "$pkgdir/usr/share/sddm/themes/{}" \;
}

