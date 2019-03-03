# Maintainer: Muktazam Hasbi Ashidiqi (reorr)
# Contributor: Teddy Valette (kyominii) <teddy.valette@telecomnancy.net>
# Contributor: Nanda Okitavera (yuune)
# Contributor: Ghani Rafif (ekickx)

pkgname=mantablockscreen
pkgver=0.3
pkgrel=1
pkgdesc='Another i3lock-color wrapper that mantab'
url='https://github.com/reorr/mantablockscreen'
arch=(any)
license=(MIT)
depends=("xorg-xrandr" "bash" "imagemagick" "i3lock-color-git" "otf-san-francisco" 
"ttf-abel-regular")
_tarname=mantablockscreen-$pkgver
source=("$_tarname.tar.gz::https://github.com/reorr/mantablockscreen/archive/v$pkgver.tar.gz") 
sha256sums=('796a5a16ef6392f2addb6a9bf1412b38a02aea7ee317d2ba8fce5fce08f6dfc0')

package() {
  cd "$srcdir/$_tarname"
  make DESTDIR="$pkgdir/" install
}
