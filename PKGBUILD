# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>

pkgname='docfd-bin'
_pkgname="${pkgname/-bin}"
_flavour='ubuntu-latest'
pkgver=6.0.1
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
  'cc0e68e2ae650efeae46e57c9d0c6c8bc607e9070829b9e6905ae8c5557d5c4e'
  'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  '013f1addb0136909e694d2779e08f0b895d215012c001c9a8d46dcf7f8101f50dd64fb0bdb43c09d92e5b63704584a218c3152016d5f3f2accbd8ba349737989'
  'SKIP' 'SKIP' 'SKIP'
)

# eof
