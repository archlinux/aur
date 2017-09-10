# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=checkmails
pkgver=1.1.5
pkgrel=1
pkgdesc="System tray unread mail checker using IMAP protocol"
arch=('any')
url="https://sourceforge.net/projects/checkmails"
license=('GPL3')
makedepends=('python-setuptools')
depends=('tktray' 'python-pillow' 'python-crypto' 'gettext' 'desktop-file-utils' 'libnotify')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/checkmails/files/${pkgver}/${pkgname}-${pkgver}.tar.gz/download")
sha512sums=('0473956a7823377927aa6efa6de553a74fc01a704e79cd6f26bb48305ab35f2a57008b8adfd4074061a9ee8b81c569ffe4909d378b1ca5c6ae89b2e8dfa01687')
changelog=changelog

package() {
 cd "$srcdir/${pkgname}-${pkgver}"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
}
