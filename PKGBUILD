# Maintainer: Real_Roller<931591847@qq.com>

pkgbase=launcherx-cn-fix
pkgname=launcherx-cn-fix
pkgver=2.603.2040.0
pkgrel=1
pkgdesc='LauncherX is a cross-platform minecraft launcher for next generation'
arch=('x86_64' 'aarch64')
url="https://corona.studio/launcherx"
provides=("launcherx-cn-fix")
conflicts=("launcherx-git" "launcherx-bin" "launcherx")
options=(!strip)

source=(
  "LauncherX.desktop"
  "LauncherX.png"
  "launcherx"
)
source_x86_64=(
  "https://api.corona.studio/Build/get/033e6779-fddb-40c9-a036-20a3f007f4c6/net9.0-linux.linux-x64.zip"
)
source_aarch64=(
  "https://api.corona.studio/Build/get/e3c90a12-7597-4fc6-b34e-5eddf3364f10/net9.0-linux.linux-arm64.zip"
)

sha256sums=('4642b257b15093e87ba0de07ef029f43ff7506e80d1f13afbbc8e2d0de34912f'
            '12603307fe2c60cbbab83fc761e465b2900c0593022340f1973b5adf59f88360'
            '5c54c3f69f39598d871aed02eb965923ad6382d6cfd3eb461fbf97c8c8a75a03')
sha256sums_x86_64=('88f1d55eefdc634a877a9a2164f29f0ebcbed671f9dff3501650ee243fddb4ef')
sha256sums_aarch64=('6599327b280b47ef62ae09ea57c64f80ddec1e77ba7267c1d4f6b7817fcad6b8')


package() {
  install -Dm755 "${srcdir}/LauncherX.Avalonia" "${pkgdir}/usr/bin/LauncherX.Avalonia"
  install -Dm755 "${srcdir}/launcherx" "${pkgdir}/usr/bin/launcherx"
  install -Dm644 "LauncherX.desktop" "${pkgdir}/usr/share/applications/LauncherX.desktop"
  install -Dm644 "LauncherX.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/LauncherX.png"
}
