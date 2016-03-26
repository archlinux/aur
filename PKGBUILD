# Contributor: tuftedocelot <tuftedocelot@fastmail.fm>

pkgname=python2-filterpy
pkgver=0.1.2
pkgrel=2
pkgdesc='Kalman filtering and optimal estimation library in Python.'
arch=('any')
url='https://github.com/rlabbe/filterpy'
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools' 'python2-numpy' 'python2-scipy' 'python2-matplotlib')
source=("https://github.com/rlabbe/filterpy/archive/$pkgver.tar.gz")
sha256sums=('42542b8a3e1792b4393ba0288cea2158ee922d029103b6cf8d52f3d11103554d')

package() {
  cd "$srcdir"/filterpy-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
