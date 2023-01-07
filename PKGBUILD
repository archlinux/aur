# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

_pkgname=shellspec
pkgname=$_pkgname-bin
pkgver=0.28.1.r1
pkgrel=1
pkgdesc="BDD style unit testing framework for POSIX compliant shell script"
arch=(any)
license=(MIT)
url=https://shellspec.info
depends=('sh')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname-$pkgver.tar.zst::https://git.stefanwimmer128.eu/stefanwimmer128/shellspec/-/package_files/53/download")
sha256sums=('d70ecd1d62a69b3daac6acc1794fce819da98c1f0f56a5b805189533fc88a6ed')

build() {
  rm "$_pkgname-$pkgver.tar.zst"
  rm .BUILDINFO .MTREE .PKGINFO
}

package() {
    cp -r . "$pkgdir"
}
