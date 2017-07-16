# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=mynotes
pkgver=2.2.0
pkgrel=1
pkgdesc="Desktop post-it / sticky notes managed from system tray icon"
arch=('any')
url="https://sourceforge.net/projects/my-notes"
license=('GPL3')
depends=('tktray' 'python-ewmh' 'gettext' 'desktop-file-utils' 'python-setuptools')
optdepends=('python-tkfilebrowser: nicer file browser',
            'zenity: nicer file browser')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/my-notes/files/${pkgver}/${pkgname}-${pkgver}.tar.gz/download")
sha512sums=('bbb9ae100d244452b5750f20fbb4753600c7587a688e797944bf5f2b54b5326d7379ddc2fe13ddfb4c226669ef4daded72a7ac1ef8e51cf90c8cac1fb6a1b45a')

package() {
 cd "$srcdir/${pkgname}-${pkgver}"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
}
