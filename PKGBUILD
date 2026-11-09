# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=memex-bin
_pkgname=memex
pkgver=0.33.0
pkgrel=1
pkgdesc="Search and resume Claude Code, Codex, Pi, OpenCode, Copilot and Cursor transcripts (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/nicosuave/memex"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++' 'openssl')
provides=('memex')
conflicts=('memex')
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/nicosuave/$_pkgname/v$pkgver/LICENSE")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/nicosuave/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver-linux-$CARCH.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/nicosuave/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver-linux-arm64.tar.gz")
sha256sums=('9a5ac0bc0f2967d314a6b4d69e503a90660b24ef145fc465d80b49906ddfd11b')
sha256sums_x86_64=('c26925d74cb7d14f83b4ec8019b0f17421ebe6398279ea19345cce4403514df3')
sha256sums_aarch64=('3bddb0052713965d46d2bf22d2477340420dfc45dba449698b8611d8df60d1d8')

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
