# Maintainer: Gonçalo Pereira <goncalo_pereira@outlook.pt>
# Contributor: Caleb Maclennan <caleb@alerque.com>

_name=architects-daughter
pkgbase=$_name-font
pkgname=(ttf-$_name)
pkgver=1.004
pkgrel=1
pkgdesc='a font incorporating the graphic, squared look of architectural writing and the natural feel of daily handwriting'
arch=(any)
url="https://fonts.google.com/specimen/Architects+Daughter"
license=(OFL)
source=("$_name-$pkgver.zip::https://fonts.google.com/download?family=Architects+Daughter")
sha256sums=('4bb65d36ae128d45fe00c4a47c6793fda3615dedecfd38a441652a188431e16f')

package_ttf-architects-daughter() {
    provides=("$pkgbase")
    install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}
