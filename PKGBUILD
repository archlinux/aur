# Maintainer: Toni Sagrista <admin@tonisagrista.com>

pkgname=tsnake
pkgver=0.1.0
pkgrel=1
pkgdesc='Terminal snake game written in C++ with map support'
arch=(x86_64)
url='https://github.com/langurmonkey/tsnake'
license=(GPL)
provides=(tsnake)
conflicts=(tsnake)
source=(git+https://github.com/langurmonkey/tsnake)
md5sums=('SKIP')

package() {
    cd tsnake/
    make
    make install
}
