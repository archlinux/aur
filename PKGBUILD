# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

_pkgname=mksh
pkgname=$_pkgname-bin
pkgver=59.c.r3
pkgrel=1
pkgdesc='MirBSD Korn Shell'
arch=(x86_64)
license=(custom)
url='https://www.mirbsd.org/mksh.htm'
depends=('glibc')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname-$pkgver.tar.zst::https://git.stefanwimmer128.eu/stefanwimmer128/mksh/-/package_files/64/download")
sha256sums=('8c64221ff5a3cecf6f9b6663eb53367bced807f6e725e5ba9fc543b4ac4cc544')
install=mksh.install

build() {
  rm "$_pkgname-$pkgver.tar.zst"
  rm .BUILDINFO .MTREE .PKGINFO .INSTALL
}

package() {
    cp -r . "$pkgdir"
}
