# Maintainer: Ramsey Nasser <ram at nas dot sr>
pkgname=roc-nightly-bin-alpha3
pkgver=2025.03.22.c47a8e9
pkgrel=1
pkgdesc="A fast, friendly, functional language."
arch=('x86_64')
url="https://www.roc-lang.org"
license=('ULP')
depends=()
source=("https://github.com/roc-lang/roc/releases/download/alpha3-rolling/roc-linux_x86_64-alpha3-rolling.tar.gz")
sha256sums=('c96045f1f54dc3d9e20c33ede8698d79b01e43f09652795beb4f0bc7fb38cba8')
replaces=('roc-nightly-bin')

package() {
  install -Dm755 "$srcdir/roc_nightly-linux_x86_64-2025-03-22-c47a8e9/roc" "$pkgdir/usr/bin/roc"
}
