# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=cantique
pkgbase=$_name-font
pkgname=(otf-$_name)
_sha=ff74dccdf7af6c3c4d1af70f44732ef87d75ce61
pkgver=1.000
pkgrel=1
pkgdesc='A typeface marking the marriage between human calligraphy and geometric shapes'
arch=('any')
url="https://ggvelvetyne.fr/fonts/cantique"
license=('OFL')
source=("https://gitlab.com/velvetyne/$_name/-/archive/$_sha/$_name-$pkgver.tar.bz2")
sha256sums=('f314095234f7ce4d93145ae2a42bacc095954c578bb666b0b655a9553e2e07b4')

package_otf-cantique() {
    provides=("$pkgbase")
    cd "$_name-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" fonts/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
