pkgname=maple-mono-nf-cn
pkgver=7.0
pkgrel=1
pkgdesc="Maple Mono font with Nerd Fonts symbols and Chinese support"
arch=('any')
url="https://github.com/subframe7536/maple-mono-nf"
license=('OFL')
groups=('fonts')

source=("https://github.com/subframe7536/maple-font/releases/download/$pkgver/MapleMono-NF-CN-unhinted.zip")
sha256sums=('c7b66739b0e418c4789cfa4c6c17d17c4e8ce28d7dad9800a50786ebd3fa4d98')
package() {
  # Create the font directory if it doesn't exist
  install -d "$pkgdir/usr/share/fonts/maple-mono-nf-cn"

  # Install the font files
#   cp -r "$srcdir/*otf" "$pkgdir/usr/share/fonts/maple-mono-nf-cn/"
  cp -r $srcdir/*.ttf $pkgdir/usr/share/fonts/maple-mono-nf-cn/
}
