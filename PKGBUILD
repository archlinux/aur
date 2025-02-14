# Maintainer: RX0FA <174369883+RX0FA@users.noreply.github.com>
pkgname=raptor-cage-bin
pkgver=1.0.1
pkgrel=2
pkgdesc='Run games in a secure sandbox'
url='https://github.com/RX0FA/raptor-cage'
source_x86_64=("https://github.com/RX0FA/raptor-cage/releases/download/1.0.1-2502141836-661a575/raptor-cage-1.0.1-2502141836-661a575.tgz")
arch=('x86_64')
license=('CIL-1.0')
depends=('bubblewrap' 'steam-native-runtime')
optdepends=('mangohud: vulkan overlay')
sha256sums_x86_64=('99c8e2cd6100604dab6355d310ad65c3e0ec6a90bc19977726c81719452d7233')

package() {
  cd "$srcdir/"
  install -Dm755 raptor-cage "${pkgdir}/usr/bin/rcage"
}
