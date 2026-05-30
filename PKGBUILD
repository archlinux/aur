# Maintainer: Xuepoo <xuepoofoter@gmail.com>
pkgname=agent-lx-music-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A terminal-native music CLI replacing lx-music-desktop, powered by Agentic intelligence. (Pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/agent-lx-music"
license=('MIT')
provides=('agent-lx-music')
conflicts=('agent-lx-music')
source=("LICENSE-0.3.0::https://raw.githubusercontent.com/Xuepoo/agent-lx-music/v0.3.0/LICENSE")
source_x86_64=("alx-linux-x86_64-0.3.0::https://github.com/Xuepoo/agent-lx-music/releases/download/v0.3.0/alx-linux-x86_64")
source_aarch64=("alx-linux-aarch64-0.3.0::https://github.com/Xuepoo/agent-lx-music/releases/download/v0.3.0/alx-linux-aarch64")
sha256sums=('51b96fe87205eedde58a4da8fda83a5d23df4c3dfc54e7af76ecf430f9e50201')
sha256sums_x86_64=('a7bbc49ca6b9f141b35796a643f11bfa1ec4a5d0515923c2df9faa2e1b54f31b')
sha256sums_aarch64=('3c24ad2b9661b8b4fa028897c512712e654a67915925d829f79709d2d9cb8489')

package() {
  install -Dm755 "$srcdir/alx-linux-$CARCH-0.3.0" "$pkgdir/usr/bin/alx"
  install -Dm644 "$srcdir/LICENSE-0.3.0" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
