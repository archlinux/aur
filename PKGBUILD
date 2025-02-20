# Maintainer: RX0FA <174369883+RX0FA@users.noreply.github.com>
pkgname=raptor-cage-bin
pkgver=1.0.2
pkgrel=1
pkgdesc='Run games in a secure sandbox'
url='https://github.com/RX0FA/raptor-cage'
source_x86_64=("https://github.com/RX0FA/raptor-cage/releases/download/1.0.2-2502201843/raptor-cage-1.0.2-2502201843.tgz")
arch=('x86_64')
license=('CIL-1.0')
depends=('bubblewrap' 'steam-native-runtime')
optdepends=('mangohud: vulkan overlay')
sha256sums_x86_64=('25908acbfc47694a35d5c053aa02bbb5dbf55ddb4b46a0c7911146caea7cfef5')

package() {
  cd "$srcdir/"
  install -Dm755 raptor-cage "${pkgdir}/usr/bin/rcage"
}
