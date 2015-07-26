# Maintainer: Arvedui <arvedui at posteo.de>


pkgname=picup
pkgver=0.5
pkgrel=1
pkgdesc="Picflash upload Tool"
arch=('any')
url="https://github.com/Arvedui/picup"
license=('GPL2')
depends=('python' 'python-picuplib' 'python-pyqt5' 'python-retrying')
makedepends=('git')
source=("git+https://github.com/Arvedui/picup.git#tag=$pkgver")
md5sums=("SKIP")

package() {
  cd "${srcdir}/picup"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

