# Maintainer: Janicklin <Janicklin@users.noreply.github.com>
pkgname=claude-usage-waybar
pkgver=1.0.0
pkgrel=1
pkgdesc="Real-time Claude Code usage monitor for Waybar"
arch=('any')
url="https://github.com/Janicklin/claude-usage-waybar"
license=('MIT')
depends=('python>=3.8' 'waybar')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 claude-usage-waybar.py "${pkgdir}/usr/bin/claude-usage-waybar"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 waybar/config.jsonc "${pkgdir}/usr/share/${pkgname}/config.jsonc"
    install -Dm644 waybar/style.css "${pkgdir}/usr/share/${pkgname}/style.css"
}
