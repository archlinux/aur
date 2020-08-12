# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=murmure
pkgbase=$_name-font
pkgname=(otf-$_name)
_sha=1969599c54206ad6427579cee9d1bb0f4665ddfa
pkgver=1.002
pkgrel=1
pkgdesc='A custom typeface created for Agence Murmure, from Velvetyne Type Foundry'
arch=('any')
url="https://velvetyne.fr/fonts/$_name"
license=('custom:Velvetyne Open License')
source=("https://gitlab.com/velvetyne/$_name/-/archive/$_sha/$_name-$pkgver.tar.bz2")
sha256sums=('237c797b48a299a0bed1c535db978a45861dce8c6234bcea6055e8a07b322f01')

package_otf-murmure() {
    provides=("$pkgbase")
    cd "$_name-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" fonts/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "Velvetyne Open License.txt"
}
