# Maintainer: Ivan Maruca <ivan dot maruca at gmail dot com>
pkgname='auryn'
pkgver=0.0.3
pkgrel=1
pkgdesc='AUR Helper Installer'
arch=('x86_64')
license=('GPL')
depends=('git' 'sed' 'which' 'jq' 'curl')
source=('auryn.sh')
md5sums=('00daa7a333a37e7757adb6dcdd24ff0e')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    cp "${srcdir}/auryn.sh" "${pkgdir}/usr/bin/auryn"
    chmod +x "${pkgdir}/usr/bin/auryn"
}