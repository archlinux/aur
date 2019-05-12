# Maintainer: Arvedui <arvedui@posteo.de>

pkgname=python-nc-dnsapi
pkgver=0.1.5
pkgrel=1
pkgdesc="A simple API wrapper for the netcup DNS API"
url="https://pypi.org/project/nc-dnsapi/"
makedepends=('python' 'python-setuptools')
depends=('python')
license=('GPL3')
arch=('any')
source=( "https://files.pythonhosted.org/packages/c9/3b/36691546246b0b4ef5cf53aadbc5be5d51a9321d063205be3ee4c2ea28de/nc_dnsapi-0.1.5.tar.gz")
sha256sums=('d5fbf3af77b46406d20cea2f84bcf91872424ba97e2bcf5f6d81e8696c4ef5c0')

build(){
    cd "$srcdir/nc_dnsapi-$pkgver"
    python setup.py build
}

package(){
    cd "$srcdir/nc_dnsapi-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
