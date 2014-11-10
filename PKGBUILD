
# Maintainer: Arvedui <arvedui@posteo.de>

pkgname=python-retrying
pkgver=1.3.2
pkgrel=1
pkgdesc="A general purpose Python retyring library"
arch=('any')
url="https://github.com/rholder/retrying/releases"
license=('Apache')
groups=()
depends=('python' 'python-six')
options=(!emptydirs)
source=(https://github.com/rholder/retrying/archive/v$pkgver.tar.gz)
md5sums=(47cabb34219837dc7341f53d693fc227)

package() {
  cd "$srcdir/retrying-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
