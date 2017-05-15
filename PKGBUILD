# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=python-tkfilebrowser
pkgver=1.1.2
pkgrel=1
pkgdesc="File browser for Tkinter, alternative to tkinter.filedialog in linux with GTK bookmarks support."
url="https://github.com/j4321/tkFileBrowser"
arch=('any')
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-psutil' 'tk')
source=("tkFileBrowser-$pkgver.tar.gz::https://github.com/j4321/tkFileBrowser/archive/v$pkgver.tar.gz")
sha512sums=('adf19a3eedad9879519d3d6b139c23fb3b3deaa71ed4fbde33da054c5a62217ec39b2547f676f45e2ec1f0ce08c6d8a316193ea7585fa2d9beedf4f2cea41261')
package() {
 cd "$srcdir/tkFileBrowser-$pkgver"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
}
