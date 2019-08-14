pkgname=smex
pkgver=2.1
pkgrel=3.2
pkgdesc="генератор смеха на питоне"
arch=('any')
license=("CUSTOM")
url="https://github.com/anar66/python-test/tree/master/tests"
source=("https://github.com/anar66/python-test/archive/master.zip")
sha256sums=('SKIP')
depends=('python' 'python-pyperclip')
package(){
	cd $srcdir/python-test-master/tests
	install -Dm777 smeh2.py $pkgdir/usr/bin/smeh
}

