# Maintainer: Brod8362 <brod8362@gmail.com>

pkgname=python-libarchive
pkgver=0.4.7
pkgrel=1
pkgdesc="Python adapter for universal, libarchive-based archive access."
url="https://github.com/dsoprea/PyEasyArchive"
depends=('python' )
makedepends=('python3' )
license=('GPL 2')
arch=('any')
source=('https://files.pythonhosted.org/packages/bf/d4/26f5c9835d4d648e4f22b5fb91288457698e928aaf9d4ab7eff405b7ef03/libarchive-0.4.7.tar.gz')
md5sums=('63a9f80f57e94fce5a95110b0345597f')

build() {
    cd $srcdir/libarchive-0.4.7
    python setup.py build
}

package() {
    cd $srcdir/libarchive-0.4.7
    python setup.py install --root="$pkgdir" --optimize=1 
}
