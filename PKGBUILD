# Maintainer: motorrin
pkgname=arch-smart-update
pkgver=2.0.0
pkgrel=1
pkgdesc="Universal Smart Update Wrapper for Arch Linux and its derivatives"
arch=('any')
url="https://github.com/motorrin/Arch_Smart_Update"
license=('MIT')
depends=('bash' 'python' 'pacman' 'tar' 'gawk' 'coreutils' 'psmisc')
optdepends=('reflector: for Arch Linux mirror updates'
            'eos-rankmirrors: for EndeavourOS mirror updates'
            'yay: AUR helper support'
            'paru: AUR helper support'
            'topgrade: for comprehensive system updates')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('94297c4b50514f1961223332fafa7fdf1eebb8f70424400317dc3330f0a1eec6')

package() {
    cd "Arch_Smart_Update-${pkgver}"

    install -Dm755 "arch-smart-update" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
