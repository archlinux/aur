# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='repotool'
pkgver=1.2.6
pkgrel=1
pkgdesc='An arch linux repository management tool'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('python')
source=("https://github.com/conqp/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('d1881ba5a5cbd04246305a38a4d48f4e80767cf8b8729850aaf500e3ea292c68')


package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
