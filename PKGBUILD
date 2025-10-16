# Maintainer: RX0FA <174369883+RX0FA@users.noreply.github.com>
pkgname=raptor-cage-bin
pkgver=1.0.6
pkgrel=1
pkgdesc='Run games in a secure sandbox'
url='https://github.com/RX0FA/raptor-cage'
source_x86_64=("https://github.com/RX0FA/raptor-cage/releases/download/1.0.6-2510162027/raptor-cage-1.0.6-2510162027.tgz")
arch=('x86_64')
license=('CIL-1.0')
depends=('bubblewrap' 'steam-native-runtime')
optdepends=('mangohud: vulkan overlay' 'gamescope: spoof resolutions and limit framerates')
sha256sums_x86_64=('44ffdf4ccb99fcf44e23c671d697d6fabd2406f49cb927b7ff27af27e007a56f')

package() {
  cd "$srcdir/"
  install -Dm755 raptor-cage "${pkgdir}/usr/bin/rcage"
}
