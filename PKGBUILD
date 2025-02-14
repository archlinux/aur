# Maintainer: RX0FA <174369883+RX0FA@users.noreply.github.com>
pkgname=raptor-cage-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='Run Linux games in a secure sandbox'
url='https://github.com/RX0FA/raptor-cage'
source_x86_64=("https://github.com/RX0FA/raptor-cage/releases/download/1.0.0-250214-2f9d038/raptor-cage.tgz")
arch=('x86_64')
license=('CIL-1.0')
depends=('steam-native-runtime')
optdepends=('mangohud: vulkan overlay')
sha256sums_x86_64=('9096ebf3a84b5ea84e27b216379b9666b0ab244eaab8601652fd8341fa1d2081')

package() {
  cd "$srcdir/"
  install -Dm755 raptor-cage "${pkgdir}/usr/bin/raptor-cage"
}
