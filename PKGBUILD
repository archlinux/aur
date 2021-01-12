# Maintainer: Caleb Maclennan <caleb@alerque.com>

_fname=qahiri
pkgbase=$_fname-font
pkgname=(otf-$_fname) # ttf-$_fname $_fname-app
pkgver=2.00
pkgrel=1
pkgdesc='A manuscript Kufic typeface'
arch=('any')
url="https://alif-type.github.io/$_fname/"
license=('AGPL3')
provides=("$pkgbase")
source=("https://github.com/alif-type/$_fname/releases/download/v$pkgver/${_fname^}-$pkgver.zip")
sha256sums=('cac9d61b63f2935b7f66c19ad0a247077278bb46ea5e31db5e28771eba9a2160')

package_otf-qahiri() {
  cd "${_fname^}-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/fonts/OTF" *.otf
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README{,-Arabic}.txt
}

package_ttf-qahiri() {
  cd "${_fname^}-$pkgver"
}

pagkage_qahiri-app() {
  cd "${_fname^}-$pkgver"
}
