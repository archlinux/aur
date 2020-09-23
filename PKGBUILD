# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='speculum'
pkgver=1.5.1
pkgrel=1
pkgdesc='Yet another mirror list optimization tool'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('python')
source=(${pkgname}-${pkgver}::"https://github.com/conqp/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('b2ab7a11d980e6f9269f1f247dc75e9773cc9c0464fa8a91772bd65b8796204f')


package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
