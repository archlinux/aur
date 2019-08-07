pkgname=smex
pkgver=2
pkgrel=1
pkgdesc="генератор смеха на питоне"
arch=('any')
license=("CUSTOM")
url="https://github.com/anar66/python-test/tree/master/tests"
source=("https://github.com/anar66/python-test/archive/master.zip")
sha256sums=('SKIP')
depends=('python' 'python-ptyprocess')
package(){
	cd $srcdir/python-test-master/tests
	install -Dm777 smex2.py $pkgdir/usr/local/bin/smex
}

