# Maintainer: Real_Roller<931591847@qq.com>

pkgname=launcherx
pkgver=2.603.2040.0
pkgrel=1
pkgdesc='LauncherX is a cross-platform minecraft launcher for next generation'
arch=('x86_64')
url="https://corona.studio/launcherx"
provides=("launcherx")
conflicts=("launcherx-git")
options=(!strip)

source=(
  "https://api.corona.studio/Build/get/c4fce558-6332-43f1-8305-dda54857fb71/net9.0-linux.linux-x64.zip"
  "LauncherX.desktop"
  "LauncherX.png"
)
sha256sums=(
  'b43b6e8a324618bbcddddf554e7c2a684e5981c80761af0746e5b0adf2f2f6a4'
  'a181426a16fb04c37d008e8373385443542e616e22cdbf0368588ea874bda244'
  '12603307fe2c60cbbab83fc761e465b2900c0593022340f1973b5adf59f88360'
)

package() {
  install -Dm755 "${srcdir}/LauncherX.Avalonia" "${pkgdir}/usr/bin/launcherx"
  install -Dm644 "LauncherX.desktop" "${pkgdir}/usr/share/applications/LauncherX.desktop"
  install -Dm644 "LauncherX.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/LauncherX.png"
}
