# Maintainer: Marcel Hoppe <hoppe.marcel@gmail.com>
# https://github.com/solus-cold-storage/evopop-icon-theme/

_gituser=solus-cold-storage
_gitname=evopop-icon-theme

pkgname=evopop-icon-theme
pkgbase=${pkgname}
pkgver=0.9
pkgrel=1
pkgdesc='Icon theme from Solus OS and Budgie Desktop'
arch=('any')
url="https://github.com/$_gituser/$_gitname"
license=('GPL')
source=("https://github.com/$_gituser/$_gitname/archive/$pkgver.tar.gz")
md5sums=('a71400de84607f49f8fa1c8169bf18c2')





package() {
  cd "$srcdir/$_gitname-$pkgver"
  DESTDIR="$pkgdir/usr/share/icons/"
  mkdir -p "$DESTDIR"
	cp -r EvoPop "$DESTDIR/"
}
