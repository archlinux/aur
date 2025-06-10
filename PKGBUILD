# Maintainer: postyizhan <185839426@qq.com>

pkgname='launcherx-bin'
_pkgname='LauncherX-bin'
pkgver='2.603.2435.0'
pkgrel=1
pkgdesc='LauncherX 是下一代 Minecraft 启动器'
arch=('x86_64')
url="https://corona.studio/launcherx"
provides=("launcherx")
conflicts=("launcherx-git")
options=(!strip)

source=(
    "${pkgname}-${pkgver}.zip::https://api.corona.studio/Build/get/344c111b-d982-4941-95a3-9becc12effac/net9.0-linux.linux-x64.zip"
    "LauncherX.desktop"
    "LauncherX.png"
)
sha256sums=(
    '9bd07ad8f9001cb9e1af82807fa7ba11056da85ac5f134293d5f65774fc8512e'
    '781f92bb10bfebef617a6026042cbe084d8b31b72176442f8a8d195c2128fc9c'
    '12603307fe2c60cbbab83fc761e465b2900c0593022340f1973b5adf59f88360'
)

package() {
    install -Dm755 "${srcdir}/LauncherX.Avalonia" "${pkgdir}/usr/bin/LauncherX.Avalonia"
    install -Dm644 "LauncherX.desktop" "${pkgdir}/usr/share/applications/LauncherX.desktop"
    install -Dm644 "LauncherX.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/LauncherX.png"
}
