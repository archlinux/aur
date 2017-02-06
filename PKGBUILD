# Maintainer: Juliette Monsel <j_4321@protonmail.com>
pkgname=python-tkfilebrowser
pkgver=1.0.1
pkgrel=1
pkgdesc="File browser for Tkinter, alternative to tkinter.filedialog in linux with GTK bookmarks support."
url="https://github.com/j4321/tkFileBrowser"
arch=('any')
license=('GPL3')
depends=('python-psutil' 'tk')
source=("tkFileBrowser-$pkgver.tar.gz::https://github.com/j4321/tkFileBrowser/releases/download/v$pkgver/tkFileBrowser-$pkgver.tar.gz")
sha512sums=('dd82801e4b8a3628f48981e752f28a4553d396e56aef4ae5f893e15ab3acab53876754f6bccedbd51ca8ed0394ff1024ce3f3a58a7f06eb46abf226664e63d59')
package() {
 cd "$srcdir/tkFileBrowser-$pkgver"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
 install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
