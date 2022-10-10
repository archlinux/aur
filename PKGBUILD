# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=fuzzynote-bin
_pkgname=fuzzynote
pkgver=0.25.4
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
  'a7404a74ef266d6ecb3f45bca33a0edef73d86bc18d044c2cf17a3a17259fcdf'
)
sha512sums=(
  '961207ca1d7e72ed5209c2166d13a17142ebc2489b79ea336a169a4d0bd96a9e9a8a72d5bba6a1f254d4451b18c57a3a66b573e2beb27210adbaa30907a692a6'
)
b2sums=(
  '2858c8628cd4abc065ddb833df9ea085de65faa555ad75ea663875402a8f75f58d92aa9179360691749251c4f74bc1d522c0a3f8728878985da004ee8979c02b'
)

# eof
