pkgname=python-ursina
pkgver=3.5.0
pkgrel=1
pkgdesc='An easy to use game engine/framework for python.'
arch=('any')
url="https://pokepetter.github.io/ursina"
license=('MIT')
depends=('python-numpy'
                 'panda3d'
                 'python-pillow'
                 'python-screeninfo'
                 'python-pyperclip')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/3a/14/a67d34588effb47c8045eaf9a4c807ca0b6afd62b6db9ea4ad723c39327a/ursina-3.5.0.tar.gz")
sha256sums=('9b940962bbbc9ec90bbe10a63f798d18079320f53a52fa87d110641e9f23e1db')

package() {
  cd "ursina-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
