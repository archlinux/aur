# Maintainer: Jiri Tyr <jiri.tyr@gmail.com>

pkgname='armm'
pkgver='1.0'
pkgrel=1
pkgdesc='Android Repo Manifest Management tool'
url='https://github.com/jtyr/armm'
arch=('any')
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-docopt' 'python-lxml')
source=("https://github.com/jtyr/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('ec298eba78aa13e1cceb1969ee96f7ec07d5ff63751717b305a62c0e9b2885cf')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
