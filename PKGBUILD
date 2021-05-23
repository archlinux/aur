# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>
# Contributor: Jarek Sedlacek <jareksedlacek@gmail.com>

pkgname=pymetar
pkgver=1.2
pkgrel=1
pkgdesc="Downloads the weather report for a given station ID and decodes it"
arch=('any')
url="https://www.schwarzvogel.de/software/pymetar/"
license=('GPL2')
depends=('python')
makedepends=('python-setuptools')
source=("https://www.schwarzvogel.de/pkgs/$pkgname-$pkgver.tar.gz")
md5sums=('e79d21699617cfd2377e1820f9204600')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build 
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
