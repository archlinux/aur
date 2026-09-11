# Maintainer: Mohammadreza Khani <mohamadkhani14@gmail.com>
# This PKGBUILD is generated/updated by CI (see packaging/arch/publish-aur.sh).
# Hand-edits are fine but will be overwritten on the next tagged release.

pkgname=llm-leaders-bin
pkgver=0.7.0
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
b2sums_x86_64=('37c4355c4f8e447a7981ec6f7731b341c99c0f28522f02dda551522418b3cb8c895b437471c48730356718e24105115255a50bd55c6241a5be37391e677dccba')

package() {
  install -Dm755 "$srcdir/llm-leaders" "$pkgdir/usr/bin/llm-leaders"
  install -Dm644 "$srcdir/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
