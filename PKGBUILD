# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=architects-daughter
pkgbase=$_name-font
pkgname=(ttf-$_name)
pkgver=1.003
pkgrel=1
pkgdesc='a font incorporating the graphic, squared look of architectural writing and the natural feel of daily handwriting'
arch=(any)
url="https://fonts.google.com/specimen/Architects+Daughter"
license=(OFL)
source=("$_name-$pkgver.zip::https://fonts.google.com/download?family=Architects+Daughter")
sha256sums=('61d4fdc773a3c6a6e2f15af909521df7ec58642ed3d59b5393278578bd56114b')

package_ttf-architects-daughter() {
    provides=("$pkgbase")
    install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}
