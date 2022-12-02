# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=fuzzynote-bin
_pkgname=fuzzynote
pkgver=0.25.5
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
  '1588bad7e1b8a76b90f20dfb5dff505f26569a4083ccd9d47b9554b6a89eedee'
)
sha512sums=(
  '93e71f42f8b2e38bf1a6641b75aa7f27ceae5b8d5d4390216c68ad0656098ada59d37dfca53a80aa350c251d3b2e2f41892e044779899f85d9670c2f851b3b1c'
)
b2sums=(
  '503be45b3bb5c19e5e5c841c36c52c43249022333d83bb019fe779c21dd1412c2eb65a176ec6c7faed22e019ad58bafc4833c2822b54a898ae4518d750daf881'
)

# eof
