# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=memex-bin
_pkgname=memex
pkgver=0.34.0
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
sha256sums_x86_64=('41305ab7ba633e9578f2e48da8e6f4e9923dc6e9db93c56ee91c6072c77850cc')
sha256sums_aarch64=('ba685681cff19468ce35ab9449d47045c4f51723e2c7e9adf6177f4f751d1cfa')

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
