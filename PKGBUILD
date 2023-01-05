# Maintainer: Muktazam Hasbi Ashidiqi (reorr)
# Contributor: Nanda Okitavera (yuune)
# Contributor: Ghani Rafif (ekickx)

pkgname=mantablockscreen
pkgver=0.5
pkgrel=1
pkgdesc='Another i3lock-color wrapper that mantab'
url='https://github.com/reorr/mantablockscreen'
arch=(any)
license=(MIT)
depends=("xorg-xrandr" "bash" "imagemagick" "i3lock-color-git" "otf-san-francisco" 
"ttf-abel-regular")
_tarname=mantablockscreen-$pkgver
source=("$_tarname.tar.gz::https://github.com/reorr/mantablockscreen/archive/v$pkgver.tar.gz") 
sha256sums=('6047035baa77bb0f9c3290a4e7422f99e3a287fe01662d85c8aeb9c082e32ec8')

package() {
  cd "$srcdir/$_tarname"
  make DESTDIR="$pkgdir/" install
}
