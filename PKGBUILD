# Maintainer: Ivan Maruca <ivan dot maruca at gmail dot com>
pkgname='auryn'
pkgver=0.0.4
pkgrel=1
pkgdesc='AUR Helper Installer'
arch=('x86_64')
license=('GPL')
depends=('git' 'sed' 'which' 'jq' 'curl')
source=('auryn.sh')
md5sums=('ba0cd6ef1c4a18c334892b1320503e6e')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    cp "${srcdir}/auryn.sh" "${pkgdir}/usr/bin/auryn"
    chmod +x "${pkgdir}/usr/bin/auryn"
}