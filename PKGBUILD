# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=mynotes
pkgver=2.1.0
pkgrel=2
pkgdesc="Desktop post-it / sticky notes managed from system tray icon"
arch=('any')
url="https://sourceforge.net/projects/my-notes"
license=('GPL3')
depends=('tktray' 'python-ewmh' 'gettext' 'desktop-file-utils' 'python-setuptools')
optdepends=('python-tkfilebrowser: nicer file browser',
            'zenity: nicer file browser')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/my-notes/files/${pkgver}/${pkgname}-${pkgver}.tar.gz/download")
sha512sums=('e7e95e2ed683a68e1c6dd6a0c46f9096eda1bd94d10ed0714515cd102389cae4aa955fc587114c518ba6fdd2dbc5902f51efcd98bf20a42a02bf927e3006a873')

package() {
 cd "$srcdir/${pkgname}-${pkgver}"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
}
