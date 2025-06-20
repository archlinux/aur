# Maintainer: Zaman Huseynli <zamanhuseynli23@gmail.com>
# Backup contact: admin@azccriminal.space
pkgname=colorsearch
pkgver=1.0.0
pkgrel=2
pkgdesc="Search files by name and dominant color in images and videos"
arch=('x86_64')
url="https://github.com/Zamanhuseyinli/colorsearch"
license=('GPL3')
depends=('python' 'python-pyqt6' 'python-pillow')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/Zamanhuseyinli/colorsearch.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/colorsearch"
    git describe --tags --abbrev=0 2>/dev/null || echo "1.0.0"
}

package() {
    cd "$srcdir/colorsearch"
    python setup.py install --root="$pkgdir" --optimize=1
}
