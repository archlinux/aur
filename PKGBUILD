# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=flynn-cli
pkgver=20150430.0
pkgrel=1
pkgdesc="Flynn PaaS command-line interface"
url="https://flynn.io"
arch=('all')
license=(BSD)
source=("https://dl.flynn.io/cli")
noextract=('cli')
md5sums=('SKIP')

prepare() {
  zcat cli > flynn
}

package() {
  install -Dm755 "$srcdir/flynn" "$pkgdir/usr/bin/flynn"
}

# vim:set ts=2 sw=2 et:
