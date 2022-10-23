# Maintainer: pitbuster <felipe.contreras.s@gmail.com>
pkgname=minify-html-bin
pkgver=0.10.2
pkgrel=1
pkgdesc='A Rust HTML minifier meticulously optimised for speed and effectiveness'
url='https://github.com/wilsonzlin/minify-html'
source=('LICENSE')
source_x86_64=("https://wilsonl.in/minify-html/bin/$pkgver-linux-$CARCH")
arch=('x86_64')
license=('MIT')
depends=('gcc-libs')
sha256sums=('a131d5418ac118f39e3b4478b30e3b1769c407fa389850abc422fc64c1675310')
sha256sums_x86_64=('ba4742b7613c55f46b040f4b3ddfc5ac78d77f4a1a5ea12af9dd1a1b97308124')

package() {
  cd "$srcdir/"

  install -Dm755 ${pkgver}-linux-$CARCH "${pkgdir}/usr/bin/minify-html"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
