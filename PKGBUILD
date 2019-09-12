
pkgname='python-pyscreenshot'
pkgver=0.5.1
pkgrel=2
pkgdesc="Copy the contents of the screen to a PIL or Pillow image memory"
url="https://github.com/ponty/pyscreenshot"
arch=('any')
license=('BSD')
depends=('python' 'python-pillow' 'pygtk' 'python-easyprocess')
source=("https://github.com/ponty/pyscreenshot/archive/${pkgver}.tar.gz")
sha1sums=('a3930af95b82a6e4fe7c31d7b02cb7dffcb425fe')

build() {
  cd pyscreenshot-${pkgver}
  python setup.py build
}

package() {
  cd pyscreenshot-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}
