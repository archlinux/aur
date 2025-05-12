# Maintainer: Real_Roller<931591847@qq.com>

pkgbase=launcherx
pkgname=launcherx
pkgver=2.603.2254.0
pkgrel=1
pkgdesc='LauncherX is a cross-platform minecraft launcher for next generation'
arch=('x86_64')
url="https://corona.studio/launcherx"
provides=("launcherx")
conflicts=("launcherx-git")
options=(!strip)

source=(
  "https://api.corona.studio/Build/get/8cddf076-36d6-41f7-9cfa-bcd430e41ac6/net9.0-linux.linux-x64.zip"
  "LauncherX.desktop"
  "LauncherX.png"
)
sha256sums=(
  'SKIP'
  '3c4421b5b7ffbab89a8950c793d09d6b6261f49cfd0feba3b349ab79c295d082'
  '12603307fe2c60cbbab83fc761e465b2900c0593022340f1973b5adf59f88360'
)

package() {
  install -Dm755 "${srcdir}/LauncherX.Avalonia" "${pkgdir}/usr/bin/launcherx"
  install -Dm644 "LauncherX.desktop" "${pkgdir}/usr/share/applications/LauncherX.desktop"
  install -Dm644 "LauncherX.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/LauncherX.png"
}
