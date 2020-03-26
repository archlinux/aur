# Maintainer: Caleb Maclennan <caleb@alerque.com>

_fname=aref-ruqaa
_pname=ArefRuqaa
pkgbase=$_fname-font
pkgname=(ttf-$_fname)
pkgver=0.9
pkgrel=1
pkgdesc='an Arabic typeface that aspires to capture the classical Ruqaa calligraphic style'
arch=('any')
url="https://github.com/alif-type/$_fname"
license=('OFL')
provides=("$pkgbase")
source=("$url/releases/download/v$pkgver/${_pname}-$pkgver.zip")
sha256sums=('834b8268831085c67d7bad4403096779d22f67d6de49aed5a1ee03b8eb4c9b86')

package_otf-aref-ruqaa() {
  cd "${_pname}-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" *.otf
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.txt *.pdf
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}

package_ttf-aref-ruqaa() {
  cd "${_pname}-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.txt *.pdf
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}
