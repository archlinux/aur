# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='speculum'
pkgver=1.5.7
pkgrel=1
pkgdesc='Yet another mirror list optimization tool'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('python')
source=(${pkgname}-${pkgver}::"${url}/archive/${pkgver}.tar.gz")
sha256sums=('b3556c8c6837c169c66d048292a9a7ffe54b8e0ce1c55eae9f1d9430ea10b495')
backup=('etc/speculum.conf')


package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
