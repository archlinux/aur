# Maintainer: John Jenkins twodopeshaggy@gmail.com
# Contributor: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Eddie Lozon <almostlucky@attbi.com>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Thayer Williams <thayer@archlinux.org>

pkgname=gtk-theme-switch
pkgver=1.0.1
pkgrel=3
pkgdesc="Gtk theme switcher"
arch=('i686' 'x86_64')
url="http://muhri.net/nav.php3?node=gts"
license=('GPL')
depends=('gtk')
source=(http://www.muhri.net/$pkgname-$pkgver.tar.gz)
md5sums=('a1ce98489cbe410c5483e155e5834c46')

package() {
  cd $srcdir/$pkgname-$pkgver
  make
  install -D -m755 switch $pkgdir/usr/bin/switch
  install -D -m644 switch.1 $pkgdir/usr/share/man/man1/switch.1
}
