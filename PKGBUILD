# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

_pkgname=getoptions
pkgname=$_pkgname-bin
_pkgver=3.3.0-2
pkgver=${_pkgver//-/.r}
pkgrel=2
pkgdesc='An elegant option/argument parser for shell scripts'
_arch=any
arch=($_arch)
license=(CC0-1.0)
url='https://github.com/ko1nksm/getoptions'
provides=($_pkgname)
conflicts=($_pkgname)
source=("https://git.stefanwimmer128.io/api/v4/projects/167/packages/generic/$_pkgname/$_pkgver/$_pkgname-$_pkgver-$_arch.pkg.tar.zst")
sha256sums=('7300dd5093855d48613849ea1e4d38b96537278152caf7191be46b902f871ac4')

build() {
  rm "$_pkgname-$_pkgver-$_arch.pkg.tar.zst"
  rm .BUILDINFO .MTREE .PKGINFO
}

package() {
    cp -r . "$pkgdir"
}
