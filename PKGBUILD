# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=fuzzynote-bin
_pkgname=fuzzynote
pkgver=0.25.2
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
  '88c9e682b24157135634d36b653d3ba5acf766616507692c7f25d7bb78688cc6'
)
sha512sums=(
  'b9a3fdd7dc9d63436bffbfd89a29bed9c8368ae41494c3b60b4df080d56a4d1a9042896737ce9242c8570175efb72d7124adb9584ad23a42260d6975d0061e3f'
)
b2sums=(
  'e1b4b026473697ea5442ec28ccd1f169730d226853980b9f78817651bd1185a933be4eece8c8f6c53472594deb747b9b7096f760fcea550fef05427172d6670b'
)

# eof
