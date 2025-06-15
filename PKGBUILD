# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=videotimestamps
pkgname=python-${_plug}
pkgver=0.2.0
pkgrel=1
pkgdesc="Python package: ${_plug}"
arch=('any')
url='https://github.com/moi15moi/VideoTimestamps/'
license=('MIT')
depends=('python')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/93/4b/8e9b138bd10883f64690c4a8bee0c980d58a0537b434a115398034fc8075/videotimestamps-0.2.0-py3-none-any.whl")
sha256sums=('73a192eca77be3150a7736b6a7cb3da0859d992e7408c7952b5f785f50705f44')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
