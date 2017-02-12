# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=ignore
pkgver=0.1.4
pkgrel=1
pkgdesc="Download .gitignore files for a given language."
arch=(any)
url="https://github.com/jarodl/ignore"
license=(MIT)
depends=(python2 python2-distribute)
changelog=Changelog
conflicts=(${pkgname}-git)
source=("http://pypi.python.org/packages/source/i/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('4b3d9ddf4675aa827ed5d1f6867ee444')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
