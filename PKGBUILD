# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='docfd-bin'
_pkgname="${pkgname/-bin/}"
_flavour='ubuntu-latest'
pkgver=5.0.0
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
  '393ad40ac58375d51f025d087e7c6bdcf9195b292741eee078cf4df69c69fee4'
  'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  '6ae79a5a52ebd2d4e2c3c2466fdccffae8ca11dac50cdcb10f84cffd606e39c7453be8500d27c955ba013600973a1fd0e1e24c3fe08a7ffacd3314049782d88f'
  'SKIP' 'SKIP' 'SKIP'
)

# eof
