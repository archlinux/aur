# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='speculum'
pkgver=1.5.0
pkgrel=1
pkgdesc='Yet another mirror list optimization tool'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('python')
source=(${pkgname}-${pkgver}::"https://github.com/conqp/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('3d0c5878844b212081a1471719407432eb0ea068bdc3c2feffd74fc10d77bc85')


package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
