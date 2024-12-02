# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=console-fonts-zap
pkgver=2.4
pkgrel=1
pkgdesc='Linux console fonts from The ZAP Group Australia'
arch=('any')
url='https://www.zap.org.au/projects/console-fonts-zap/'
license=(GPL-3.0-or-later)
validpgpkeys=(B0F6BC7F46D30F1432FC46190D254111C4EE569B) # John Zaitseff <J.Zaitseff@zap.org.au>
source=(https://ftp.zap.org.au/pub/fonts/$pkgname/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=(
  '976609ffcb222a03cf0aad588cc2cbd198f7e072144e8061cdcbc9853d3e643e'
  'SKIP'
)

package() {
  cd "$srcdir"/$pkgname-$pkgver
  install -D -m644 *.psf -t "$pkgdir/usr/share/kbd/consolefonts/"
}
