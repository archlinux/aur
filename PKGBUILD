# Maintainer: AButton <Button0818@outlook.com>
# Maintainer: postyizhan <185839426@qq.com>
# Maintainer: LingXi9374 <yyr1919810@gmail.com>

pkgname='launcherx-bin'
_pkgname='LauncherX-bin'
pkgver='3.603.3167.0'
pkgrel=1
pkgdesc='LauncherX 是下一代 Minecraft 启动器'
arch=('x86_64')
url="https://corona.studio/lx"
provides=("launcherx")
conflicts=("launcherx-git")
options=(!strip)

source=(
    "${pkgname}-${pkgver}.zip::https://api.corona.studio/Build/get/8dfbb381-2f42-4e88-bf2a-0db4100494ae/net10.0-linux.linux-x64.zip"
    "LauncherX.desktop"
    "LauncherX.png"
)
sha256sums=(
    '0240375a2280b63e399d418f30ddfb2e5f780dfcf981cce1808a1a73e548a5de'
    '69ce33eded87b912eba61f23ebab5ce7a84554a8af7e29778662343a5019a449'
    '12603307fe2c60cbbab83fc761e465b2900c0593022340f1973b5adf59f88360'
)

package() {
    install -Dm755 "${srcdir}/LauncherX" "${pkgdir}/usr/bin/launcherx"
    install -Dm644 "LauncherX.desktop" "${pkgdir}/usr/share/applications/LauncherX.desktop"
    install -Dm644 "LauncherX.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/LauncherX.png"
}
