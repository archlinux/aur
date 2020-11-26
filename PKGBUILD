# Maintainer: Romain Bazile <gromain dot baz at gmail dot com>

pkgname=amap-bin
pkgver=0.30
pkgrel=1
epoch=
pkgdesc="A tool to analyze .MAP files produced by several compilers and report the amount of memory being used by data and code."
arch=('x86_64')
url="http://www.sikorskiy.net/prj/amap/index.html"
license=('freeware')
depends=('libpng12' 'gtk2')
source=("http://www.sikorskiy.net/prj/amap/files/amap.30.ubuntu1804.x64.GTK.tar.gz")
sha256sums=('d4964d10b27774cb8225a82bb171d4e6e056be9c63fd191cf5094efbc367a0d1')


package() {
        install -D -m755 ${srcdir}/amap ${pkgdir}/usr/bin/amap;
}
