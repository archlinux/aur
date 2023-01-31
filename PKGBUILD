# Maintainer: pitbuster <felipe.contreras.s@gmail.com>
pkgname=minify-html-bin
pkgver=0.10.8
pkgrel=1
pkgdesc='A Rust HTML minifier meticulously optimised for speed and effectiveness'
url='https://github.com/wilsonzlin/minify-html'
source=('LICENSE')
source_x86_64=("https://wilsonl.in/minify-html/bin/$pkgver-linux-$CARCH")
arch=('x86_64')
license=('MIT')
depends=('gcc-libs')
sha256sums=('a131d5418ac118f39e3b4478b30e3b1769c407fa389850abc422fc64c1675310')
sha256sums_x86_64=('f17b52bc9578c9e335667bd56b07ecbc003f5a72267edd6e0cd78fe49285e341')

package() {
  cd "$srcdir/"

  install -Dm755 ${pkgver}-linux-$CARCH "${pkgdir}/usr/bin/minify-html"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
