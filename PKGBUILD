# Maintainer: Simon Tas <simon.tas.st@gmail.com>

pkgname="python-dnspython1.16"
_pkgname="dnspython"
pkgver=1.16.0
pkgrel=1
pkgdesc='A DNS toolkit for Python'
arch=('any')
conflicts=( 'python-dnspython')
url="https://pypi.org/project/$_pkgname/$pkgver"
license=('Apache')
provides=('python-dnspython')
source=("https://files.pythonhosted.org/packages/ec/c5/14bcd63cb6d06092a004793399ec395405edf97c2301dfdc146dfbd5beed/$_pkgname-$pkgver.zip")
md5sums=('bc9ca3b3a82164667d5730ec6d5248a2')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    
    python setup.py install --root="${pkgdir}" --optimize=1
}
 
