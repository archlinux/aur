# Maintainer: Oskar Roesler <oskar at oskar-roesler dot de>

pkgname=python2-ipaddress
pkgver=1.0.23
pkgrel=1
pkgdesc="IPv4/IPv6 manipulation library"
arch=(any)
url="https://github.com/phihag/ipaddress"
license=('custom:PSF')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.io/packages/source/i/ipaddress/ipaddress-$pkgver.tar.gz")
sha512sums=('340e2a8698df1868038f55889671442eba17f06ec3f493759d8d0a9bf406eefbe1f67c14ca616f52e5bf2280942dcece7e89fb19de0923bee1ee20e60f48896e')

package() {
  cd ipaddress-$pkgver
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
