# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=actdiag
pkgver=2.0.0
pkgrel=1
pkgdesc="Generate activity-diagram image files from spec-text files."
arch=(any)
url="http://blockdiag.com/en/actdiag"
license=(APACHE)
depends=('python' 'blockdiag>=2.0.0')
optdepends=('python-reportlab: to use the PDF output format')
makedepends=(python-distribute)
changelog=Changelog
conflicts=('actdiag-hg')
source=("https://pypi.python.org/packages/source/a/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('e955b9b919e137f10ff128d5d8817b2da660b121937cab3386a866a0bff08218b6e777e302a9130616228af6c357c463ceeb12cb95b8734928001d8ad6a90250')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
