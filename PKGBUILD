# Maintainer: rNoz <8237539+rNoz@users.noreply.github.com>
pkgname=tokensave-bin
pkgver=7.17.2
pkgrel=1
pkgdesc='Semantic code intelligence for AI coding agents'
arch=('x86_64' 'aarch64')
url='https://github.com/aovestdipaperino/tokensave'
license=('MIT')
depends=('glibc' 'libgcc')
provides=('tokensave')
conflicts=('tokensave')
options=('!strip')
source_x86_64=(
  "https://github.com/aovestdipaperino/tokensave/releases/download/v$pkgver/tokensave-v$pkgver-x86_64-linux.tar.gz"
)
sha256sums_x86_64=(
  'b5f651934a3babe0954d6290830854f172df479b2dcf509b2dfc05ceabc03b50'
)
source_aarch64=(
  "https://github.com/aovestdipaperino/tokensave/releases/download/v$pkgver/tokensave-v$pkgver-aarch64-linux.tar.gz"
)
sha256sums_aarch64=(
  '17a4715f9477cc4ca433e630ed0d8c9e5648444ad37d4875faebab5bac83f60e'
)
source=(
  "tokensave-license-$pkgver::https://raw.githubusercontent.com/aovestdipaperino/tokensave/v$pkgver/LICENSE"
)
sha256sums=(
  '08e7979abf9173c207753df084b5d94fa0cbe583a7cb6cbc20de5f973ee22aa0'
)

package() {
  install -Dm755 tokensave "$pkgdir/usr/bin/tokensave"
  install -Dm644 "tokensave-license-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
