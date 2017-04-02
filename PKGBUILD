# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=mynotes
pkgver=2.0.1
pkgrel=1
pkgdesc="Desktop post-it / sticky notes managed from system tray icon"
arch=('any')
url="https://sourceforge.net/projects/my-notes"
license=('GPL3')
depends=('tktray' 'python-ewmh' 'gettext' 'desktop-file-utils')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/my-notes/files/${pkgver}/${pkgname}-${pkgver}.tar.gz/download")
sha512sums=('cc01ebeb63ba80ac116a848e1514634652c8735237dd13598b9e068d968684bfb05357fca187e3359a021ba555376be9a6848d969d37dfc31beb851773005742')

package() {
 cd "$srcdir/${pkgname}-${pkgver}"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
}
