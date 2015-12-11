# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Acothi

pkgname=pyxml
pkgname_=PyXML
pkgver=0.8.4
pkgrel=1
pkgdesc="Python XML, Dependency for selinux-refpolicy"
arch=('any')
url=http://downloads.sourceforge.net
source=http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname_-$pkgver.tar.gz
license=('GPL')
depends=('python2')
md5sums=('1f7655050cebbb664db976405fdba209')

package(){
cd "$pkgname_-$pkgver/"
python2 setup.py build
python2 setup.py install --root="$pkgdir/" --optimize=1
}

