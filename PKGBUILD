# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=mynotes
pkgver=2.1.0
pkgrel=1
pkgdesc="Desktop post-it / sticky notes managed from system tray icon"
arch=('any')
url="https://sourceforge.net/projects/my-notes"
license=('GPL3')
depends=('tktray' 'python-ewmh' 'gettext' 'desktop-file-utils' 'python-setuptools')
optdepends=('python-tkfilebrowser: nicer file browser',
            'zenity: nicer file browser')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/my-notes/files/${pkgver}/${pkgname}-${pkgver}.tar.gz/download")
sha512sums=('9d4d02a6b1c9313cb2f8ae31c0a067b1343ee220aac5df54d25fab9e4201b63f2c4466f4ce6287da322c492ce512af18e7e3965e6c94bda7cded6556460b2de8')

package() {
 cd "$srcdir/${pkgname}-${pkgver}"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
}
