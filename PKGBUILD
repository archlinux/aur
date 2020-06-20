# Maintainer: Gabriele Musco <emaildigabry@gmail.com>
# Upstream URL: https://github.com/jath03/openrgb-python

pkgname=python-openrgb
pkgver=0.0.5
pkgrel=1
pkgdesc="A python client for the OpenRGB SDK"
arch=('any')
url="https://github.com/jath03/openrgb-python"
license=('GPL-3.0')
makedepends=('python-setuptools' 'git')
depends=('openrgb' 'python')
conflicts=('python-openrgb-git')
source=("python-openrgb-${pkgver}::git+$url#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd python-openrgb-${pkgver}
}

package() {
  cd "${srcdir}/python-openrgb-${pkgver}"
  python setup.py install --root="${pkgdir}"
}
