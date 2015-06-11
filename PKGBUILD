pkgname=python-flask-mail
_pkgname=Flask-Mail
pkgver=0.9.1
pkgrel=1
pkgdesc='A Flask extension for sending email messages. (python3 version)'
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/${_pkgname}"
license=('BSD')
depends=('python-flask' 'python-blinker')

source=("https://pypi.python.org/packages/source/F/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('04b35a42a44ec7aa724ec8ce55e2e08e')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1
}
