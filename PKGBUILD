# Maintainer: Costa-exe <fcosentino.dev@.com>

pkgname=aur-taw
pkgver=1.0.0
pkgrel=1
pkgdesc="A minimalist, RAM-safe, opt-in AUR helper written in pure bash"
arch=('any')
url="https://github.com/Costa-exe/aur-taw"
license=('MIT')
depends=('bash' 'pacman' 'git' 'curl' 'jq' 'less')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b1ca8a33008b41503d702bee06664382e2c34d250154bc357bebf67897bb745c')

package() {
    cd "${pkgname}-${pkgver}"
    
    install -Dm755 aur-taw "${pkgdir}/usr/bin/aur-taw"
    
    install -Dm644 aur-taw-completion.bash "${pkgdir}/usr/share/bash-completion/completions/aur-taw"
    
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
