# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='docfd-bin'
_pkgname="${pkgname/-bin}"
_flavour='ubuntu-latest'
pkgver=6.0.0
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
  '9979ef80e28d03be9cbde7387dcec850255b815135ae93cced9d6d65fcef9eb1'
  'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  '8b7bc458da0d24de4e0fd36e85f850a2fb993f7704f85c60333ea75f05c36e2c7b39413cb235db70b8206d4c2b544adb4d2d7375fa4f6d941f9bd298a38abaa6'
  'SKIP' 'SKIP' 'SKIP'
)

# eof
