# Maintainer: Xuepoo <xuepoofoter@gmail.com>
pkgname=agent-lx-music-bin
pkgver=0.3.4
pkgrel=1
pkgdesc="A terminal-native music CLI replacing lx-music-desktop, powered by Agentic intelligence. (Pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/agent-lx-music"
license=('MIT')
provides=('agent-lx-music')
conflicts=('agent-lx-music')
source=("LICENSE-0.3.4::https://raw.githubusercontent.com/Xuepoo/agent-lx-music/v0.3.4/LICENSE")
source_x86_64=("alx-linux-x86_64-0.3.4::https://github.com/Xuepoo/agent-lx-music/releases/download/v0.3.4/alx-linux-x86_64")
source_aarch64=("alx-linux-aarch64-0.3.4::https://github.com/Xuepoo/agent-lx-music/releases/download/v0.3.4/alx-linux-aarch64")
sha256sums=('51b96fe87205eedde58a4da8fda83a5d23df4c3dfc54e7af76ecf430f9e50201')
sha256sums_x86_64=('4f03ab13836e465f53d4158405dc4ccc679d92db773089510ef56ca79e65e7e3')
sha256sums_aarch64=('0f424c5d15d9502c10a2ba1fa247cc23c1dab2f303699b8cac16053890265792')

package() {
  install -Dm755 "$srcdir/alx-linux-$CARCH-0.3.4" "$pkgdir/usr/bin/alx"
  install -Dm644 "$srcdir/LICENSE-0.3.4" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
