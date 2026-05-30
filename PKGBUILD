# Maintainer: Xuepoo <xuepoofoter@gmail.com>
pkgname=agent-lx-music-bin
pkgver=0.2.6
pkgrel=1
pkgdesc="A terminal-native music CLI replacing lx-music-desktop, powered by Agentic intelligence. (Pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/agent-lx-music"
license=('MIT')
provides=('agent-lx-music')
conflicts=('agent-lx-music')
source=("LICENSE-0.2.6::https://raw.githubusercontent.com/Xuepoo/agent-lx-music/v0.2.6/LICENSE")
source_x86_64=("alx-linux-x86_64-0.2.6::https://github.com/Xuepoo/agent-lx-music/releases/download/v0.2.6/alx-linux-x86_64")
source_aarch64=("alx-linux-aarch64-0.2.6::https://github.com/Xuepoo/agent-lx-music/releases/download/v0.2.6/alx-linux-aarch64")
sha256sums=('51b96fe87205eedde58a4da8fda83a5d23df4c3dfc54e7af76ecf430f9e50201')
sha256sums_x86_64=('9892105314b4638b3f2f00f7b68d21e0008be5939812a24c1017fdb21ce55d67')
sha256sums_aarch64=('34ff7e5525d53eb14af850199c8fd1131d39542e5a383693be017b1cc57e4bea')

package() {
  install -Dm755 "$srcdir/alx-linux-$CARCH-0.2.6" "$pkgdir/usr/bin/alx"
  install -Dm644 "$srcdir/LICENSE-0.2.6" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
