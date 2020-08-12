# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=backout
pkgbase=$_name-font
pkgname=(otf-$_name)
_sha=3be76e8d9698905cf12381d2ae2cd9333c22b713
pkgver=2.000
pkgrel=1
pkgdesc='A humanist typeface from Velvetyne with African Glyphic design'
arch=('any')
url="https://velvetyne.fr/fonts/$_name"
license=('OFL')
source=("https://gitlab.com/velvetyne/$_name/-/archive/$_sha/$_name-$pkgver.tar.bz2")
sha256sums=('532585ac9dd456ff8263cd1e7de2f401d6e14378a3c464125bf5680ddaa9053e')

package_otf-backout() {
    provides=("$pkgbase")
    cd "$_name-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" fonts/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
