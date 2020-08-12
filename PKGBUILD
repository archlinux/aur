# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=mourier
pkgbase=$_name-font
pkgname=(otf-$_name)
_sha=344849db8495978f01d28cc9230f82a1628da7fe
pkgver=1.000
pkgrel=1
pkgdesc='A typeface from Velvetyne with quasi-abstract geometric shapes'
arch=('any')
url="https://velvetyne.fr/fonts/$_name"
license=('OFL')
source=("https://gitlab.com/velvetyne/$_name/-/archive/$_sha/$_name-$pkgver.tar.bz2")
sha256sums=('99f058426eb3354370a053b6d4d556679db1a0cdf06bb7e325eccf6829df04ff')

package_otf-mourier() {
    provides=("$pkgbase")
    cd "$_name-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" fonts/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
