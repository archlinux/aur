# Maintainer: AButton <Button0818@outlook.com>
# Maintainer: postyizhan <185839426@qq.com>
# Maintainer: LingXi9374 <yyr1919810@gmail.com>

pkgname='launcherx-bin'
_pkgname='LauncherX-bin'
pkgver='3.603.3241.0'
pkgrel=1
pkgdesc='LauncherX 是下一代 Minecraft 启动器'
arch=('x86_64')
url="https://corona.studio/lx"
provides=("launcherx")
conflicts=("launcherx-git")
options=(!strip)

source=(
    "${pkgname}-${pkgver}.zip::https://api.corona.studio/Build/get/68817072-c920-4868-96b2-3267c2db89cd/net10.0-linux.linux-x64.zip"
    "LauncherX.desktop"
    "LauncherX.png"
)
sha256sums=(
    'b394d85003b897ed9e417933203be178020bebba6de0af374573dfa072066329'
    '69ce33eded87b912eba61f23ebab5ce7a84554a8af7e29778662343a5019a449'
    '12603307fe2c60cbbab83fc761e465b2900c0593022340f1973b5adf59f88360'
)

package() {
    install -Dm755 "${srcdir}/LauncherX" "${pkgdir}/usr/bin/launcherx"
    install -Dm644 "LauncherX.desktop" "${pkgdir}/usr/share/applications/LauncherX.desktop"
    install -Dm644 "LauncherX.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/LauncherX.png"
}
