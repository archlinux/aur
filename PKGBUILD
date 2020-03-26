# Maintainer: Caleb Maclennan <caleb@alerque.com>

_fname=punk-nova
_pname=punk-otf
pkgbase=$_fname-font
pkgname=(otf-$_fname)
pkgver=1.003
pkgrel=1
pkgdesc='An OpenType implementation of Donald Knuth’s Punk font'
arch=('any')
url="https://github.com/alif-type/$_pname"
license=('OFL')
provides=("$pkgbase")
source=("$pkgname-pkgver.zip::$url/archive/v$pkgver.zip")
sha256sums=('f1e6cb5adf5a668029340a710f0dc125c3e8942c609dbd1b484559396954b1ca')

package_otf-punk-nova() {
  cd "${_pname}-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" *.otf
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md NEWS documentation/*.pdf
}
