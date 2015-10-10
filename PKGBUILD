# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname=python-serpent
pkgver=0.2.0
pkgrel=2
pkgdesc='Serpent serialization library (Python/.NET/Java)'
url='https://github.com/irmen/Serpent'
arch=('any')
license=('MIT')
depends=('python')
source=("git://github.com/irmen/Serpent")
md5sums=('SKIP')

package() {
  cd Serpent
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
