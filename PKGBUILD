# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

_pkgname=shellspec
pkgname=$_pkgname-bin
pkgver=0.28.1.r2
pkgrel=1
pkgdesc="BDD style unit testing framework for POSIX compliant shell script"
arch=(any)
license=(MIT)
url=https://shellspec.info
depends=('sh')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname-$pkgver.tar.zst::https://git.stefanwimmer128.eu/stefanwimmer128/shellspec/-/package_files/56/download")
sha256sums=('7f5cd4f8702b48750a6e03ed51af3ab6c898e51234f9786ed811ad60557a4f30')

build() {
  rm "$_pkgname-$pkgver.tar.zst"
  rm .BUILDINFO .MTREE .PKGINFO
}

package() {
    cp -r . "$pkgdir"
}
