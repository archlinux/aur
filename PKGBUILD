# Maintainer: Alexis Polti <ArchSegger at gmail dot com>

pkgname=jlink-systemview-target-src
pkgver=3.10
pkgrel=1
epoch=0
pkgdesc="Segger SystemView target src for Linux"
arch=('i686' 'x86_64')
license=('custom')
groups=('jlink')
depends=()
source=("https://www.segger.com/downloads/jlink/systemview_target_src")
md5sums=('d818ea044dffa0ea60e1a9849fd1c4f6')
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
