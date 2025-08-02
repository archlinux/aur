# Maintainer: Orion-zhen <https://github.com/Orion-zhen>

pkgname=ttf-douyin-sans
pkgver=1.0
pkgrel=1
pkgdesc="抖音美好体是抖音品牌创意中心推出的抖音官方字体, 具有完全知识产权且对外开源"
arch=("any")
url="https://github.com/bytedance/fonts"
license=("OFL")
depends=("fontconfig")

source=(https://github.com/bytedance/fonts/raw/refs/heads/main/DouyinSans/DouyinSansBold.ttf)
sha256sums=('fbecfacdfac33982774e301073a8d357a09c698cd3134bb6ddec0f5bfc268fa1')

package() {
    install -Dm 644 DouyinSansBold.ttf -t "${pkgdir}/usr/share/fonts/TTF"
}
