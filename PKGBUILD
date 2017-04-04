# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=mynotes
pkgver=2.0.3
pkgrel=1
pkgdesc="Desktop post-it / sticky notes managed from system tray icon"
arch=('any')
url="https://sourceforge.net/projects/my-notes"
license=('GPL3')
depends=('tktray' 'python-ewmh' 'gettext' 'desktop-file-utils' 'python-easywebdav')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/my-notes/files/${pkgver}/${pkgname}-${pkgver}.tar.gz/download")
sha512sums=('0b35080dc9ff12b9c6b98898cf099b9eae966390925dbf9f602222694e3f4077138312a33938c54fbdb19d6065b69a91626349ce19aa357d67eb63ce7ad871f7')

package() {
 cd "$srcdir/${pkgname}-${pkgver}"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
}
