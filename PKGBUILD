# Maintainer: Jean-Luc Tambasco <an.obscurity@gmail.com>
pkgname=python-modesolverpy
pkgver=1
pkgrel=1
pkgdesc="Photonic mode solver with a simple interface."
arch=('any')
url="https://github.com/jtambasco/modesolverpy"
license=('MIT')
depends=('python'
         'python-numpy'
         'python-scipy'
         'python-tqdm'
         'python-opticalmaterialspy'
         'python-gnuplotpy')
makedepends=('python-setuptools')
options=(!emptydirs)
source=('git+https://github.com/jtambasco/modesolverpy.git')
md5sums=('SKIP')

package() {
  cd "$srcdir/${pkgname:7}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
