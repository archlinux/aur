# Maintainer: Marcel Hoppe <hoppe.marcel@gmail.com>
# https://github.com/solus-cold-storage/evopop-icon-theme/

_gituser=solus-cold-storage
_gitname=evopop-icon-theme

pkgname=evopop-icon-theme
pkgbase=${pkgname}
pkgver=0.8
pkgrel=3
pkgdesc='Icon theme from Solus OS and Budgie Desktop'
arch=('any')
url="https://github.com/$_gituser/$_gitname"
license=('GPL')
source=("https://github.com/$_gituser/$_gitname/archive/$pkgver.tar.gz")
md5sums=('d5e585c6ec6d9ec2292c146d2facbaab')





package() {
  cd "$srcdir/$_gitname-$pkgver"
  DESTDIR="$pkgdir/usr/share/icons/"
  mkdir -p "$DESTDIR"
	cp -r EvoPop "$DESTDIR/"
}
