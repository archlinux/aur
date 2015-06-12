# Maintainer Simon Legner <Simon.Legner@gmail.com>

pkgname=soundcloud-syncer
pkgver=0.3.1
pkgrel=1
pkgdesc="Synchronize user's favorites tracks from soundcloud"
url="https://github.com/sliim/soundcloud-syncer"
depends=('python' 'python3-stagger-svn' 'python-pydub' 'python-dateutil' 'python-magic')
license=('GPLv3')
arch=('any')
source=("https://github.com/Sliim/$pkgname/archive/$pkgver.tar.gz")

build() {
    cd $srcdir/$pkgname-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}

sha1sums=('a8bd01503ba0c35b8ae0488fe8ebd9bfe6a8d4c6')
sha256sums=('ce963b7ed64a8edcf6325fc91b18195881588340e5135aa87148bb2c68646553')
md5sums=('13188f124ec49a5142485aaf1975b216')
