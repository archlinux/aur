# Maintainer: Istvan Tapai <iktapai@gmail.com>

pkgname=ater-yellow-cursor-theme
pkgver=1.0.0
pkgrel=4
pkgdesc="ater-yellow cursor theme"
arch=('any')
url="https://github.com/itapai/ater-yellow"
license=("GPL")
source=("https://github.com/itapai/ater-yellow/archive/refs/heads/master.zip")
makedepends=('unzip')

package()
{
    cd ater-yellow-master

    install -d -m 755 $pkgdir/usr/share/icons/ater-yellow
    install -D -m 644 index.theme $pkgdir/usr/share/icons/ater-yellow/index.theme

    cp -r cursors $pkgdir/usr/share/icons/ater-yellow
}

