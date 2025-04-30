# Maintainer: postyizhan <185839426@qq.com>

pkgname='launcherx-bin'
_pkgname='LauncherX-bin'
pkgver='2.603.2104.0'
pkgrel=1
pkgdesc='LauncherX 是下一代 Minecraft 启动器'
arch=('x86_64')
url="https://corona.studio/launcherx"
provides=("launcherx")
conflicts=("launcherx-git")
options=(!strip)

source=(
    "${pkgname}-${pkgver}.zip::https://api.corona.studio/Build/get/c94b3178-3fb5-4698-9835-7a5afac31f80/net9.0-linux.linux-x64.zip"
    "LauncherX.desktop"
    "LauncherX.png"
)
sha256sums=(
    '9cc1c8e69c9baf3853ad369ee090c6fa4e1607dace8acdabb7c49469763564fe'
    'a181426a16fb04c37d008e8373385443542e616e22cdbf0368588ea874bda244'
    '12603307fe2c60cbbab83fc761e465b2900c0593022340f1973b5adf59f88360'
)

package() {
    install -Dm755 "${srcdir}/LauncherX.Avalonia" "${pkgdir}/usr/bin/LauncherX.Avalonia"
    install -Dm644 "LauncherX.desktop" "${pkgdir}/usr/share/applications/LauncherX.desktop"
    install -Dm644 "LauncherX.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/LauncherX.png"
}
