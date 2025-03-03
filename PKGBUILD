# Maintainer: RX0FA <174369883+RX0FA@users.noreply.github.com>
pkgname=raptor-cage-bin
pkgver=1.0.3
pkgrel=1
pkgdesc='Run games in a secure sandbox'
url='https://github.com/RX0FA/raptor-cage'
source_x86_64=("https://github.com/RX0FA/raptor-cage/releases/download/1.0.3-2503031919/raptor-cage-1.0.3-2503031919.tgz")
arch=('x86_64')
license=('CIL-1.0')
depends=('bubblewrap' 'steam-native-runtime')
optdepends=('mangohud: vulkan overlay')
sha256sums_x86_64=('20102eadbb9d3b2a3133d7d6a77f508c99a5612bf38caae29207e9892b981c17')

package() {
  cd "$srcdir/"
  install -Dm755 raptor-cage "${pkgdir}/usr/bin/rcage"
}
