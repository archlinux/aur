# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

_pkgname=kwalletcli
pkgname=$_pkgname-bin
_pkgver=3.03-3
pkgver=${_pkgver//-/.r}
pkgrel=2
pkgdesc='Command-Line Interface for the KDE Wallet'
_arch=x86_64
arch=($_arch)
license=('custom:MirOS' 'LGPL3')
url='https://www.mirbsd.org/kwalletcli.htm'
depends=('kwallet' 'mksh')
provides=($_pkgname)
conflicts=($_pkgname)
source=("https://git.stefanwimmer128.io/api/v4/projects/166/packages/generic/$_pkgname/$_pkgver/$_pkgname-$_pkgver-$_arch.pkg.tar.zst")
sha256sums=('31959535e2a9571aae554c3b702ef30c6408f4a9a1b34c3485c2685d5fe2b080')

build() {
  rm "$_pkgname-$_pkgver-$_arch.pkg.tar.zst"
  rm .BUILDINFO .MTREE .PKGINFO
}

package() {
    cp -r . "$pkgdir"
}
