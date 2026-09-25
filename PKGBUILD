# Maintainer: duanluan <duanluan@outlook.com>

pkgname=arch-cleaner-bin
_pkgname=arch-cleaner
pkgver=0.1.0
pkgrel=1
pkgdesc='Interactive TUI cleanup tool for Arch Linux (pacman cache, journal, user/AI-agent caches, large and duplicate files)'
arch=('x86_64')
url='https://github.com/duanluan/arch-cleaner'
license=('MIT')
depends=('glibc' 'pacman-contrib' 'systemd' 'findutils')
provides=('arch-cleaner')
conflicts=('arch-cleaner')
source=("${_pkgname}-v${pkgver}-x86_64-linux.tar.gz::https://github.com/duanluan/arch-cleaner/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-linux.tar.gz")
sha256sums=('c0fc4722e75d755547310c599306999a17b25a2c0365c980df1caee140c1803c')

package() {
    install -Dm755 "${srcdir}/arch-cleaner" "${pkgdir}/usr/bin/arch-cleaner"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
