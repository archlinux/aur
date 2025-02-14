# Maintainer: RX0FA <174369883+RX0FA@users.noreply.github.com>
pkgname=raptor-cage-bin
pkgver=1.0.0
pkgrel=3
pkgdesc='Run games in a secure sandbox'
url='https://github.com/RX0FA/raptor-cage'
source_x86_64=("https://github.com/RX0FA/raptor-cage/releases/download/1.0.0-2502141658-878a68e/raptor-cage.tgz")
arch=('x86_64')
license=('CIL-1.0')
depends=('steam-native-runtime')
optdepends=('mangohud: vulkan overlay')
sha256sums_x86_64=('c52efcf722887431995e4e7a5006b0f745296708da15d13665a9586f8a218f12')

package() {
  cd "$srcdir/"
  install -Dm755 raptor-cage "${pkgdir}/usr/bin/raptor-cage"
}
