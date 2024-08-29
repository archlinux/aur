# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>

pkgname='docfd-bin'
_pkgname="${pkgname/-bin}"
pkgver=8.0.1
pkgrel=1
pkgdesc='TUI multiline fuzzy document finder (pre-compiled)'
arch=('x86_64')
url='https://github.com/darrenldl/docfd'
_rawurl='https://raw.githubusercontent.com/darrenldl/docfd/main'
license=('MIT')  # SPDX-License-Identifier: MIT
provides=("$_pkgname")
conflicts=("$_pkgname")
_flavour='linux'
source=(
  "$url/releases/download/$pkgver/$_pkgname-$pkgver-$_flavour.tar.gz"
  "$_rawurl/CHANGELOG.md"
  "$_rawurl/LICENSE"
  "$_rawurl/README.md"
)
changelog="$pkgname.changelog"

package() {
  install -vDm0755 -t "$pkgdir/usr/bin" \
    docfd
  install -vDm0644 -t "$pkgdir/usr/share/docs/$pkgname" \
    {CHANGELOG,README}.md
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE
}

sha256sums=(
  '06c50703408668f7d01b66067af1cf6f10ba60aec1ed99fd40cbcb8e7c301763'
  'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  '763ec1a97ce9ea46c7104dc52b20f0be104526144bebed5ffa0eb7897bae7e28852219309b443e0268867a922c1a152d12c81c6650feb4d6776b3f0bd2169811'
  'SKIP' 'SKIP' 'SKIP'
)

# eof
