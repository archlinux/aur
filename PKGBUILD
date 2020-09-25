# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='speculum'
pkgver=1.5.10
pkgrel=1
pkgdesc='Yet another mirror list optimization tool'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('python')
source=(${pkgname}-${pkgver}::"${url}/archive/${pkgver}.tar.gz")
sha256sums=('691cef0c2100d13fe83c0cd47faf6dfe124d8f28864c4a4e3229ca49a68de003')
backup=('etc/speculum.conf')


package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
