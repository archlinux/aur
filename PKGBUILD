pkgname=screenplain
pkgver=0.8.0
pkgrel=1
pkgdesc='Fountain parser with FDX, HTML and PDF backends'
arch=('any')
url='http://www.screenplain.com/'
license=('MIT')
depends=('python' 'python-six')
makedepends=('python-setuptools')
optdepends=('python-reportlab: PDF backend support')
source=("https://github.com/vilcans/screenplain/archive/${pkgver}.tar.gz")
sha256sums=('aef5e50bf4ea072c3d3a9384b66fe34a40e8d2d55ed226624aaabc226cec0d9a')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
    install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
