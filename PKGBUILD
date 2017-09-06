# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=mynotes
pkgver=2.2.1
pkgrel=1
pkgdesc="Desktop post-it / sticky notes managed from system tray icon"
arch=('any')
url="https://sourceforge.net/projects/my-notes"
license=('GPL3')
depends=('tktray' 'python-ewmh' 'gettext' 'desktop-file-utils' 'python-setuptools')
optdepends=('python-tkfilebrowser: nicer file browser',
            'zenity: nicer file browser')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/my-notes/files/${pkgver}/${pkgname}-${pkgver}.tar.gz/download")
sha512sums=('e80d7df9bace911670b69ec2f1255f96bb672c83d60a0f2eedf760bf7d80f22e2ad5cb0081258f91edb8115c4101f2ba0837c8ec3e7a4f22a912f60e0668c4f0')

package() {
 cd "$srcdir/${pkgname}-${pkgver}"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
}
