# Maintainer: DIMFLIX <dimflix.official@gmail.com>
pkgname=nemo-tags
pkgver=1.0
pkgrel=1
pkgdesc="An extension for the Nemo file manager that adds a tagging system"
arch=('any')
url="https://github.com/meowrch/nemo-tags"
license=('GPL-3.0')
depends=('python' 'nemo-python')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b14f02a479effac386d1ea1b4e25b68f1e7e01441c464ad2a1cd1db0b321284e')

package() {
  cd "$srcdir/nemo-tags-$pkgver"
  python build.py
  install -Dm644 dist/nemo-tags.py "$pkgdir/usr/share/nemo-python/extensions/nemo-tags.py"
}

