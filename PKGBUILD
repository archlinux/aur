
pkgname='python-pyscreenshot'
pkgver=1.0
pkgrel=1
pkgdesc="Copy the contents of the screen to a PIL or Pillow image memory"
url="https://github.com/ponty/pyscreenshot"
arch=('any')
license=('BSD')
depends=('python' 'python-pillow' 'pygtk' 'python-easyprocess')
source=("https://github.com/ponty/pyscreenshot/archive/${pkgver}.tar.gz")
sha512sums=('11612b9adbfa21aa85c457fb1ad5e26ac764c8b1472177828f2ab1fd52cdb8ec4f0b931d3d57d8bb1fe389ae9eda7d6c6692ec2b99b92f749079db2f089673f9')

build() {
  cd pyscreenshot-${pkgver}
  python setup.py build
}

package() {
  cd pyscreenshot-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}
