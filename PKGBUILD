# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='speculum'
pkgver=1.5.2
pkgrel=1
pkgdesc='Yet another mirror list optimization tool'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('python')
source=(${pkgname}-${pkgver}::"https://github.com/conqp/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('1ba9a8a1b4b2ad9b65812a3a612b1799383a78c0335cd27c4a2cc7b6d1c9c89b')


package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
