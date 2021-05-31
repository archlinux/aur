# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Benjamin Goodger <ben at goodger dot nl>
# Contributor: Marcos Heredia <chelqo at gmail dot com>

_pkgname=allerta
pkgname=otf-$_pkgname
pkgver=1.001
pkgrel=4
pkgdesc='Open-source signage typeface'
arch=('any')
url="https://pixelspread.com/$_pkgname"
license=('OFL')
source=("$url/$_pkgname.zip")
sha256sums=('668cf2188bda44999d60931dded94af5d08b60ce1b9a951bd93b658fe000e099')

package() {
    cd ${_pkgname^}
    install -Dpm644 -t "$pkgdir/usr/share/fonts/OTF/$pkgname/" *.otf
    install -Dpm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "Open Font License.txt"
    # install -Dpm644 -t "$pkgdir/usr/share/doc/$pkgname/" *.pdf
}
