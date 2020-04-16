# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='repotool'
pkgver=1.2.7
pkgrel=1
pkgdesc='An arch linux repository management tool'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('python')
source=("https://github.com/conqp/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('a20e6f950bbece6f6966c747443020a9218b38abfa65e9d7d8d06d8a7529cab2')


package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
