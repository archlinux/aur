# Maintainer: ansonlotiniat <你的Email>
pkgname=claudelytics-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="A CLI tool to analyze Claude Code usage patterns and token costs"
arch=('x86_64')
url="https://github.com/nwiizo/claudelytics"
license=('MIT')
provides=('claudelytics')
conflicts=('claudelytics')

# 已經根據你的截圖更新了精確的檔名
source=("https://github.com/nwiizo/claudelytics/releases/download/v${pkgver}/claudelytics-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('8718e9d6a5fea456d7a3a1de80deb465f06f21f08c22b5d5d354d66be447a717')

package() {
    # 將解壓縮出來的執行檔安裝到系統路徑
    install -Dm755 "${srcdir}/claudelytics" "${pkgdir}/usr/bin/claudelytics"
}
