# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=fuzzynote-bin
_pkgname=fuzzynote
pkgver=0.24.0
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

package() {
  cd "$srcdir" || exit 1

  install -Dm0755 fzn       "$pkgdir/usr/bin/fzn"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

sha256sums=(
  '649412f72c85a1426cfff243c16bb5c39248d0b0f2771963de8525f702cfaf7a'
)
sha512sums=(
  '605be48a38fdbd727ace8b687ca46108846d6c0f526fb56064caffc580f380a0080f4c961bc7c592a39e32c1d030eaf5f7975efadc767784327475f9e4970314'
)
b2sums=(
  '2ec2223385af15f088e032bb32694da63ed0e7ffb57a094e5990acad80e88e8bc0f6808859250a719b36fe4f6f41333ac4defc9a5ced99171d2a7474923a2a65'
)

# eof
