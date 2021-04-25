# Maintainer: Gregory <gregory.mkv@gmail.com>

pkgname=handlr-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="Powerful alternative to xdg-utils written in Rust"
arch=('x86_64')
url="https://github.com/chmln/handlr"
license=('unknown')
source=("${url}/releases/download/v${pkgver}/handlr"
    "$url/raw/v${pkgver}/completions/handlr.fish"
    "$url/raw/v${pkgver}/completions/_handlr")
md5sums=('SKIP' 'SKIP' 'SKIP')

package() {
  install -Dm 755 handlr "$pkgdir/usr/bin/handlr"
  install -Dm 755 handlr.fish "$pkgdir/usr/share/fish/vendor_completions.d/handlr.fish"
  install -Dm 755 _handlr "$pkgdir/usr/share/zsh/site-functions/_handlr"
}
