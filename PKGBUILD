# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=memex-bin
_pkgname=memex
pkgver=0.32.0
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
sha256sums_x86_64=('7a436d76b3ce442e7fbd9db8730faf9b0578e973d83709833657d00124cffd0c')
sha256sums_aarch64=('8f273c198336dfe7af057db69a0225e9398a3c3382c51928fd8b5508187a9809')

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
