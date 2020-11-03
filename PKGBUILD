# Maintainer: Muktazam Hasbi Ashidiqi (reorr)
# Contributor: Teddy Valette (kyominii) <teddy.valette@telecomnancy.net>
# Contributor: Nanda Okitavera (yuune)
# Contributor: Ghani Rafif (ekickx)

pkgname=mantablockscreen
pkgver=0.4
pkgrel=1
pkgdesc='Another i3lock-color wrapper that mantab'
url='https://github.com/reorr/mantablockscreen'
arch=(any)
license=(MIT)
depends=("xorg-xrandr" "bash" "imagemagick" "i3lock-color-git" "otf-san-francisco" 
"ttf-abel-regular")
_tarname=mantablockscreen-$pkgver
source=("$_tarname.tar.gz::https://github.com/reorr/mantablockscreen/archive/v$pkgver.tar.gz") 
sha256sums=('0132911f65ce022207883eb4e158a78159bd01adfd40e59ff5e08de061335b60')

package() {
  cd "$srcdir/$_tarname"
  make DESTDIR="$pkgdir/" install
}
