# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='speculum'
pkgver=1.1.6
pkgrel=1
pkgdesc='Yet another python mirror list tool'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('python')
makedepends=('git')
source=("git+${url}.git#tag=${pkgver}")
md5sums=('SKIP')
pkgdir='pkg'
srcdir='src'


package() {
    install -Dm 755 "${pkgname}/speculum.py" "${pkgdir}/usr/bin/speculum"
}
