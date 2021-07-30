# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Petko Bordjukov <bordjukov[at]gmail[dot]com>

pkgname=otf-bulgaria-moderna-pro
pkgver=4.000
pkgrel=2
pkgdesc='inspired by the Early Cyrillic script developed during the 10th Century in the Preslav Literary School'
url=https://alphadesigner.com/fonts/bulgaria-moderna
arch=(any)
license=(CCPL)
source=("$pkgname-$pkgver.zip::https://dl.dafont.com/dl/?f=bulgaria_moderna")
sha256sums=('2b526d0647b8663a0dddf8781574876c67789a8ccd878efe83d934cadfe172b2')

package() {
	install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF/" *.otf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" *.pdf
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" License.txt
}
