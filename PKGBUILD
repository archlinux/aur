# Maintainer: Juliette Monsel <j_4321@sfr.fr>
pkgname=synchronisation
pkgver=1.0.0
pkgrel=1
pkgdesc="Folder synchronisation software"
arch=('any')
url="https://sourceforge.net/projects/synchronisation/"
license=('GPL3')
depends=('python3' 'python-pyside' 'gettext' 'desktop-file-utils')
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=(!emptydirs)
#changelog=
source=("Synchronisation_linux.tar.gz::https://sourceforge.net/projects/synchronisation/files/$pkgver/Synchronisation_linux.tar.gz/download")
#noextract=()
md5sums=('ef273e4091ece999fad3308937f82dde')
package() {
 cd "$srcdir/Synchronisation-$pkgver"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
 install -D -m644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
