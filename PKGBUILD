# Maintainer: Li Productions
pkgname=pytop
pkgver=1.0.1
pkgrel=2
pkgdesc="A beautiful, modern htop clone written in Python using Rich."
arch=('any')
url="https://github.com/goldstac/pytop"
license=('MIT')
depends=('python' 'python-rich' 'python-psutil')
makedepends=('git')
source=("git+${url}.git")
md5sums=('SKIP')

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 pytop.py "${pkgdir}/usr/bin/pytop"
    install -Dm644 pytop.desktop "${pkgdir}/usr/share/applications/pytop.desktop"
}
