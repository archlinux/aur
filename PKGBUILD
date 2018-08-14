# Maintainer: Paul Davis ("dangersalad") <paul@dangersalad.com>

pkgname=starruler2-mod-risingstars
pkgver=1.3.0
pkgrel=2
pkgdesc="mod for Star Ruler 2"
arch=('x86_64')
url="https://github.com/DaloLorn/Rising-Stars"
license=('custom')
depends=(starruler2-git)

source=(
    https://github.com/DaloLorn/Rising-Stars/archive/WorkshopBuild.tar.gz
)

md5sums=('976d12eae54115edfe7e46ce689473b7')

package() {
    install -d $pkgdir/opt/starruler2/mods
    cp -r "$srcdir/Rising-Stars-WorkshopBuild/Rising Stars" $pkgdir/opt/starruler2/mods
}

