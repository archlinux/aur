# Maintainer: Alexis Polti <ArchSegger at gmail dot com>

pkgname=jlink-systemview-target-src
pkgver=2.52h
pkgrel=1
epoch=0
pkgdesc="Segger SystemView target src for Linux"
arch=('i686' 'x86_64')
license=('custom')
groups=('jlink')
depends=()
source=("https://www.segger.com/downloads/jlink/systemview_target_src")
md5sums=('0ad42cd8d21129c0d43664e689046a9d')
url="https://www.segger.com/downloads/free-utilities/#SystemView"

package(){
    # Cleanup
    rm -f cookie

    # Match package in /opt
    install -dm755 "${pkgdir}/opt/SEGGER/Target-src" \

    # Bulk copy target sources
    cd ${srcdir}
    cp --preserve=mode -r Config Sample SEGGER "${pkgdir}/opt/SEGGER/Target-src"
}
