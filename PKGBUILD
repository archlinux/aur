# Maintainer: Arvedui <arvedui at posteo.de>


pkgname=python-picuplib
pkgver=0.3.3
pkgrel=1
pkgdesc="Picflash upload library"
arch=('any')
url="https://github.com/Arvedui/picuplib"
license=('LGPLv2')
depends=('python' 'python-requests' 'python-requests-toolbelt')
makedepends=('python-setuptools' 'git')
source=("git+https://github.com/Arvedui/picuplib.git#tag=$pkgver")
md5sums=("SKIP")

package() {
  cd "${srcdir}/picuplib"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

