# Maintainer: Xuepoo <xuepoofoter@gmail.com>
pkgname=agent-lx-music-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="A terminal-native music CLI replacing lx-music-desktop, powered by Agentic intelligence. (Pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/agent-lx-music"
license=('MIT')
provides=('agent-lx-music')
conflicts=('agent-lx-music')
source=("LICENSE-0.3.2::https://raw.githubusercontent.com/Xuepoo/agent-lx-music/v0.3.2/LICENSE")
source_x86_64=("alx-linux-x86_64-0.3.2::https://github.com/Xuepoo/agent-lx-music/releases/download/v0.3.2/alx-linux-x86_64")
source_aarch64=("alx-linux-aarch64-0.3.2::https://github.com/Xuepoo/agent-lx-music/releases/download/v0.3.2/alx-linux-aarch64")
sha256sums=('51b96fe87205eedde58a4da8fda83a5d23df4c3dfc54e7af76ecf430f9e50201')
sha256sums_x86_64=('643d130ec154dac7b5fc344488212daa7858d82120103c00bc872e7423c19b2b')
sha256sums_aarch64=('64c1a2146eb194ac1d85747150b4dd34d41f28f652ec7c7d9a2cc73602e9584d')

package() {
  install -Dm755 "$srcdir/alx-linux-$CARCH-0.3.2" "$pkgdir/usr/bin/alx"
  install -Dm644 "$srcdir/LICENSE-0.3.2" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
