# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=avara
pkgbase=$_name-font
pkgname=(otf-$_name)
_sha=c0dee5aed1135a5adb3dea0aafe5de1b31e0903c
pkgver=1.000
pkgrel=1
pkgdesc='A typeface from Velvetyne using curveless design based on a square grid'
arch=('any')
url="https://velvetyne.fr/fonts/$_name"
license=('OFL')
source=("https://gitlab.com/velvetyne/${_name^}/-/archive/$_sha/$_name-$pkgver.tar.bz2")
sha256sums=('d8b512e0311e9ced918534094c513f172a89bed36000f795e1bb01786561e136')

package_otf-avara() {
    provides=("$pkgbase")
    cd "${_name^}-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" fonts/*.otf
}
