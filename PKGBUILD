# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

_pkgname=mksh
pkgname=$_pkgname-bin
pkgver=59.c.r4
pkgrel=1
pkgdesc='MirBSD Korn Shell'
arch=(x86_64)
license=(custom)
url='https://www.mirbsd.org/mksh.htm'
depends=('glibc')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname-$pkgver.tar.zst::https://git.stefanwimmer128.eu/stefanwimmer128/mksh/-/package_files/67/download")
sha256sums=('52ec23b52a8290e9eab1cc864bf7701492a29122e2ba5f86feb43540357ea3e4')
install=mksh.install

build() {
  rm "$_pkgname-$pkgver.tar.zst"
  rm .BUILDINFO .MTREE .PKGINFO .INSTALL
}

package() {
    cp -r . "$pkgdir"
}
