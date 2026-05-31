# Maintainer: Xuepoo <xuepoofoter@gmail.com>
pkgname=agent-lx-music-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="A terminal-native music CLI replacing lx-music-desktop, powered by Agentic intelligence. (Pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/agent-lx-music"
license=('MIT')
provides=('agent-lx-music')
conflicts=('agent-lx-music')
source=("LICENSE-0.3.3::https://raw.githubusercontent.com/Xuepoo/agent-lx-music/v0.3.3/LICENSE")
source_x86_64=("alx-linux-x86_64-0.3.3::https://github.com/Xuepoo/agent-lx-music/releases/download/v0.3.3/alx-linux-x86_64")
source_aarch64=("alx-linux-aarch64-0.3.3::https://github.com/Xuepoo/agent-lx-music/releases/download/v0.3.3/alx-linux-aarch64")
sha256sums=('51b96fe87205eedde58a4da8fda83a5d23df4c3dfc54e7af76ecf430f9e50201')
sha256sums_x86_64=('210b4609b252a73cf46a27198d24e0f11572e063c67e9435d38cdc97516040bf')
sha256sums_aarch64=('17d32d40b213a1e34b551edcdf3a05cf62af3e753c3ec6b6e0ef6b9efa5cadd3')

package() {
  install -Dm755 "$srcdir/alx-linux-$CARCH-0.3.3" "$pkgdir/usr/bin/alx"
  install -Dm644 "$srcdir/LICENSE-0.3.3" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
