# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkfilebrowser' 'python2-tkfilebrowser')
pkgver=2.0.0
pkgrel=1
pkgdesc="File browser for Tkinter, alternative to tkinter.filedialog in linux with GTK bookmarks support."
url="https://github.com/j4321/tkFileBrowser"
arch=('any')
license=('GPL3')
source=("tkfilebrowser-$pkgver.tar.gz::https://github.com/j4321/tkFileBrowser/archive/v$pkgver.tar.gz")
sha512sums=('d1d144d3bdc9e4be308936e1c5b6cccdbf1cb2c7543510a4a7d11fcad8721fe797fbcc66f35444bae40250c1828fb1788a00bc132123b147531cb814b9f63e6a')

package_python-tkfilebrowser() {
  makedepends=('python-setuptools')
  depends=('python-psutil' 'tk')
  cd "${srcdir}/tkFileBrowser-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-tkfilebrowser() {
  makedepends=('python2-setuptools')
  depends=('python2-psutil' 'tk')
  cd "${srcdir}/tkFileBrowser-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
