# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=redressed
pkgbase=$_name-font
pkgname=(ttf-$_name)
pkgver=1.001
pkgrel=1
pkgdesc='A typeface blending script and italic letterforms in an upright non-connecting style'
arch=('any')
url="https://fonts.google.com/specimen/Redressed"
license=('Apache')
source=("$_name-$pkgver.zip::https://fonts.google.com/download?family=Redressed")
sha256sums=('315a4135c9784be9caafa5e3d19fe7d1651209437e8393274b23fbe7d1eb028b')

package_ttf-redressed() {
    provides=("$pkgbase")
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
