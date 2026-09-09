# Maintainer: Daniel Gustaw <gustaw.daniel@gmail.com>
pkgname=ranwhen
pkgver=0.2.2
pkgrel=1
pkgdesc="Visualize when your system was running (precompiled binary with macOS and Linux support)"
arch=('x86_64')
url="https://github.com/gustawdaniel/ranwhen"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
provides=('ranwhen')
conflicts=('ranwhen-git')
source_x86_64=("$url/releases/download/v$pkgver/ranwhen-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('5f9fc68052e55649e90477e0074a7d1694024cd98ec1922f6c042f9921ec0dc4')

package() {
  install -Dm755 "$srcdir/ranwhen-v$pkgver-x86_64-unknown-linux-gnu/ranwhen" "$pkgdir/usr/bin/ranwhen"
  install -Dm644 "$srcdir/ranwhen-v$pkgver-x86_64-unknown-linux-gnu/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
