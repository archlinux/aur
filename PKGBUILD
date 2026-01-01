# Maintainer: AButton <Button0818@outlook.com>
# Maintainer: postyizhan <185839426@qq.com>

pkgname='launcherx-bin'
_pkgname='LauncherX-bin'
pkgver='2.603.2877.0'
pkgrel=1
pkgdesc='LauncherX 是下一代 Minecraft 启动器'
arch=('x86_64')
url="https://corona.studio/lx"
provides=("launcherx")
conflicts=("launcherx-git")
options=(!strip)

source=(
    "${pkgname}-${pkgver}.zip::https://api.corona.studio/Build/get/8b44d83c-5e49-492e-a388-c30fa8d6edf7/net10.0-linux.linux-x64.zip"
    "LauncherX.desktop"
    "LauncherX.png"
)
sha256sums=(
    '98a505212c608638e872c03b2b3d56be0cac367a0d1ed2bfc9fe128a9f8a7631'
    '69ce33eded87b912eba61f23ebab5ce7a84554a8af7e29778662343a5019a449'
    '12603307fe2c60cbbab83fc761e465b2900c0593022340f1973b5adf59f88360'
)

package() {
    install -Dm755 "${srcdir}/LauncherX.Avalonia" "${pkgdir}/usr/bin/launcherx"
    install -Dm644 "LauncherX.desktop" "${pkgdir}/usr/share/applications/LauncherX.desktop"
    install -Dm644 "LauncherX.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/LauncherX.png"
}
