# Maintainer: RX0FA <174369883+RX0FA@users.noreply.github.com>
pkgname=raptor-cage-bin
pkgver=1.0.6
pkgrel=2
pkgdesc='Run games in a secure sandbox'
url='https://github.com/RX0FA/raptor-cage'
source_x86_64=("https://github.com/RX0FA/raptor-cage/releases/download/1.0.6-2605081825/raptor-cage-1.0.6-2605081825.tgz")
arch=('x86_64')
license=('CIL-1.0')
depends=('bubblewrap' 'steam')
optdepends=('mangohud: vulkan overlay' 'gamescope: spoof resolutions and limit framerates')
sha256sums_x86_64=('4747df6d23d5718214b36b820fd3ee5b3be1e72d9cf61e3a8e405409aa978aaf')

package() {
  cd "$srcdir/"
  install -Dm755 raptor-cage "${pkgdir}/usr/bin/rcage"
}
