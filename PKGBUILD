# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=howdoi
pkgver=1.1.5
pkgrel=1
pkgdesc="A code search tool."
arch=(any)
url="https://github.com/gleitz/howdoi"
license=(MIT)
depends=('python2-pygments>=1.5'
         'python2-cssselect>=0.7.1'
         'python2-lxml>=3.2.4'
         'python2-pyquery>=1.2.6'
         'python2-requests>=2.0.1'
         'python2-requests-cache>=0.4.4')
makedepends=(python-distribute)
changelog=Changelog
conflicts=(${pkgname}-git)
source=("http://pypi.python.org/packages/source/h/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('3560daf244e8a12bc746c40655ca3254')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
