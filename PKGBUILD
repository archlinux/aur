# Maintainer: Killian Prin-abeil <killian@archimedeos.org>
# Contributor: ArchimedeOS Development Team <hi@archimedeos.org>

pkgname=arch-shell
pkgver=0.1
pkgrel=4
pkgdesc="Outil pour créer des environnements chroot Arch jetables, façon nix-shell, basé sur devtools."
arch=('any')
url="https://github.com/0xbbuddha/arch-shell"
license=('GPL3')
depends=('devtools' 'bash')
provides=('arch-shell')
backup=()
source=('arch-shell')
sha256sums=('031b1e6ad31926f67f48f066a7f1a7c76d96d66f9b2a35c68091e8667441ae76')

package() {
    install -Dm755 "${srcdir}/arch-shell" "${pkgdir}/usr/bin/arch-shell"

    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"

    echo "arch-shell v${pkgver}-${pkgrel}" > "${pkgdir}/usr/share/doc/${pkgname}/README"
    echo "=================================" >> "${pkgdir}/usr/share/doc/${pkgname}/README"
    echo "" >> "${pkgdir}/usr/share/doc/${pkgname}/README"
    echo "Outil pour créer des environnements chroot Arch jetables, façon nix-shell, basé sur devtools." >> "${pkgdir}/usr/share/doc/${pkgname}/README"
}
