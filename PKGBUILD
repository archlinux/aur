# Maintainer: Jiri Tyr <jiri.tyr@gmail.com>

pkgname='armm'
pkgver='1.0.0'
pkgrel=1
pkgdesc='Android Repo Manifest Management tool'
url='https://github.com/jtyr/armm'
arch=('any')
license=('MIT')
makedepends=('python-setuptools')
depends=("python")
source=("https://github.com/jtyr/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('67c2ea41437802ffba907f710283b2170d5e7b9a4f30e3fd17db81566aaf7215')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
