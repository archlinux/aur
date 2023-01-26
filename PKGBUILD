# Maintainer: Istvan Tapai <iktapai@gmail.com>

pkgname=ater-yellow-cursor-theme
pkgver=1.0.0
pkgrel=5
pkgdesc="ater-yellow cursor theme"
arch=('any')
url="https://github.com/itapai/ater-yellow"
license=("GPL")
source=("https://github.com/itapai/ater-yellow/archive/refs/heads/master.zip")
makedepends=('unzip')
sha256sums=('d8304400d1bed9e9835e4d08ac751ed5b6db07479667e57e855b9e63e80a8f56')

package()
{
    cd ater-yellow-master

    install -d -m 755 $pkgdir/usr/share/icons/ater-yellow
    install -D -m 644 index.theme $pkgdir/usr/share/icons/ater-yellow/index.theme

    cp -r cursors $pkgdir/usr/share/icons/ater-yellow
}

