# Maintainer: Romain Bazile <gromain dot baz at gmail dot com>

pkgname=amap-bin
pkgver=0.32
pkgrel=1
epoch=
pkgdesc="A tool to analyze .MAP files produced by several compilers and report the amount of memory being used by data and code."
arch=('x86_64')
url="http://www.sikorskiy.net/prj/amap/index.html"
license=('freeware')
depends=('libpng12' 'gtk2')
source=("https://www.sikorskiy.net/info/prj/amap/files/amap.32.ubuntu2104.x64.GTK.gz")
sha256sums=('f2fb9cc0fda689f7eb8d5788c62e161448c3b51e4de512a2fe160e262c16545d')


package() {
        install -D -m755 ${srcdir}/amap.32.ubuntu2104.x64.GTK ${pkgdir}/usr/bin/amap;
}
