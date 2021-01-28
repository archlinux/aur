# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=librebarcode
pkgbase=$_name-font
pkgname=(ttf-$_name)
pkgver=1.004
pkgrel=1
pkgdesc='Barcode fonts for various barcode standards'
arch=('any')
url="https://graphicore.github.io/$_name"
license=('OFL')
source=("$pkgname-$pkgver.tar.gz::https://github.com/graphicore/$_name/archive/v$pkgver.tar.gz")
sha256sums=('07247ac284392bc22c1e54d1693787c9bb8ea22f3a30d0ed879b1ade8815189a')

package_ttf-librebarcode() {
    provides=("$pkgbase")
    cd "$_name-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" fonts/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" fonts/OFL.txt
}
