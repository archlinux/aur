# Maintainer: AntoineGS
pkgname=waybar-ai-usage-go-bin
pkgver=0.1
pkgrel=1
pkgdesc="Waybar module showing Claude and Codex AI usage"
arch=('x86_64')
url="https://github.com/AntoineGS/waybar-ai-usage-go"
license=('MIT')
provides=('waybar-ai-usage')
conflicts=('waybar-ai-usage')
depends=('glibc')
source=("https://github.com/AntoineGS/waybar-ai-usage-go/releases/download/v${pkgver}/waybar-ai-usage_${pkgver}_linux_amd64.tar.gz")
sha256sums=('42172ca84ff26f2f467125c8c337fb18f7969ff7fce1376e6b1e33bc0e818e97')

package() {
    install -Dm755 waybar-ai-usage "${pkgdir}/usr/bin/waybar-ai-usage"
}
