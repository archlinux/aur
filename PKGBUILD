# Maintainer: Nikolas Koesling <nikolas@koesling.info>

pkgname=firewalld-services-games
pkgrel=1
pkgver=1.0.0
pkgdesc="Firewalld services for some games"
url="https://github.com/NikolasK-source/Firewalld_Games"
license=('MIT')
arch=('any')
depends=('firewalld')
source=("git+https://github.com/NikolasK-source/Firewalld_Games.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
    cd Firewalld_Games
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    cd services
    mkdir -p "${pkgdir}/usr/lib/firewalld/services"
    install -Dm644 * "${pkgdir}/usr/lib/firewalld/services"
}