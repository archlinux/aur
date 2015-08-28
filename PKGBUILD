# Maintainer: Andreas Theodosiou <andreasabu at gmail dot com>
# Contributor: Jarek Sedlacek <jareksedlacek at gmail dot com>

pkgname=3to2
pkgver=1.0
pkgrel=4
pkgdesc="Script to convert python3 code to python2. Counterpart to 2to3"
arch=('any')
license=('Apache')
url='https://bitbucket.org/amentajo/lib3to2'
depends=('python2')
makedepends=('mercurial')
source=("https://bitbucket.org/amentajo/lib3to2/downloads/3to2-$pkgver.tar.gz")
noextract=()
md5sums=('c23a3841fdd5ca0493533c74d6c4de5c')



package() {
  cd "$srcdir/$pkgname-$pkgver"
  ./setup.py install --root=$pkgdir/ --optimize=1
}
