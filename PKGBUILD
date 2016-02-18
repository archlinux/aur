# Maintainer: Peter Crighton <PeteCrighton@gmail.com>
pkgname=python-hiyapyco
pkgver=0.4.6
pkgrel=1
pkgdesc="A Hierarchical Yaml Python Config"
arch=('any')
url="https://github.com/zerwes/hiyapyco"
license=('GPL3')
depends=('python-yaml' 'python-jinja')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/zerwes/hiyapyco/archive/release-$pkgver.tar.gz")
md5sums=('aa0fafb0198d511efd955a7eac18663a')

package() {
  cd "$srcdir/hiyapyco-release-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
