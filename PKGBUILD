# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='speculum'
pkgver=1.4.2
pkgrel=1
pkgdesc='Yet another python mirror list tool'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('python')
makedepends=('git')
source=("git+${url}.git#tag=${pkgver}")
md5sums=('SKIP')


package() {
    cd "${pkgname}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
