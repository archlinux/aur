# Maintainer: Xuepoo <xuepoofoter@gmail.com>
pkgname=agent-lx-music-bin
pkgver=0.2.5
pkgrel=1
pkgdesc="A terminal-native music CLI replacing lx-music-desktop, powered by Agentic intelligence. (Pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/agent-lx-music"
license=('MIT')
provides=('agent-lx-music')
conflicts=('agent-lx-music')
source=("LICENSE-0.2.5::https://raw.githubusercontent.com/Xuepoo/agent-lx-music/v0.2.5/LICENSE")
source_x86_64=("alx-linux-x86_64-0.2.5::https://github.com/Xuepoo/agent-lx-music/releases/download/v0.2.5/alx-linux-x86_64")
source_aarch64=("alx-linux-aarch64-0.2.5::https://github.com/Xuepoo/agent-lx-music/releases/download/v0.2.5/alx-linux-aarch64")
sha256sums=('51b96fe87205eedde58a4da8fda83a5d23df4c3dfc54e7af76ecf430f9e50201')
sha256sums_x86_64=('7cd2f1591b52f3a3284069599a5a60b617287448ee6362715005a96e2007813a')
sha256sums_aarch64=('e1ce6135ba8b6311c3ab6929e0d945a45419a4b02d870eb9ae45dbfe1fdffa96')

package() {
  install -Dm755 "$srcdir/alx-linux-$CARCH-0.2.5" "$pkgdir/usr/bin/alx"
  install -Dm644 "$srcdir/LICENSE-0.2.5" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
