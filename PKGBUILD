# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='mollyguardctl'
pkgver=1.3.0
pkgrel=1
pkgdesc='Guards your system from accidental reboots and shutdowns'
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
