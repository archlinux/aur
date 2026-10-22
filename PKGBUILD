# Maintainer: rNoz <8237539+rNoz@users.noreply.github.com>
pkgname=tokensave-bin
pkgver=7.16.0
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
  '783dcea8bb8b472982b497523ad912a5176b8d8e770d25592dc38b5f749ac7ea'
)
source_aarch64=(
  "https://github.com/aovestdipaperino/tokensave/releases/download/v$pkgver/tokensave-v$pkgver-aarch64-linux.tar.gz"
)
sha256sums_aarch64=(
  'b1b28daf21ea51f44ccfd1ea3101505d6db644a055cef261bcdb3beb8369d03f'
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
