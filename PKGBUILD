# Maintainer: Caleb Maclennan <caleb@alerque.com>

_fname=aref-ruqaa
_pname=ArefRuqaa
pkgbase=$_fname-font
pkgname=(ttf-$_fname)
pkgver=1.002
pkgrel=1
pkgdesc='an Arabic typeface that aspires to capture the classical Ruqaa calligraphic style'
arch=('any')
url="https://github.com/alif-type/$_fname"
license=('OFL')
provides=("$pkgbase")
source=("$url/releases/download/v$pkgver/${_pname}-$pkgver.zip")
sha256sums=('5099a9f2649d78d9c49ce12ff16878f59d63eec238280ff0aa1732c52c05e8cd')

package_otf-aref-ruqaa() {
  cd "${_pname}-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" *.otf
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.txt
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}

package_ttf-aref-ruqaa() {
  cd "${_pname}-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.txt
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}
