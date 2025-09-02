# Maintainer: RX0FA <174369883+RX0FA@users.noreply.github.com>
pkgname=raptor-cage-bin
pkgver=1.0.4
pkgrel=1
pkgdesc='Run games in a secure sandbox'
url='https://github.com/RX0FA/raptor-cage'
source_x86_64=("https://github.com/RX0FA/raptor-cage/releases/download/1.0.4-2509022009/raptor-cage-1.0.4-2509022009.tgz")
arch=('x86_64')
license=('CIL-1.0')
depends=('bubblewrap' 'steam-native-runtime')
optdepends=('mangohud: vulkan overlay')
sha256sums_x86_64=('1c1868d66da048036330419875d0909d31f8c51facbfb13bbe14a40a2dc04efc')

package() {
  cd "$srcdir/"
  install -Dm755 raptor-cage "${pkgdir}/usr/bin/rcage"
}
