# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='speculum'
pkgver=1.5.5
pkgrel=1
pkgdesc='Yet another mirror list optimization tool'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('python')
source=(${pkgname}-${pkgver}::"${url}/archive/${pkgver}.tar.gz")
sha256sums=('b313ee499f2388dc2b66d46de19b3924da81d49632c9eb5731c1781d51837cdb')
backup=('etc/speculum.conf')


package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
