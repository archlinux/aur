# Maintainer: Costa-exe <fcosentino.dev@.com>

pkgname=aur-taw
pkgver=1.0.1
pkgrel=1
pkgdesc="A minimalist, RAM-safe, opt-in AUR helper written in pure bash"
arch=('any')
url="https://github.com/Costa-exe/aur-taw"
license=('MIT')
depends=('bash' 'pacman' 'git' 'curl' 'jq' 'less')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1189149e5be55a0b8d0ce851d88b09ed99924ea61e980f1a644df3fc401dc7b7')

package() {
    cd "${pkgname}-${pkgver}"
    
    install -Dm755 aur-taw "${pkgdir}/usr/bin/aur-taw"
    
    install -Dm644 aur-taw-completion.bash "${pkgdir}/usr/share/bash-completion/completions/aur-taw"
    
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
