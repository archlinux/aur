# Maintainer: Deltara <boided420 at gmail dot com>
pkgname=binfmt-love
pkgver=1
pkgrel=2
pkgdesc="Register LOVE applications"
arch=('any')
url="http://www.freedesktop.org/software/systemd/man/binfmt.d.html"
license=('Unlicense')
depends=('love')
source=('loveapp.conf')
md5sums=('d61810ce9d54ba84f85e33813edfecd9')

package() {
	install -Dm644 loveapp.conf $pkgdir/usr/lib/binfmt.d/loveapp.conf
}
