# Maintainer: BadBoy <luckmelove2@gmail.com>

pkgname=('rainfall')
pkgver=0.1
pkgrel=1
pkgdesc='A rainfall animation for CLI / unix terminals written in python.'
arch=('any')
license=('MIT')
url='https://github.com/alpin111/rainfall'
depends=('python>=3.10.4')

source=("git+${url}.git")

sha256sums=('SKIP')

package() {
    install -dm755 "${pkgdir}/usr/local/bin"
    install -Dm755 "${srcdir}/${pkgname}/source/rainfall.py" "${pkgdir}/usr/local/bin/${pkgname}"
}
