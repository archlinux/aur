# Maintainer: Donald Webster <fryfrog@gmail.com
# Contributor: Andrew Rabert <arabert at nullsum dot net>

pkgname='python-enzyme'
_name=${pkgname#python-}
pkgver=0.5.0
pkgrel=1
pkgdesc="Python module to parse metadata in video files."
arch=(any)
url="https://github.com/Diaoul/enzyme"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
conflicts=(${pkgname}-git)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('fa8eadbb9cc5bcc18362496342b8d3f42398ed77ed42a51bf186665a4664050f6ef0dcfbbe7e4d5cfe2f0e1c5f19981a87780b3f8c1e2eeeaa47eaf7c0b55d5d')

package() {
  cd "${srcdir}/enzyme-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
