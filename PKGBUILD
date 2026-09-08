# Maintainer: willker <wz[dot]willker[at]gmail[dot]com>

pkgname=pcl-n-bin
pkgver=1.4.13
pkgrel=2
pkgdesc="一个基于 PCL-CE 开发的 Minecraft 启动器"
arch=('x86_64')
url="https://github.com/PCL-N-Edition/PCL-N"
license=('Apache-2.0')
depends=('dotnet-runtime-10.0' 'hicolor-icon-theme')
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/PCL_N_Release_linux-x64_NoRuntime_Installer.deb")
sha256sums=('35955df7da39acee259cd5ed1688f208ded9607cefd3d47df734913deff81c6d')
options=('!strip')

package() {
  cd "$srcdir"
  tar -xf data.tar.zst -C "$pkgdir"
}
