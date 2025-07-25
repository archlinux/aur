pkgname=maple-mono-nf-cn
pkgver=7.4
pkgrel=0
pkgdesc="Maple Mono font with Nerd Fonts symbols and Chinese support"
arch=('any')
url="https://github.com/subframe7536/maple-mono-nf"
license=('OFL')
groups=('fonts')

source=("https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMono-NF-CN-unhinted.zip")
sha256sums=('9b439e9c48a77ea3b314f77d27ef61be6956672a3d80de3c2acbed9d22596d0c')
package() {
  # Create the font directory if it doesn't exist
  install -d "$pkgdir/usr/share/fonts/maple-mono-nf-cn"

  # Install the font files
#   cp -r "$srcdir/*otf" "$pkgdir/usr/share/fonts/maple-mono-nf-cn/"
  cp -r $srcdir/*.ttf $pkgdir/usr/share/fonts/maple-mono-nf-cn/
}

# https://github.com/subframe7536/maple-font/releases/download/v7.4/MapleMono-NF-CN-unhinted.zip
