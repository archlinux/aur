# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=ouroboros
pkgbase=$_name-font
pkgname=(otf-$_name)
_sha=0a35d93ed80ed2254bb8856a17a7da7bdb20c961
pkgver=2.000
pkgrel=1
pkgdesc='A typeface from Velvetyne for alchemists, witches, heretics, outsiders and curious'
arch=('any')
url="https://velvetyne.fr/fonts/$_name"
license=('custom:Velvetyne Open License')
source=("https://gitlab.com/velvetyne/$_name/-/archive/$_sha/$_name-$pkgver.tar.bz2")
sha256sums=('4fdb360960b663d87be5fe29343900a03842be3e4b5b376a09f276231654acd0')

package_otf-ouroboros() {
    provides=("$pkgbase")
    cd "$_name-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" fonts/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
