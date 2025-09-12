# Maintainer: Killian Prin-abeil <killian@archimedeos.org>
# Contributor: ArchimedeOS Development Team <hi@archimedeos.org>

pkgname=arch-shell
pkgver=0.1
pkgrel=5
pkgdesc="Outil pour créer des environnements chroot Arch jetables, façon nix-shell, basé sur devtools."
arch=('any')
url="https://github.com/0xbbuddha/arch-shell"
license=('GPL3')
depends=('devtools' 'bash')
provides=('arch-shell')
backup=()
source=('arch-shell')
sha256sums=('ceb09edfe4f59563be6103f080667e378af563d8d1f6107364db93f44ff8a497')

package() {
    install -Dm755 "${srcdir}/arch-shell" "${pkgdir}/usr/bin/arch-shell"

    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"

    echo "arch-shell v${pkgver}-${pkgrel}" > "${pkgdir}/usr/share/doc/${pkgname}/README"
    echo "=================================" >> "${pkgdir}/usr/share/doc/${pkgname}/README"
    echo "" >> "${pkgdir}/usr/share/doc/${pkgname}/README"
    echo "Outil pour créer des environnements chroot Arch jetables, façon nix-shell, basé sur devtools." >> "${pkgdir}/usr/share/doc/${pkgname}/README"
}
