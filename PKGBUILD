# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='speculum'
pkgver=1.5.3
pkgrel=1
pkgdesc='Yet another mirror list optimization tool'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('python')
source=(${pkgname}-${pkgver}::"${url}/archive/${pkgver}.tar.gz")
sha256sums=('dd0b0f611daafa3f017d0c9ce9a68055eb5af0787684b206f3a139f57e70fa03')
backup=('etc/speculum.conf')


package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
