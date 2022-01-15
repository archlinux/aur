# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=nwdiag
pkgver=3.0.0
pkgrel=1
pkgdesc="nwdiag generates network-diagram image from text."
arch=(any)
url="https://pypi.org/project/nwdiag/"
license=(APACHE)
depends=('python'
         'blockdiag>=1.5.0'
         'python-funcparserlib')
optdepends=('python-reportlab: to use the PDF output format'
            'python-docutils: to use the RST output format')
makedepends=(python-distribute)
changelog=Changelog
source=("https://pypi.python.org/packages/source/n/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('01f48cfe8cc1624ae9653559d2eb2c50')
sha1sums=('ea5f42290cc3b1deb58259673e32b06daecc01d1')
sha256sums=('e267530fcaac8a1d9e7403048597ed30e031e17f0191569dc6f704087bacb2eb')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
