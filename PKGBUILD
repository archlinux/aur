# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>

pkgname='docfd-bin'
_pkgname="${pkgname/-bin}"
_flavour='ubuntu-latest'
pkgver=7.0.0
pkgrel=2
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
  '5954fd0a15f913d7d209c8c5328f16c20e98c1fd8a438f4049c7949776d1cfe3'
  'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  'c076b7f03c1b3c059cd589230897a3dc0f6587d8fe1b6f69b1bea28b80bfbf0eee4b8fb01983761c3c042f18c4b7fb80f8abffeafca76d7a961d05eb0f12c092'
  'SKIP' 'SKIP' 'SKIP'
)

# eof
