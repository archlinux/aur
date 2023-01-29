# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

_pkgname=getoptions
pkgname=$_pkgname-bin
pkgver=3.3.0.r2
pkgrel=1
pkgdesc='An elegant option/argument parser for shell scripts'
arch=(any)
license=(CC0-1.0)
url='https://github.com/ko1nksm/getoptions'
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname-$pkgver.tar.zst::https://git.stefanwimmer128.eu/stefanwimmer128/getoptions/-/package_files/66/download")
sha256sums=('7300dd5093855d48613849ea1e4d38b96537278152caf7191be46b902f871ac4')

build() {
  rm "$_pkgname-$pkgver.tar.zst"
  rm .BUILDINFO .MTREE .PKGINFO
}

package() {
    cp -r . "$pkgdir"
}
