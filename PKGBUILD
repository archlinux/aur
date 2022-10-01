# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=fuzzynote-bin
_pkgname=fuzzynote
pkgver=0.24.1
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
  'f220b364fe65aa13e6fa150c5fbc4c21922141f974823668efe6d9d0fef91237'
)
sha512sums=(
  '2631119f30b406eddf85b0ff66c407f90bc25500b4ce51164f910ff6b0dad8e84743da82a89d9409d166e8834e885b0f79adfbc317116acdbba74c12799466b8'
)
b2sums=(
  'dfc3b77f25bd955b1385ce1eaa492ae39291bb4db45bc92a4eb44d2c13f5aabb30f72bacba8e8edeb438076afce9fc4c8dac2a9d6a94f2ec350168cc8de6d87c'
)

# eof
