# Maintainer: Ramsey Nasser <ram at nas dot sr>
# Contributor: Alex Pyattaev <alex pyattaev at google dot com>
pkgname='roc-nightly-bin'
pkgver=2025.03.22.c47a8e9
pkgrel=1
pkgdesc='A fast, friendly, functional language. Work in progress!'
arch=('x86_64')
url="https://www.roc-lang.org"
license=('ULP1.0')
options=('!debug')
depends=('glibc>=2.38' 'binutils>=2.41')
source=("https://github.com/roc-lang/roc/releases/download/alpha3-rolling/roc-linux_x86_64-alpha3-rolling.tar.gz")
sha256sums=('c96045f1f54dc3d9e20c33ede8698d79b01e43f09652795beb4f0bc7fb38cba8')
replaces=('roc-nightly-bin')

package() {
  install -Dm755 "$srcdir/roc_nightly-linux_x86_64-2025-03-22-c47a8e9/roc" "$pkgdir/usr/bin/roc"
  install -Dm755 "$srcdir/roc_nightly-linux_x86_64-2025-03-22-c47a8e9/roc_language_server" "$pkgdir/usr/bin/roc_language_server"
}
