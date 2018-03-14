# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkfilebrowser' 'python2-tkfilebrowser')
pkgver=2.2.0
pkgrel=1
pkgdesc="File browser for Tkinter, alternative to tkinter.filedialog in linux with GTK bookmarks support."
url="https://github.com/j4321/tkFileBrowser"
arch=('any')
license=('GPL3')
source=("tkfilebrowser-$pkgver.tar.gz::https://github.com/j4321/tkFileBrowser/archive/v$pkgver.tar.gz")
sha512sums=('611dfd695f8a265621a0b30cbeab350fae46eaaf36aa6a64ea601f3132eeafeaec519dce592a49095c5d200476d89e571f13763fcfe19d05c9ded92845a02370')

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
