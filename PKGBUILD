# Maintainer: postyizhan <185839426@qq.com>

pkgname='launcherx-bin'
_pkgname='LauncherX-bin'
pkgver='2.603.1780.0'
pkgrel=1
pkgdesc='LauncherX 是下一代 Minecraft 启动器'
arch=('x86_64')
url="https://corona.studio/launcherx"
provides=("launcherx")
conflicts=("launcherx-git")
options=(!strip)

source=(
    "${pkgname}-${pkgver}.zip::https://api.corona.studio/Build/get/0e42ea3c-62df-44e4-b7a3-a04bf67c9d63/download:LauncherX-linux-x64@linux-x64.zip"
    "LauncherX.desktop"
    "LauncherX.png"
)
sha256sums=(
    '8e358b554bcf6c65e9c7666494a0f0a37c86d7e8a7acca1ea30c0f5f1ab3653d'
    'a181426a16fb04c37d008e8373385443542e616e22cdbf0368588ea874bda244'
    '12603307fe2c60cbbab83fc761e465b2900c0593022340f1973b5adf59f88360'
)

package() {
    install -Dm755 "${srcdir}/LauncherX.Avalonia" "${pkgdir}/usr/bin/LauncherX.Avalonia"
    install -Dm644 "LauncherX.desktop" "${pkgdir}/usr/share/applications/LauncherX.desktop"
    install -Dm644 "LauncherX.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/LauncherX.png"
}
