# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=howdoi
pkgver=1.1.14
pkgrel=1
pkgdesc="A code search tool."
arch=(any)
url="https://github.com/gleitz/howdoi"
license=(MIT)
depends=('python-pygments>=2.2.0'
         'python-argparse>=1.4.0'
         'python-cssselect>=1.0.3'
         'python-lxml>=4.2.4'
         'python-pyquery>=1.4.0'
         'python-requests>=2.19.1'
         'python-requests-cache>=0.4.13')
makedepends=(python-distribute)
changelog=Changelog
conflicts=(${pkgname}-git)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('2dc1c4c17294d6edae7c5ac69f832694')
sha256sums=('b85b8e551bf47ff157392660f0fc5b9eb3eacb78516a5823f7b774ec61955db5')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
