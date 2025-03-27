# Maintainer: TheCyberArcher <thecyberarcher@protonmail.ch>
# Contributor: Marcel Hoppe <hoppe.marcel@gmail.com>
# https://github.com/solus-cold-storage/evopop-icon-theme/

_gituser=solus-cold-storage
_gitname=evopop-icon-theme

pkgname=evopop-icon-theme
pkgbase=${pkgname}
pkgver=0.11
pkgrel=2
pkgdesc='Icon theme from Solus OS and Budgie Desktop'
arch=('any')
url="https://github.com/$_gituser/$_gitname"
license=('CC-BY-4.0')
source=("https://github.com/$_gituser/$_gitname/archive/$pkgver.tar.gz")
sha256sums=('28131eddd56a65c152ae9a05950c0c4a972860c641be3e592f2d10622b75f9f2')

package() {
  cd "$srcdir/$_gitname-$pkgver"
  DESTDIR="$pkgdir/usr/share/icons/"
  mkdir -p "$DESTDIR"
	cp -r EvoPop "$DESTDIR/"
}
