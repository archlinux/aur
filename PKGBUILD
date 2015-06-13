# Contributor: Timo Schmiade <the_isz@gmx.de>

pkgname=cdrip
pkgver=2.2
pkgrel=4
pkgdesc="A cdparanoia, lame and musicbrainz.org frontend written in python."
arch=("any")
url="https://github.com/the-isz/cdrip"
license=("GPL")
depends=("python2" "python2-musicbrainz2" "python2-eyed3" "libdiscid" "cdparanoia")
options=(!emptydirs)
source=("https://github.com/the-isz/$pkgname/tarball/$pkgver")
md5sums=("0e713c7c86454e4a5d22e9421f17c238")

package() {
  cd "$srcdir/the-isz-$pkgname-ae81c46/deployment"

  python2 setup.py install --root="$pkgdir/" --optimize=1
  mv "$pkgdir/usr/bin/cdrip.py" "$pkgdir/usr/bin/cdrip"
}
