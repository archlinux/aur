# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=librebarcode
pkgbase=$_name-font
pkgname=(ttf-$_name)
pkgver=1.008
pkgrel=1
pkgdesc='Barcode fonts for various barcode standards'
arch=('any')
url="https://graphicore.github.io/$_name"
license=('OFL')
_prefix=pre-v
source=("$_name-$pkgver.tar.gz::https://github.com/graphicore/$_name/archive/$_prefix$pkgver.tar.gz")
sha256sums=('7d697b2595b784b6c1803959241f0f3af29a579bda0a2bb67fb557f7101af1dd')

package_ttf-librebarcode() {
    provides=("$pkgbase")
    cd "$_name-$_prefix$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" fonts/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" fonts/OFL.txt
}
