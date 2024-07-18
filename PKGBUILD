# Maintainer: Stefan Wimmer <info@stefanwimmer128.xyz>

_pkgname=kwalletcli
_pkgver=3.03-4
_arch=x86_64

pkgname=$_pkgname-bin
pkgver=${_pkgver//-/.r}
pkgrel=1
pkgdesc='Command-Line Interface for the KDE Wallet'
arch=($_arch)
license=('custom:MirOS' 'LGPL3')
url='https://www.mirbsd.org/kwalletcli.htm'
depends=('kwallet5' 'mksh')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname-$_pkgver-$_arch.tar.zst::https://gitlab.com/api/v4/projects/59987755/packages/generic/$_pkgname/$_pkgver/$_pkgname-$_pkgver-$_arch.pkg.tar.zst")
sha256sums=('12449cfc1cdb5969c69f365998b4143c41c780ab742d894e6258d67e6c516536')

build() {
    rm "$_pkgname-$_pkgver-$_arch.tar.zst"
    rm .BUILDINFO .MTREE .PKGINFO
}

package() {
    cp -r . "$pkgdir"
}
