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
sha256sums=('e10b154cc8e70523880569704e485389c4965fd12d0b128b0372119aef1a8c90')

package() {
    install -Dm755 "${srcdir}/arch-shell" "${pkgdir}/usr/bin/arch-shell"

    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"

    echo "arch-shell v${pkgver}-${pkgrel}" > "${pkgdir}/usr/share/doc/${pkgname}/README"
    echo "=================================" >> "${pkgdir}/usr/share/doc/${pkgname}/README"
    echo "" >> "${pkgdir}/usr/share/doc/${pkgname}/README"
    echo "Outil pour créer des environnements chroot Arch jetables, façon nix-shell, basé sur devtools." >> "${pkgdir}/usr/share/doc/${pkgname}/README"
}
