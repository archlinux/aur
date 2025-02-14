# Maintainer: RX0FA <174369883+RX0FA@users.noreply.github.com>
pkgname=raptor-cage-bin
pkgver=1.0.0
pkgrel=2
pkgdesc='Run games in a secure sandbox'
url='https://github.com/RX0FA/raptor-cage'
source_x86_64=("https://github.com/RX0FA/raptor-cage/releases/download/1.0.0-2502141628-b939bd9/raptor-cage.tgz")
arch=('x86_64')
license=('CIL-1.0')
depends=('steam-native-runtime')
optdepends=('mangohud: vulkan overlay')
sha256sums_x86_64=('c42563bbb63b51ad8234d6850feb9b38dab3b5ebfd275a4901cb59b91f53e64a')

package() {
  cd "$srcdir/"
  install -Dm755 raptor-cage "${pkgdir}/usr/bin/raptor-cage"
}
