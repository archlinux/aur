# Maintainer: Caleb Maclennan <caleb@alerque.com>

_fname=qahiri
pkgbase=$_fname-font
pkgname=(otf-$_fname) # ttf-$_fname $_fname-app
pkgver=1.007
pkgrel=1
pkgdesc='A manuscript Kufic typeface'
arch=('any')
url="https://alif-type.github.io/$_fname/"
license=('AGPL3')
provides=("$pkgbase")
source=("https://github.com/alif-type/$_fname/releases/download/v$pkgver/${_fname^}-$pkgver.zip")
sha256sums=('37b2dab5c3c1a90690e47c08b5617af37865f4c9ca31a19c73d3f1cf270001b0')

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
