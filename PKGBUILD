# Maintainer: Ivan Maruca <ivan dot maruca at gmail dot com>
pkgname='auryn'
pkgver=0.0.2
pkgrel=1
pkgdesc='AUR Helper Installer'
arch=('x86_64')
license=('GPL')
depends=('git' 'sed' 'which' 'jq' 'curl')
source=('auryn.sh')
md5sums=('e67b5fd9450ecfe6fc440fbbedf50551')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    cp "${srcdir}/auryn.sh" "${pkgdir}/usr/bin/auryn"
    chmod +x "${pkgdir}/usr/bin/auryn"
}