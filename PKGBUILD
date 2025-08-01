# Maintainer: postyizhan <185839426@qq.com>

pkgname='launcherx-bin'
_pkgname='LauncherX-bin'
pkgver='2.603.2595.0'
pkgrel=1
pkgdesc='LauncherX 是下一代 Minecraft 启动器'
arch=('x86_64')
url="https://corona.studio/launcherx"
provides=("launcherx")
conflicts=("launcherx-git")
options=(!strip)

source=(
    "${pkgname}-${pkgver}.zip::https://api.corona.studio/Build/get/aa1e471d-9acb-4e1e-ba76-0ca72f90df6c/net9.0-linux.linux-x64.zip"
    "LauncherX.desktop"
    "LauncherX.png"
)
sha256sums=(
    'aa6d543eae3c9caf5e56fd2051758068a8831aef3c41882104241d8c7d32a493'
    '781f92bb10bfebef617a6026042cbe084d8b31b72176442f8a8d195c2128fc9c'
    '12603307fe2c60cbbab83fc761e465b2900c0593022340f1973b5adf59f88360'
)

package() {
    install -Dm755 "${srcdir}/LauncherX.Avalonia" "${pkgdir}/usr/bin/LauncherX.Avalonia"
    install -Dm644 "LauncherX.desktop" "${pkgdir}/usr/share/applications/LauncherX.desktop"
    install -Dm644 "LauncherX.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/LauncherX.png"
}
