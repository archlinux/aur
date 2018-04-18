# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkfilebrowser' 'python2-tkfilebrowser')
pkgver=2.2.2
pkgrel=1
pkgdesc="File browser for Tkinter, alternative to tkinter.filedialog in linux with GTK bookmarks support."
url="https://github.com/j4321/tkFileBrowser"
arch=('any')
license=('GPL3')
source=("tkfilebrowser-$pkgver.tar.gz::https://github.com/j4321/tkFileBrowser/archive/v$pkgver.tar.gz")
sha512sums=('ccc0e4a99deaa68ccd8810f4242dae56aa55546ccf38867f140fd942546de67a464dc7797e22f8ba475f4f962d2ef9bc1d86f1ad9c49eb10913f72d93456acb2')

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
