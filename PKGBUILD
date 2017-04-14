# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Acothi

pkgname=pyxml
pkgname_=PyXML
pkgver=0.8.4
pkgrel=2
pkgdesc="Python XML, Dependency for selinux-refpolicy"
arch=('any')
url=http://downloads.sourceforge.net
source=("https://github.com/actmd/${pkgname_}/archive/${pkgver}.tar.gz")
license=('GPL')
depends=('python2')
md5sums=('102ff038da5d9503de4e00974ccf8446')

build(){
cd "$pkgname_-$pkgver/"
python2 setup.py build
}

package(){
cd "$pkgname_-$pkgver/"
python2 setup.py install --root="$pkgdir/" --optimize=1
}

