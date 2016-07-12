
pkgname='python-pyscreenshot'
pkgver=0.4.1
pkgrel=1
pkgdesc="Copy the contents of the screen to a PIL or Pillow image memory"
url="https://github.com/ponty/pyscreenshot"
arch=('any')
license=('BSD')
depends=('python' 'python-pillow' 'pygtk')
source=("https://github.com/ponty/pyscreenshot/archive/${pkgver}.tar.gz")
sha1sums=('781a0fea51c42515d80529cff6ba09f08395f295')

build() {
  cd pyscreenshot-${pkgver}
  python setup.py build
}

package() {
  cd pyscreenshot-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}
