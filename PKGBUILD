# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=chomsky
pkgbase=$_name-font
pkgname=(otf-$_name)
pkgver=2.2
pkgrel=1
pkgdesc='A font in the style of the New York Times masthead'
arch=('any')
url="https://github.com/ctrlcctrlv/$_name"
license=('OFL')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e8218b6386788ee199c12431924a324e2e684be06ec77d2eaf518b0a04de09be')

package_otf-chomsky() {
    provides=("$pkgbase")
    cd "$_name-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" dist/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
