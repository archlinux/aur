# Maintainer: Mohammadreza Khani <mohamadkhani14@gmail.com>
# This PKGBUILD is generated/updated by CI (see packaging/arch/publish-aur.sh).
# Hand-edits are fine but will be overwritten on the next tagged release.

pkgname=llm-leaders-bin
pkgver=0.7.1
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
b2sums_x86_64=('3f3eb8a3a49341443fa0d55b17d9d75034421b73c2be1331b7f0b55be430a5b1acf33ab53b4ead0ff4c0ba1a6789b4b2ca540c7738f3f4d625bf75c7fb30dcec')

package() {
  install -Dm755 "$srcdir/llm-leaders" "$pkgdir/usr/bin/llm-leaders"
  install -Dm644 "$srcdir/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
