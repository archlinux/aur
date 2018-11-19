# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=actdiag
pkgver=0.5.4
pkgrel=2
pkgdesc="Generate activity-diagram image files from spec-text files."
arch=(any)
url="http://blockdiag.com/en/actdiag"
license=(APACHE)
depends=('python' 'blockdiag>=1.3.0')
optdepends=('python-reportlab: to use the PDF output format')
makedepends=(python-distribute)
changelog=Changelog
conflicts=('actdiag-hg')
source=("https://pypi.python.org/packages/source/a/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('d254a4dbac727ba7bee1b252e530cb3f')
sha1sums=('9beaa26802741f0474f0d33ea61bb55db01ad187')
sha256sums=('983071777d9941093aaef3be1f67c198a8ac8d2bba264cdd1f337ca415ab46af')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
