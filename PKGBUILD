# Maintainer: duanluan <duanluan@outlook.com>

pkgname=tessoa
pkgver=0.27.0
pkgrel=1
pkgdesc='GPU-accelerated file manager with split panes, saved layouts, colored tags and multiple views'
arch=('x86_64')
url='https://tessoa.cn/'
license=('LicenseRef-Proprietary')
depends=('vulkan-icd-loader' 'vulkan-driver' 'libx11' 'libxcb' 'libxcursor' 'libxi' 'libxkbcommon' 'wayland' 'hicolor-icon-theme')
options=('!strip')
# upstream etag: "f9fd2ba2f7d5fbdc51f3a60b0d55cc66-2"
source=("tessoa-${pkgver}.tar.gz::https://download.tessoa.com/tessoa/latest/tessoa.tar.gz")
sha256sums=('d8ad9a55d8d8f3ec74fc8768ac7a0c06dd3e9d34724eb66091f6608ca4463518')

package() {
    install -Dm755 "${srcdir}/tessoa/tessoa" "${pkgdir}/usr/bin/tessoa"
    install -Dm644 "${srcdir}/tessoa/tessoa.desktop" "${pkgdir}/usr/share/applications/tessoa.desktop"
    install -Dm644 "${srcdir}/tessoa/tessoa.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/tessoa.png"
    install -Dm644 "${srcdir}/tessoa/THIRD-PARTY-NOTICES.html" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-NOTICES.html"
}
