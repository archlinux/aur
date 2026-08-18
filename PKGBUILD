# Maintainer: Mohammadreza Khani <mohamadkhani14@gmail.com>
# This PKGBUILD is generated/updated by CI (see packaging/arch/publish-aur.sh).
# Hand-edits are fine but will be overwritten on the next tagged release.

pkgname=llm-leaders-bin
pkgver=0.1.0
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
b2sums_x86_64=('3375428bc85768ed12d399faf3a461d0613d02767db06817b3956bd8967231f223e154cb19de9d22411722b8e7911968b50a04e4ab368451d68f9f19873bdf71')

package() {
  install -Dm755 "$srcdir/llm-leaders" "$pkgdir/usr/bin/llm-leaders"
  install -Dm644 "$srcdir/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
