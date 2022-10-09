# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=fuzzynote-bin
_pkgname=fuzzynote
pkgver=0.25.3
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
  'a548477e9ab831caa8b06dfc54e6070a8ff9c36be0f2e2b69daf73c672f4dc4a'
)
sha512sums=(
  '9b0e86f08b6f02e979d1cc79596d2a0c59f53c4de04ca3d2e9b53c4e0f1e897be9867bc5702aa071921955beb623765220528a8df3a4589432c6e82f3b2bd58c'
)
b2sums=(
  '6ee7e84d92378fcddbbf4ffe5f7617171786472f9df3a065694a5d6a87887dd5f4fc140909105a53fff40c1801b425074eb6fb0eb972c4eab7de9d9d9ae89aa7'
)

# eof
