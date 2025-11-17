# Maintainer: DIMFLIX <dimflix.official@gmail.com>
pkgname=nemo-tags
pkgver=1.0.1
pkgrel=1
pkgdesc="An extension for the Nemo file manager that adds a tagging system"
arch=('any')
url="https://github.com/meowrch/nemo-tags"
license=('GPL-3.0')
depends=('python' 'nemo-python')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b40d8215dc72ca3d1b21ba785349cd44647d9813f534e7911fe6558b6cb0a94c')

package() {
  cd "$srcdir/nemo-tags-$pkgver"
  python build.py
  install -Dm644 dist/nemo-tags.py "$pkgdir/usr/share/nemo-python/extensions/nemo-tags.py"
}

