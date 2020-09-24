# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='speculum'
pkgver=1.5.6
pkgrel=1
pkgdesc='Yet another mirror list optimization tool'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('python')
source=(${pkgname}-${pkgver}::"${url}/archive/${pkgver}.tar.gz")
sha256sums=('f12077eedababc17e0b214e27da08a8247840f29dfb15862019a8addd2dfdce9')
backup=('etc/speculum.conf')


package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
