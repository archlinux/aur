# Maintainer: Mohammadreza Khani <mohamadkhani14@gmail.com>
# This PKGBUILD is generated/updated by CI (see packaging/arch/publish-aur.sh).
# Hand-edits are fine but will be overwritten on the next tagged release.

pkgname=llm-leaders-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Rust CLI ranking coding LLMs by arena.ai WebDev Elo with live OpenRouter pricing"
arch=('x86_64')
url="https://github.com/mohamadkhani/llm-leaders"
license=('GPL-3.0-or-later')
depends=(
  'gcc-libs'
  'glibc'
  'openssl'
  'zlib'
  'brotli'
  'zstd'
)
provides=('llm-leaders')
conflicts=('llm-leaders')
source_x86_64=("https://github.com/mohamadkhani/llm-leaders/releases/download/v${pkgver}/llm-leaders-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
# Checksum is injected by CI from the built tarball (real b2sum, not SKIP).
b2sums_x86_64=('ca23f25cb9eec82837ffe2c6c050c037718496e4bc5a1dcac8c744f060aa00bc6d8d41295ad498f2b70c711b062df8c2fade5c90b05743d4d5c0046016be96c5')

package() {
  install -Dm755 "$srcdir/llm-leaders" "$pkgdir/usr/bin/llm-leaders"
  install -Dm644 "$srcdir/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
