# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=chomsky
pkgbase=$_name-font
pkgname=(otf-$_name)
pkgver=2.0
pkgrel=1
pkgdesc='A font in the style of the New York Times masthead'
arch=('any')
url="https://github.com/ctrlcctrlv/$_name"
license=('OFL')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6bfe28d5a4892401d209eec55a3f57249d7b3ec0b094d86e8154c050c07e7e13')

package_otf-chomsky() {
    provides=("$pkgbase")
    cd "$_name-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" dist/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
