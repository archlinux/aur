# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=nwdiag
pkgver=2.0.0
pkgrel=1
pkgdesc="Generate network-diagram image files from spec-text files."
arch=(any)
url="http://blockdiag.com/en/nwdiag"
license=(APACHE)
depends=('python'
         'blockdiag>=1.5.0'
         'python-funcparserlib')
optdepends=('python-reportlab: to use the PDF output format'
            'python-docutils: to use the RST output format')
makedepends=(python-distribute)
changelog=Changelog
source=("https://pypi.python.org/packages/source/n/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('82975c822cc8052a73fb0c9ba8896d56')
sha1sums=('472a3c6a845f81c31c331068de6884d6a78be600')
sha256sums=('5cd7fafd6085cd762ca9171234d07d2a33c6e81f5c66a1b233992e76300d74e2')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
