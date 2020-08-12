# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=compagnon
pkgbase=$_name-font
pkgname=(otf-$_name)
_sha=4f2344df5adb6eaf9ffd9215c5406c0729fb7aa1
pkgver=1.000
pkgrel=1
pkgdesc='A multi-style typeface inspired by Typewriter specimens, from Velvetyne Type Foundry'
arch=('any')
url="https://velvetyne.fr/fonts/$_name"
license=('OFL')
source=("https://gitlab.com/velvetyne/$_name/-/archive/$_sha/$_name-$pkgver.tar.bz2")
sha256sums=('ddc2a4080b1472c2420df6df31d8e1f839b25f26468c525b5f24389ae15b2fcb')

package_otf-compagnon() {
    provides=("$pkgbase")
    cd "$_name-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" fonts/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
