# Maintainer: Stefan Wimmer <info@stefanwimmer128.xyz>

_pkgname=kwalletcli
_pkgver=3.03-4
_arch=x86_64

pkgname=$_pkgname-bin
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc='Command-Line Interface for the KDE Wallet'
arch=($_arch)
license=('custom:MirOS' 'LGPL3')
url='https://www.mirbsd.org/kwalletcli.htm'
depends=('kwallet5' 'mksh')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname-$pkgver-$pkgrel-$_arch.tar.zst::https://gitlab.com/api/v4/projects/59987755/packages/generic/$_pkgname/$_pkgver/$_pkgname-$_pkgver-$_arch.pkg.tar.zst")
noextract=("$_pkgname-$pkgver-$pkgrel-$_arch.tar.zst")
sha256sums=('9e0e1362fb11e723651acbc8b9e43e3aa3a4f48ca1c5ab228dec8ab6e581b8f6')

package() {
    tar -C "$pkgdir" -xvf "$_pkgname-$pkgver-$pkgrel-$_arch.tar.zst" --exclude '.BUILDINFO' --exclude '.MTREE' --exclude '.PKGINFO'
}
