
pkgname='python-pyscreenshot'
pkgver=0.4.2
pkgrel=2
pkgdesc="Copy the contents of the screen to a PIL or Pillow image memory"
url="https://github.com/ponty/pyscreenshot"
arch=('any')
license=('BSD')
depends=('python' 'python-pillow' 'pygtk' 'python-easyprocess')
source=("https://github.com/ponty/pyscreenshot/archive/${pkgver}.tar.gz")
sha1sums=('b348f0643557c1d39295bbfdbc7c8ef167adb209')

build() {
  cd pyscreenshot-${pkgver}
  python setup.py build
}

package() {
  cd pyscreenshot-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}
