# Maintainer: Xuepoo <xuepoofoter@gmail.com>
pkgname=agent-lx-music-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="A terminal-native music CLI replacing lx-music-desktop, powered by Agentic intelligence. (Pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/agent-lx-music"
license=('MIT')
provides=('agent-lx-music')
conflicts=('agent-lx-music')
source=("LICENSE-0.3.1::https://raw.githubusercontent.com/Xuepoo/agent-lx-music/v0.3.1/LICENSE")
source_x86_64=("alx-linux-x86_64-0.3.1::https://github.com/Xuepoo/agent-lx-music/releases/download/v0.3.1/alx-linux-x86_64")
source_aarch64=("alx-linux-aarch64-0.3.1::https://github.com/Xuepoo/agent-lx-music/releases/download/v0.3.1/alx-linux-aarch64")
sha256sums=('51b96fe87205eedde58a4da8fda83a5d23df4c3dfc54e7af76ecf430f9e50201')
sha256sums_x86_64=('c7ec48eb37ac5603c719062fbc9056faa0a40a81dea3ce13d17bf5fa56c89b01')
sha256sums_aarch64=('fbfa7cb833d6fd895b34913d092aeb5fc37b76fb04ddf2affa44240fc195552e')

package() {
  install -Dm755 "$srcdir/alx-linux-$CARCH-0.3.1" "$pkgdir/usr/bin/alx"
  install -Dm644 "$srcdir/LICENSE-0.3.1" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
