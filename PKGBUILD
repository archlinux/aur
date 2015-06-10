# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>
pkgname=fvwm-themes-extra
pkgver=0.7.0
pkgrel=1
pkgdesc="Extra themes for fvwm"
arch=('any')
url="http://fvwm-themes.sourceforge.net"
license=('GPL')
replaces=('fvwm-themes-extra-devel')
source=("http://downloads.sourceforge.net/sourceforge/fvwm-themes/$pkgname-$pkgver.tar.gz")
md5sums=('66c13802933942949c7c1be79a497496')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/usr/share/fvwm/themes"
  find . -type f | while read f ; do
	install -D $f "$pkgdir/usr/share/fvwm/themes/$f"
  done
}
