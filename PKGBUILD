# Maintainer: Xuepoo <xuepoofoter@gmail.com>
pkgname=agent-lx-music-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="A terminal-native music CLI replacing lx-music-desktop, powered by Agentic intelligence. (Pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/agent-lx-music"
license=('MIT')
provides=('agent-lx-music')
conflicts=('agent-lx-music')
source=("LICENSE-0.2.4::https://raw.githubusercontent.com/Xuepoo/agent-lx-music/v0.2.4/LICENSE")
source_x86_64=("alx-linux-x86_64-0.2.4::https://github.com/Xuepoo/agent-lx-music/releases/download/v0.2.4/alx-linux-x86_64")
source_aarch64=("alx-linux-aarch64-0.2.4::https://github.com/Xuepoo/agent-lx-music/releases/download/v0.2.4/alx-linux-aarch64")
sha256sums=('51b96fe87205eedde58a4da8fda83a5d23df4c3dfc54e7af76ecf430f9e50201')
sha256sums_x86_64=('ba84733ac5f455e3e9b0aa3d8f023662f09cf86caa38a4f896d9b8ffaa77f5c2')
sha256sums_aarch64=('e6abb6cab70580eb059372ec2fd1ee47fd614c8b344560f3e10fbc47c5884119')

package() {
  install -Dm755 "$srcdir/alx-linux-$CARCH-0.2.4" "$pkgdir/usr/bin/alx"
  install -Dm644 "$srcdir/LICENSE-0.2.4" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
