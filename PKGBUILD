# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=fuzzynote-bin
_pkgname=fuzzynote
pkgver=0.20.0
pkgrel=1
pkgdesc='Terminal-based, CRDT-backed, local-first, collaborative note-taking'
arch=('x86_64')
url='https://github.com/Sambigeara/fuzzynote'
license=('unknown') # https://github.com/Sambigeara/fuzzynote/issues/73
provides=('fuzzynote')
conflicts=('fuzzynote')
source=(
  "$_pkgname-$pkgver.tar.gz::https://github.com/Sambigeara/fuzzynote/releases/download/v$pkgver/fuzzynote_${pkgver}_Linux_x86_64.tar.gz"
)
md5sums=(
  'bb144bf0bdb776ce4274ca95aedaac9d'
)
sha1sums=(
  'd7d7ba07bcbddd2a6626e40ece00d59ab97dfad1'
)
sha256sums=(
  '8c96925a519cacc43bb5846b62d148f875f3c3e6398e6ab9d9318a9cbab5d629'
)
sha512sums=(
  '1c0ed9f1b15409741785be251d5aa53d67a3b8b70f974a3f3949338182be187f72ce3741c9aa92ed32bc75d2095e00e3f7ad891c8f85ecbcb3ff03fa5feb2832'
)
b2sums=(
  '0536be067b3cd08020eea55c9b0df78ac19895773093d34a1cb988bfc376238fe3531ac66809c7e4f6d26a530ec6101aed7d497605067e49ff52a94324596f2a'
)

package() {
  cd "$srcdir" || exit 1

  install -Dm0755 fzn       "$pkgdir/usr/bin/fzn"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# eof
