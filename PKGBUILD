#Maintainer: Jarek Sedlacek <jareksedlacek@gmail.com

pkgname=pymetar
pkgver=1.0
pkgrel=1
pkgdesc="downloads the weather report for a given station ID, decodes it and the provides easy access to all the data found in the report"
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
