# Maintainer: Achilleas Pipinellis <axilleas archlinux gr>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>

pkgname=python2-ghp-import
_pkgname=ghp-import
pkgver=2.0.1
pkgrel=1
pkgdesc="Copy your docs directly to the gh-pages branch."
arch=(any)
url="http://github.com/davisp/ghp-import"
license=(APACHE)
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/g/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('7a1ad8d268c39c2ade28124651d81821')
