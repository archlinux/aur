# Maintainer: Romain Bazile <gromain dot baz at gmail dot com>

pkgname=amap
pkgver=0.28
pkgrel=1
epoch=
pkgdesc="A tool to analyze .MAP files produced by several compilers and report the amount of memory being used by data and code."
arch=('x86_64')
url="http://www.sikorskiy.net/prj/amap/index.html"
license=('freeware')
depends=('libpng12' 'gtk2')
source=("http://www.sikorskiy.net/prj/amap/files/amap.28.ubuntu1604.x64.GTK.tar.gz")
sha256sums=('10e617c2a85d03d6e5bd4eedec018c7ad94dd53e125cb529d0783228e4492908')


package() {
        install -D -m755 ${srcdir}/amap ${pkgdir}/usr/bin/amap;
}
