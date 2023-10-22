# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

_pkgname=kwalletcli
pkgname=$_pkgname-bin
_pkgver=3.03-4
pkgver=${_pkgver//-/.r}
pkgrel=1
pkgdesc='Command-Line Interface for the KDE Wallet'
_arch=x86_64
arch=($_arch)
license=('custom:MirOS' 'LGPL3')
url='https://www.mirbsd.org/kwalletcli.htm'
depends=('kwallet5' 'mksh')
provides=($_pkgname)
conflicts=($_pkgname)
source=("https://git.stefanwimmer128.xyz/api/v4/projects/166/packages/generic/$_pkgname/$_pkgver/$_pkgname-$_pkgver-$_arch.pkg.tar.zst")
sha256sums=('56429c2e0e28c4041c0bef8624295cd7e269fb0588a354facfc7737d98effff4')

build() {
  rm "$_pkgname-$_pkgver-$_arch.pkg.tar.zst"
  rm .BUILDINFO .MTREE .PKGINFO
}

package() {
    cp -r . "$pkgdir"
}
