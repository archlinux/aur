# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

_pkgname='atto'
pkgname="${_pkgname}-bin"
pkgver=1.2.0
pkgrel=1
pkgdesc='A tiny Nano wallet, focused on ease of use through simplicity'
arch=('x86_64')
url='https://github.com/codesoap/atto'
_rawurl='https://raw.githubusercontent.com/codesoap/atto'
license=('MIT')
provides=('atto')
conflicts=('atto')
source=(
  "$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/atto_${pkgver}_Linux_amd64.tar.gz"
  "LICENSE::$_rawurl/master/LICENSE"
  "README.md::$_rawurl/master/README.md"
)
md5sums=(
  '681e64a35a4b75fbc9b218fbca15bf15'
  'SKIP'
  'SKIP'
)
sha1sums=(
  '8df095aa8d05ea80c2d73bf0693ca4d616e71c89'
  'SKIP'
  'SKIP'
)
sha256sums=(
  '59e0e997638719e70baf9184eb91ccb22ee0a87d83307f0f596e1353dbcc6f9e'
  'SKIP'
  'SKIP'
)
sha512sums=(
  '7b7447852b978185610ec4b6a09d58212c8286db85f0bfca2c312c3463a8972ab9b527dbefc9b615c806325f3532a06ff4d7234d78573629366b4404d1c8d421'
  'SKIP'
  'SKIP'
)
b2sums=(
  'b0a6e90b8e2fbdc6d1e7cb4e418bdec40c63731ce7fd5212a8e53eaa2131f1868b264ec7e27a0b85b05557e52468373bf704023eb1100507ef1fda5a4ca160f7'
  'SKIP'
  'SKIP'
)

package() {
  cd "$srcdir" || exit 1

  install -Dm0755 atto      "$pkgdir/usr/bin/atto"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# eof
