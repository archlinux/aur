# Maintainer: Killian Prin-abeil <killian@archimedeos.org>
# Contributor: ArchimedeOS Development Team <hi@archimedeos.org>

pkgname=arch-shell
pkgver=0.2
pkgrel=1
pkgdesc="Outil pour créer des environnements chroot Arch jetables, façon nix-shell, basé sur devtools."
arch=('any')
url="https://github.com/0xbbuddha/arch-shell"
license=('MIT')
depends=('devtools' 'bash' 'rsync')
provides=('arch-shell')
backup=()
source=('arch-shell')
sha256sums=('78b0216c88a0ce7862a97b60bbd6c02efe178bdfc839e824390ca2b522628aad')

package() {
    install -Dm755 "${srcdir}/arch-shell" "${pkgdir}/usr/bin/arch-shell"

    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"

    echo "arch-shell v${pkgver}-${pkgrel}" > "${pkgdir}/usr/share/doc/${pkgname}/README"
    echo "=================================" >> "${pkgdir}/usr/share/doc/${pkgname}/README"
    echo "" >> "${pkgdir}/usr/share/doc/${pkgname}/README"
    echo "Outil pour créer des environnements chroot Arch jetables, façon nix-shell, basé sur devtools." >> "${pkgdir}/usr/share/doc/${pkgname}/README"
}
