# Maintainer: willker <wz[dot]willker[at]gmail[dot]com>

pkgname=pcl-n-beta-bin
pkgver=1.4.7
pkgrel=1
pkgdesc="一个基于 PCL-CE 开发的 Minecraft 启动器"
arch=('x86_64')
url="https://github.com/PCL-N-Edition/PCL-N"
license=('Apache-2.0')
depends=('dotnet-runtime-10.0' 'hicolor-icon-theme' 'fontconfig')
conflicts=('pcl-n' 'pcl-n-bin')
source=("$url/releases/download/v$pkgver-beta/PCL_N_Beta_linux-x64_NoRuntime_installer.deb")
sha256sums=('028845290581b821484e495f73f7a396b6c2682e88ff38d5bb0adf8d55c05301')
options=('!strip')

package() {
  cd "$srcdir"
  tar -xf data.tar.zst -C "$pkgdir"
}
