# Maintainer: Killian Prin-abeil <killian@archimedeos.org>
# Contributor: ArchimedeOS Development Team <hi@archimedeos.org>

pkgname=arch-shell
pkgver=1.0
pkgrel=0
pkgdesc="Outil pour créer des environnements chroot Arch jetables, façon nix-shell, basé sur devtools."
arch=('any')
url="https://github.com/0xbbuddha/arch-shell"
license=('MIT')
depends=('devtools' 'bash' 'rsync')
provides=('arch-shell')
backup=()
source=('arch-shell')
sha256sums=('7c12df76738dfbd6179ffac9ec6e395f17bcee9aa729f0d47743ca56e5ad024f')

package() {
    install -Dm755 "${srcdir}/arch-shell" "${pkgdir}/usr/bin/arch-shell"

    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"

    echo "arch-shell v${pkgver}-${pkgrel}" > "${pkgdir}/usr/share/doc/${pkgname}/README"
    echo "=================================" >> "${pkgdir}/usr/share/doc/${pkgname}/README"
    echo "" >> "${pkgdir}/usr/share/doc/${pkgname}/README"
    echo "Outil pour créer des environnements chroot Arch jetables, façon nix-shell, basé sur devtools." >> "${pkgdir}/usr/share/doc/${pkgname}/README"
}