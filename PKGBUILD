# Maintainer: systemlayer <174369883+systemlayer@users.noreply.github.com>
pkgname=raptor-cage-bin
pkgver=1.0.7
pkgrel=2
pkgdesc='Run games in a secure sandbox'
url='https://github.com/systemlayer/raptor-cage'
source_x86_64=("https://github.com/systemlayer/raptor-cage/releases/download/1.0.7-2610021752/raptor-cage-1.0.7-2610021752.tgz")
arch=('x86_64')
license=('MIT')
depends=('bubblewrap' 'steam')
optdepends=('mangohud: vulkan overlay' 'gamescope: spoof resolutions and limit framerates')
sha256sums_x86_64=('2617a63fe433619da9b53e38d59877640b4a7b35f0f32d2f4dad5feb52663f0e')

package() {
  cd "$srcdir/"
  install -Dm755 rcage "${pkgdir}/usr/bin/rcage"
}
