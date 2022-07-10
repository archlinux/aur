# Maintainer: pitbuster <felipe.contreras.s@gmail.com>
pkgname=minify-js-bin
pkgver=0.5.6
pkgrel=1
pkgdesc='Extremely fast JavaScript minifier, written in Rust'
url='https://github.com/wilsonzlin/minify-js'
source=('LICENSE')
source_x86_64=("https://static.wilsonl.in/minify-js/cli/$pkgver/linux-$CARCH/minify-js")
arch=('x86_64')
license=('MIT')
depends=('gcc-libs')
sha256sums=('a131d5418ac118f39e3b4478b30e3b1769c407fa389850abc422fc64c1675310')
sha256sums_x86_64=('401b0c298c99da7bfa577b743b33f93a22cdfc52d1d11ba14b15f71b9810edb6')

package() {
  cd "$srcdir/"

  install -Dm755 minify-js "${pkgdir}/usr/bin/minify-js"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
