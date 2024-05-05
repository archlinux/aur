# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='docfd-bin'
_pkgname="${pkgname/-bin/}"
_flavour='ubuntu-latest'
pkgver=5.1.0
pkgrel=1
pkgdesc='TUI multiline fuzzy document finder (pre-compiled)'
arch=('x86_64')
url='https://github.com/darrenldl/docfd'
_rawurl='https://raw.githubusercontent.com/darrenldl/docfd/main'
license=('MIT')  # SPDX-License-Identifier: MIT
provides=('docfd')
conflicts=('docfd')
source=(
  "$url/releases/download/$pkgver/$_pkgname-$pkgver-$_flavour.tar.gz"
  "$_rawurl/CHANGELOG.md"
  "$_rawurl/LICENSE"
  "$_rawurl/README.md"
)
changelog="$pkgname.changelog"

package() {
  install -vDm0755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -vDm0644 -t "$pkgdir/usr/share/docs/$pkgname/" \
    {CHANGELOG,README}.md
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" \
    LICENSE
}

sha256sums=(
  '52e6dd20ee7fbad8d56e636cfe24ef3beaef45911659725e4ffbdb16e6eaffff'
  'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  '6f717ec4c79d0e0e547120dd2200a3288d60ec6d1651139a49e582ba8dd8dafa393bfe25194f39dc2de1a4bd5a29c6e07592c1c5b3cec968792b6173beb60ea6'
  'SKIP' 'SKIP' 'SKIP'
)

# eof
