# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

_pkgname=kwalletcli
pkgname=$_pkgname-bin
pkgver=3.03.r3
pkgrel=1
pkgdesc='Command-Line Interface for the KDE Wallet'
arch=(x86_64)
license=('custom:MirOS' 'LGPL3')
url='https://www.mirbsd.org/kwalletcli.htm'
depends=('kwallet' 'mksh')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname-$pkgver.tar.zst::https://git.stefanwimmer128.eu/stefanwimmer128/kwalletcli/-/package_files/65/download")
sha256sums=('31959535e2a9571aae554c3b702ef30c6408f4a9a1b34c3485c2685d5fe2b080')

build() {
  rm "$_pkgname-$pkgver.tar.zst"
  rm .BUILDINFO .MTREE .PKGINFO
}

package() {
    cp -r . "$pkgdir"
}
