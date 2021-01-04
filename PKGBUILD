# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='speculum'
pkgver=1.6.6
pkgrel=1
pkgdesc='Yet another mirror list optimization tool'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
makedepends=('git' 'python' 'python-setuptools' 'python-setuptools-git')
depends=('python')
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')
backup=('etc/speculum.conf')


package() {
    cd "${srcdir}/${pkgname}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
