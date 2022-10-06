# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=fuzzynote-bin
_pkgname=fuzzynote
pkgver=0.25.0
pkgrel=1
pkgdesc='Terminal-based, CRDT-backed, local-first, collaborative note-taking (pre-compiled)'
arch=('x86_64')
url='https://github.com/Sambigeara/fuzzynote'
license=('AGPL3')
provides=('fuzzynote')
conflicts=('fuzzynote')
source=(
  "$_pkgname-$pkgver.tar.gz::https://github.com/Sambigeara/fuzzynote/releases/download/v$pkgver/fuzzynote_${pkgver}_Linux_x86_64.tar.gz"
)

package() {
  cd "$srcdir" || exit 1

  install -Dm0755 fzn       "$pkgdir/usr/bin/fzn"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

sha256sums=(
  '64bb875cc7091f629828dd2f4bcb2d725b1905603446770ade65b5801f34b52c'
)
sha512sums=(
  '1bbf7ec078f5a91f5262d6f1bf54bc3d4368bdd3f57d6fa1a68ed213e554a1d68d8fabecbb4d268a2878b22831e331b754d6cb32579157ecd21b0cbe17d99a01'
)
b2sums=(
  'a9d6d89f9bc53b532529c3e2cd325bf9bf72743bea7dab8d22e2cf07b333b3f06cc7e08e97a7a340543bef99e788417d811eabe6af6e0253e0a9a6c8021516d1'
)

# eof
