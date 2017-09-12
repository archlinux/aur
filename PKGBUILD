# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkfilebrowser' 'python2-tkfilebrowser')
pkgver=2.1.0
pkgrel=1
pkgdesc="File browser for Tkinter, alternative to tkinter.filedialog in linux with GTK bookmarks support."
url="https://github.com/j4321/tkFileBrowser"
arch=('any')
license=('GPL3')
source=("tkfilebrowser-$pkgver.tar.gz::https://github.com/j4321/tkFileBrowser/archive/v$pkgver.tar.gz")
sha512sums=('9e3c28e7c9d1ff5310241e07eb568085761598abfa203242fa3922532f09d0a3aec46155409ccb308e441a1484cfea8286a370e9b3dab260b5dbd92b559aeeb1')

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
