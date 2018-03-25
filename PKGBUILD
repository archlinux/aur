# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkfilebrowser' 'python2-tkfilebrowser')
pkgver=2.2.1
pkgrel=1
pkgdesc="File browser for Tkinter, alternative to tkinter.filedialog in linux with GTK bookmarks support."
url="https://github.com/j4321/tkFileBrowser"
arch=('any')
license=('GPL3')
source=("tkfilebrowser-$pkgver.tar.gz::https://github.com/j4321/tkFileBrowser/archive/v$pkgver.tar.gz")
sha512sums=('4c325a8192ee1f32f4f8471ea72247b76a1d8b5cdbb8163ee2eed3dacf9a474df317b0fecfbf2a40a2cf0d4c40ac4eba0733913b73dc343e8397765d7ee02bdb')

package_python-tkfilebrowser() {
  makedepends=('python-setuptools')
  depends=('python-psutil' 'tk' 'python-babel')
  cd "${srcdir}/tkFileBrowser-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-tkfilebrowser() {
  makedepends=('python2-setuptools')
  depends=('python2-psutil' 'tk'  'python2-babel')
  cd "${srcdir}/tkFileBrowser-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
