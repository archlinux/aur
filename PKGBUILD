# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=checkmails
pkgver=1.1.4
pkgrel=1
pkgdesc="System tray unread mail checker using IMAP protocol"
arch=('any')
url="https://sourceforge.net/projects/checkmails"
license=('GPL3')
makedepends=('python-setuptools')
depends=('tktray' 'python-pillow' 'python-crypto' 'gettext' 'desktop-file-utils' 'libnotify')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/checkmails/files/${pkgver}/${pkgname}-${pkgver}.tar.gz/download")
sha512sums=('fb2c5094f995018d76d4d19dc1ae9a07dfd9105a6d99b59a9626cc4bb2564760b937465f2ad453321f2a32475ccd68fd1e0b1d2514d425b26c20c03805fee72e')
changelog=changelog

package() {
 cd "$srcdir/${pkgname}-${pkgver}"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
}
