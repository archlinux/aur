pkgname=('python-dockerpty')
srcname='dockerpty'
pkgver='0.3.4'
pkgrel='1'
pkgdesc='Pseudo-tty handler for docker Python client'
arch=('any')
url='https://github.com/d11wtq/dockerpty'
license=('Apache')

depends=('python' 'python-six')
makedepends=('git' 'python-setuptools')
provides=('python-dockerpty')
conflicts=('python-dockerpty')

source=("${srcname}::git+https://github.com/d11wtq/dockerpty.git#tag=v${pkgver}")
sha512sums=('SKIP')

package() {
    cd "${srcdir}/${srcname}"

    python setup.py install --root="${pkgdir}" --optimize=1
}
