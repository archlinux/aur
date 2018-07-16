pkgname='swisseph-fixstars'
pkgver='2018.01.20'
pkgrel='1'
pkgdesc='High precision Swiss Ephemeris developed by Astrodienst (Fixstars).'
arch=('any')
license=('GPL')
groups=('swisseph-all')
url='http://www.astro.com/swisseph/'
depends=()
makedepends=()
optdepends=()
source=('http://www.astro.com/ftp/swisseph/src/sefstars.txt')

package() {
    install -d -m 755 "$pkgdir/usr/share/swisseph/"
    install -m 755 "$srcdir/sefstars.txt" "$pkgdir/usr/share/swisseph/"
}

sha1sums=('7b00ce5d316861279c0dde1dc0e942ea6f3ff2a8')
