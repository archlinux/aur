# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=fuzzynote-bin
_pkgname=fuzzynote
pkgver=0.21.0
pkgrel=1
pkgdesc='Terminal-based, CRDT-backed, local-first, collaborative note-taking'
arch=('x86_64')
url='https://github.com/Sambigeara/fuzzynote'
license=('AGPL3')
provides=('fuzzynote')
conflicts=('fuzzynote')
source=(
  "$_pkgname-$pkgver.tar.gz::https://github.com/Sambigeara/fuzzynote/releases/download/v$pkgver/fuzzynote_${pkgver}_Linux_x86_64.tar.gz"
)
md5sums=(
  'a82636cc1e12c408394e6ba5e3bf7dc0'
)
sha1sums=(
  'abebbc60be3f141ac1836168cea2b40229aa5ecd'
)
sha256sums=(
  'a0d4bb9fcbe0f5e3f71a240c28b54df62795036374a2de3f72cf5cb313b9c7c6'
)
sha512sums=(
  '3f941bbbfc1a39f55e2aefe1bf523e5bdf47d938009b810776badd8e9ab049e9d74acc5c4af79a7064aea27e538bc4e6103d79bb5eef43a4e76c208cd89c6880'
)
b2sums=(
  'a86fd8fb2c31dcbd53efa738417d666269c95316d125e087b838af9cc8dccd65308c85e3b2886edef084b15e790ca06bc55ed8664b79077207a7325d4b0d71ef'
)

package() {
  cd "$srcdir" || exit 1

  install -Dm0755 fzn       "$pkgdir/usr/bin/fzn"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# eof
