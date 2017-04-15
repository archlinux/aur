# Contributor: tuftedocelot <tuftedocelot@fastmail.fm>

pkgname=('python-filterpy' 'python2-filterpy')
pkgver=0.1.5
pkgrel=1
pkgdesc='Kalman filtering and optimal estimation library in Python.'
arch=('any')
url='https://github.com/rlabbe/filterpy'
license=('MIT')
makedepends=('python-setuptools' 'python-numpy' 'python-scipy' 'python-matplotlib')
source=("https://github.com/rlabbe/filterpy/archive/$pkgver.tar.gz")
sha256sums=('13f083c0898f507a4725d1e026867089ff248fc8e736da6e74d00512ae65d008')

package_python-filterpy() {
  cd "$srcdir"/filterpy-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}

package_python2-filterpy() {
  cd "$srcdir"/filterpy-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
# vim:set ts=2 sw=2 et:
