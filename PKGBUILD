# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=nwdiag
pkgver=1.0.4
pkgrel=1
pkgdesc="Generate network-diagram image files from spec-text files."
arch=(any)
url="http://blockdiag.com/en/nwdiag"
license=(APACHE)
depends=('python' 'blockdiag>=1.3.0')
optdepends=('python-reportlab: to use the PDF output format')
makedepends=(python-distribute)
changelog=Changelog
conflicts=('nwdiag-hg')
source=("http://pypi.python.org/packages/source/n/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('0d2ff1348aeff53aaf08838d0fa2c001')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
