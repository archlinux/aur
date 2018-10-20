# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=howdoi
pkgver=1.1.13
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
md5sums=('2d4f9ae010d94a825a156bcb75503fff')
sha256sums=('96f5e057fd45a84379d77e46233165d95211e6b3ea869cb5c0df172aa322b566')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
