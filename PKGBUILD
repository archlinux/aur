# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=python-tkfilebrowser
pkgver=1.1.1
pkgrel=1
pkgdesc="File browser for Tkinter, alternative to tkinter.filedialog in linux with GTK bookmarks support."
url="https://github.com/j4321/tkFileBrowser"
arch=('any')
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-psutil' 'tk')
source=("tkFileBrowser-$pkgver.tar.gz::https://github.com/j4321/tkFileBrowser/archive/v$pkgver.tar.gz")
sha512sums=('2536b3f4b2ebf7e4b68c96685d08d0a9419619dcd00d8149b9b41d21294ec5c80e4586658f83064710ec00c2ceddd3bcc3d7cee6814902ea9c88a4d12c071500')
package() {
 cd "$srcdir/tkFileBrowser-$pkgver"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
}
