#Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgbase=('python-exifread')
pkgname=('python-exifread')
_module='ExifRead'
pkgver='2.1.2'
pkgrel=1
pkgdesc="Read Exif metadata from tiff and jpeg files."
url="https://github.com/ianare/exif-py"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/E/ExifRead/ExifRead-${pkgver}.tar.gz")
sha256sums=('79e244f2eb466709029e8806fe5e2cdd557870c3db5f68954db0ef548d9320ad')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
