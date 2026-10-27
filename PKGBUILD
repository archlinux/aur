pkgname=maple-mono-nf-cn
pkgver=7.9
pkgrel=1
pkgdesc="Maple Mono font with Nerd Fonts symbols and Chinese support"
arch=('any')
url="https://github.com/subframe7536/maple-mono-nf"
license=('OFL')
groups=('fonts')

source=("https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMono-NF-CN-unhinted.zip")
sha256sums=('ab88522932cf4015dffeaef6dedc59a22a5fefecdcc6e583d9fcd997da5b7cac')
package() {
  # Create the font directory if it doesn't exist
  install -d "$pkgdir/usr/share/fonts/maple-mono-nf-cn"

  # Install the font files
#   cp -r "$srcdir/*otf" "$pkgdir/usr/share/fonts/maple-mono-nf-cn/"
  cp -r $srcdir/*.ttf $pkgdir/usr/share/fonts/maple-mono-nf-cn/
}
