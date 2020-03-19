# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: OmeGa <omega [U+0040] mailoo [.] org>

pkgname=otf-im-fell-types
# actually 20100625
pkgver=20121117
pkgrel=2
pkgdesc='A set of free modern revival fonts digitalized by Igino Marini'
arch=('any')
url='http://iginomarini.com/fell/'
license=('OFL')
source=("$pkgname-$pkgver.zip::http://iginomarini.com/fell/wp-content/uploads/IMFellTypesClass.zip")
sha256sums=('b65189a8c165dafa5ba979092ebe967e0ad86a4d584b203eee40e16d010f5308')

package() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" *.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" Fell*.txt
}
