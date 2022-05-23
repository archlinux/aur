# Maintainer: pappy <pa314159@users.noreply.github.com>
py_name=flask-assets
pkgname=python-$py_name
pkgver=2.0
pkgrel=1
pkgdesc="Asset management for Flask, to compress and merge CSS and Javascript files"
arch=(any)
url="https://flask-assets.readthedocs.io"
license=('BSD')
depends=('python' 'python-flask' 'python-webassets')
makedepends=('python-distribute')
source=("https://github.com/miracle2k/$py_name/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a0c6f8c2a2caa0f6b83a5878b594b3a8cbd0b47a45986ab514b8b9ac7d84b568')

package() {
  cd "$srcdir/$py_name-$pkgver"
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}

