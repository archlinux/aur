# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='repotool'
pkgver=1.2.1
pkgrel=1
pkgdesc='An arch linux repository management tool'
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
