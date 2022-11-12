# Maintainer: Hemish <hemish04082005@gmail.com>

pkgname=plymouth-theme-hamara
pkgver=1.0
pkgrel=1
pkgdesc="Plymouth Theme from Hamara Linux"
arch=('any')
url="https://www.hamaralinux.org/"
license=('custom')
depends=('plymouth')
source=("http://ftp.debian.org/debian/pool/main/p/plymouth-theme-hamara/plymouth-theme-hamara_1.0_all.deb")
md5sums=('SKIP')

package() {
	bsdtar -xf data.tar.xz -C $pkgdir/
	install -dm755 "$pkgdir/usr/share/licenses/plymouth-theme-hamara"
	cat $pkgdir/usr/share/doc/plymouth-theme-hamara/copyright | tail -n 3 > $pkgdir/usr/share/licenses/plymouth-theme-hamara/LICENSE
	rm -r $pkgdir/usr/share/doc
}
