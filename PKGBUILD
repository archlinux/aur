# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='speculum'
pkgver=1.4.8
pkgrel=1
pkgdesc='Yet another mirror list optimization tool'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('python')
source=(${pkgname}-${pkgver}::"https://github.com/conqp/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('851d5f979c999560a9bd4c5f96eb11300f3b717354a0c2f80308c240d94b3e88')


package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
