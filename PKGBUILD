# Maintainer: Your Name <your.email@example.com>
pkgname=itendry-bin
pkgver=3.4.0
pkgrel=1
pkgdesc="Guitar companion app, for classic Malagasy song"
arch=('x86_64')
url="https://itendry.com"
depends=('gtk3' 'gdk-pixbuf2' 'fontconfig' 'libstdc++' 'glibc' 'libgcc' 'pango' 'at-spi2-core' 'libepoxy' 'harfbuzz' 'glib2' 'cairo')

source=("https://github.com/frostzing/iTendry-bin/releases/download/releases/itendry-3.4.0-1-x86_64.pkg.tar.zst")
sha256sums=('SKIP')

package() {
   cd "$srcdir"
   rm "$pkgdir" -r
   sudo pacman -U itendry-3.4.0-1-x86_64.pkg.tar.zst

}
