# Maintainer: pitbuster <felipe.contreras.s@gmail.com>
pkgname=minify-html-bin
pkgver=0.10.0
pkgrel=1
pkgdesc='A Rust HTML minifier meticulously optimised for speed and effectiveness'
url='https://github.com/wilsonzlin/minify-html'
source=('LICENSE')
source_x86_64=("https://wilsonl.in/minify-html/bin/$pkgver-linux-$CARCH")
arch=('x86_64')
license=('MIT')
depends=('gcc-libs')
sha256sums=('a131d5418ac118f39e3b4478b30e3b1769c407fa389850abc422fc64c1675310')
sha256sums_x86_64=('5af1d5e81a6854bb79190c19ecd1c25a6f8452108b9f71409dfb28c6ae565839')

package() {
  cd "$srcdir/"

  install -Dm755 ${pkgver}-linux-$CARCH "${pkgdir}/usr/bin/minify-html"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
