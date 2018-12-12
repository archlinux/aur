# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Ruben Schuller <shiml@orgizm.net>
arch=('any')
pkgname='fvwm-icons'
pkgver=20070101
pkgrel=2
pkgdesc="Old icons of the FVWM-Project."
source=("http://www.fvwm.org/generated/icon_download/fvwm_icons-$pkgver.tar.gz")
source=("ftp://ftp.uk.freebsd.org/pub/OpenBSD/distfiles/fvwm_icons-$pkgver.tar.gz")
url="http://www.fvwm.org"
md5sums=('c6d98849680a1c306067aa085519e46c')
license=("GPL")

package() {
  cd "$srcdir/fvwm_icons-$pkgver"
  for f in *.xpm ; do
	  install -Dm644 "$f" "$pkgdir/usr/share/icons/fvwm/$f"
  done
}
