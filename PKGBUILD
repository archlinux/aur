# Maintainer: Xuepoo <xuepoofoter@gmail.com>
pkgname=agent-lx-music-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="A terminal-native music CLI replacing lx-music-desktop, powered by Agentic intelligence. (Pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/agent-lx-music"
license=('MIT')
provides=('agent-lx-music')
conflicts=('agent-lx-music')
source=("LICENSE-0.2.3::https://raw.githubusercontent.com/Xuepoo/agent-lx-music/v0.2.3/LICENSE")
source_x86_64=("alx-linux-x86_64-0.2.3::https://github.com/Xuepoo/agent-lx-music/releases/download/v0.2.3/alx-linux-x86_64")
source_aarch64=("alx-linux-aarch64-0.2.3::https://github.com/Xuepoo/agent-lx-music/releases/download/v0.2.3/alx-linux-aarch64")
sha256sums=('51b96fe87205eedde58a4da8fda83a5d23df4c3dfc54e7af76ecf430f9e50201')
sha256sums_x86_64=('7a60b3ba298d0c04e6ac6167bcb5dc74ffd8fd8d3615c4b736bd86e07e5c5168')
sha256sums_aarch64=('71d87a56c2e2b5506fe91f1007464cc342cb52778973a68f51ebb2220875baa1')

package() {
  install -Dm755 "$srcdir/alx-linux-$CARCH-0.2.3" "$pkgdir/usr/bin/alx"
  install -Dm644 "$srcdir/LICENSE-0.2.3" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
