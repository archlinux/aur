# Maintainer: Teo <minic6749@gmail.com>
pkgname=friendly-shell-manager
pkgver=1.2.0
pkgrel=1
pkgdesc="A clever, colorful and friendly hybrid shell wrapper written in Python"
arch=('any')
url="https://github.com/TeoCod3z/friendly-shell-manager"
license=('MIT')
depends=('python' 'python-colorama')
source=(https://github.com/TeoCod3z/friendly-shell-manager/archive/refs/tags/v1.2.0.tar.gz)
sha256sums=('SKIP')

package() {
    # Installa lo script rinominandolo in 'fsm' così l'utente lo lancia comodamente
    install -Dm755 "${srcdir}/friendly-shell-manager-${pkgver}/fsm" "${pkgdir}/usr/bin/fsm"
}
