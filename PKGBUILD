# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>
# Contributor: Jarek Sedlacek <jareksedlacek@gmail.com>

pkgname=pymetar
pkgver=1.0
pkgrel=1
pkgdesc="Downloads the weather report for a given station ID and decodes it"
arch=('any')
url="http://www.schwarzvogel.de/software-pymetar.shtml"
license=('GPL2')
depends=('python' )
source=("http://www.schwarzvogel.de/pkgs/$pkgname-$pkgver.tar.gz")
md5sums=('1b81f632b38a16e01f8969f630dd403a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build 
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
