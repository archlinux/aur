# Maintainer: pitbuster <felipe.contreras.s@gmail.com>
pkgname=minify-html-bin
pkgver=0.16.4
pkgrel=2
pkgdesc='A Rust HTML minifier meticulously optimised for speed and effectiveness'
url='https://github.com/wilsonzlin/minify-html'
source=('LICENSE')
source_x86_64=("https://github.com/wilsonzlin/minify-html/releases/download/v$pkgver/minhtml-$pkgver-x86_64-unknown-linux-gnu")
source_aarch64=("https://github.com/wilsonzlin/minify-html/releases/download/v$pkgver/minhtml-$pkgver-aarch64-unknown-linux-gnu")
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('gcc-libs')
sha256sums=('a131d5418ac118f39e3b4478b30e3b1769c407fa389850abc422fc64c1675310')
sha256sums_x86_64=('631d9a07fa18a1d772492952dd690a09852bea845d5ec1b4d17b44536becd808')
sha256sums_aarch64=('1a1dcf0b3c2e47da6808095f127e40c36803a0917e24dd752f19f370c8cd4300')

package() {
  cd "$srcdir/"

  install -Dm755 minhtml-${pkgver}-${CARCH}-unknown-linux-gnu "${pkgdir}/usr/bin/minify-html"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
