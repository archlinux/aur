# Maintainer: AntoineGS
pkgname=waybar-ai-usage-go-bin
pkgver=0.2
pkgrel=1
pkgdesc="Waybar module showing Claude and Codex AI usage"
arch=('x86_64')
url="https://github.com/AntoineGS/waybar-ai-usage-go"
license=('MIT')
provides=('waybar-ai-usage')
conflicts=('waybar-ai-usage')
depends=('glibc')
source=("https://github.com/AntoineGS/waybar-ai-usage-go/releases/download/v${pkgver}/waybar-ai-usage_${pkgver}_linux_amd64.tar.gz")
sha256sums=('1bdc631ecc55fcb93cab9f329ecbb9004396e78615eb3d1edb6c43248c8b2330')

package() {
    install -Dm755 waybar-ai-usage "${pkgdir}/usr/bin/waybar-ai-usage"
}
