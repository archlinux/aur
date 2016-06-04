# Maintainer: Hythlodaeus <matteodelseppiaomm@gmail.com>

pkgname=vega
pkgver=1.0
pkgrel=1
pkgdesc="Vega is a platform for testing the security of web applications"
arch=(x86_64)
url="https://subgraph.com/vega/"
license=('Eclipse Public License 1.0')
provides=('vega')
depends=('jdk8-openjdk' 'webkitgtk2')
conflicts=('vega')
source=("https://dist.subgraph.com/downloads/VegaBuild-linux.gtk.x86_64.zip")
md5sums=(SKIP)
package() {   
        mkdir $pkgdir/usr && mkdir $pkgdir/usr/share
        cp -rf vega $pkgdir/usr/share
        mkdir $pkgdir/usr/bin
        ln -sv /usr/share/vega/Vega $pkgdir/usr/bin/vega
}

