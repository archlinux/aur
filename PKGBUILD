# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=chomsky
pkgbase=$_name-font
pkgname=(otf-$_name)
pkgver=2.1
pkgrel=1
pkgdesc='A font in the style of the New York Times masthead'
arch=('any')
url="https://github.com/ctrlcctrlv/$_name"
license=('OFL')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9c9c8f77d0b6bd1b0e9d55ebbedd8da6062fc51159711f96892234fcfeb54987')

package_otf-chomsky() {
    provides=("$pkgbase")
    cd "$_name-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" dist/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
