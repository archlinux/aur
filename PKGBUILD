# Maintainer: Xuepoo <xuepoofoter@gmail.com>
pkgname=agent-lx-music-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A terminal-native music CLI replacing lx-music-desktop, powered by Agentic intelligence. (Pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/agent-lx-music"
license=('MIT')
provides=('agent-lx-music')
conflicts=('agent-lx-music')
source=("LICENSE-0.4.0::https://raw.githubusercontent.com/Xuepoo/agent-lx-music/v0.4.0/LICENSE")
source_x86_64=("alx-linux-x86_64-0.4.0::https://github.com/Xuepoo/agent-lx-music/releases/download/v0.4.0/alx-linux-x86_64")
source_aarch64=("alx-linux-aarch64-0.4.0::https://github.com/Xuepoo/agent-lx-music/releases/download/v0.4.0/alx-linux-aarch64")
sha256sums=('51b96fe87205eedde58a4da8fda83a5d23df4c3dfc54e7af76ecf430f9e50201')
sha256sums_x86_64=('6bd510de2906ab731074cff35ceedbd6347f2536d54f0bc09e7fa1ae6fba8d6b')
sha256sums_aarch64=('94937acb6e5024132fe0d78a34f2affc6c9a18343b1b5ef9326b4eb691a27325')

package() {
  install -Dm755 "$srcdir/alx-linux-$CARCH-0.4.0" "$pkgdir/usr/bin/alx"
  install -Dm644 "$srcdir/LICENSE-0.4.0" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
