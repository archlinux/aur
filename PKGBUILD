# Maintainer: pitbuster <felipe.contreras.s@gmail.com>
pkgname=minify-html-bin
pkgver=0.9.2
pkgrel=2
pkgdesc='A Rust HTML minifier meticulously optimised for speed and effectiveness'
url='https://github.com/wilsonzlin/minify-html'
source=('LICENSE')
source_x86_64=("https://wilsonl.in/minify-html/bin/$pkgver-linux-$CARCH")
arch=('x86_64')
license=('MIT')
depends=('gcc-libs')
sha256sums=('SKIP')
sha256sums_x86_64=('cccdb9e81cd7f5ce074bf9fba7b7748d513cfc3d1f9b5d0b453116b33c9fc230')

package() {
  cd "$srcdir/"

  install -Dm755 ${pkgver}-linux-$CARCH "${pkgdir}/usr/bin/minify-html"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
