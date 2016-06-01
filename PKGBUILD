# Maintainer: Mike Nagie <echo 'cHJvbWlrZTE5ODdAZ21haWwuY29tCg==' | base64 -d>
pkgname=python-otr
pkgver=1.2.0
pkgrel=1
pkgdesc="Off-The-Record Messaging protocol implementation for Python"
arch=(any)
url="https://github.com/AGProjects/python-otr"
license=('LGPL')
depends=('python2')
#makedepends=()
source=("https://github.com/AGProjects/$pkgname/archive/master.zip")
 
md5sums=('0d9d7f148f5ed4d0cad8c94f44a4b172')
 
 
 
build() {
    cd "$pkgname-master"
    python2 setup.py build
}
 
package() {
    cd "$pkgname-master"
    python2 setup.py install --prefix=/usr --root="${pkgdir}"
}
