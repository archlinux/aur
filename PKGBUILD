# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

_pkgname='atto'
pkgname="${_pkgname}-bin"
pkgver=1.2.1
_release=1.3.0
pkgrel=1
pkgdesc='A tiny Nano wallet, focused on ease of use through simplicity'
arch=('x86_64')
url='https://github.com/codesoap/atto'
_rawurl='https://raw.githubusercontent.com/codesoap/atto'
license=('MIT')
provides=('atto')
conflicts=('atto')
source=(
  "$pkgname-$pkgver.tar.gz::$url/releases/download/v$_release/atto_${pkgver}_Linux_amd64.tar.gz"
  "LICENSE::$_rawurl/master/LICENSE"
  "README.md::$_rawurl/master/README.md"
)
md5sums=(
  '42ddb0132fa20f4249889402bc10fb7b'
  'SKIP'
  'SKIP'
)
sha1sums=(
  'db76ad30de4edf296d1d47c130bfcc8f0c640bf8'
  'SKIP'
  'SKIP'
)
sha256sums=(
  '79dd0e2ed8d6cd5c85fea83b015f2416f1267baf0d97f58e7890749968e867f7'
  'SKIP'
  'SKIP'
)
sha512sums=(
  'aebff41fa26881d12f3a5c7d95c1f0bd5a83f183388440ad66f407c4e58dd3643b0d0a7544afe03deedcd770f6c6b4470085f128fdc0414e0a045dbca07b9d02'
  'SKIP'
  'SKIP'
)
b2sums=(
  '4b8db1762eda6c48c5ffdd4316265af6a823ff90237f4a45b8e315f128394ae1d77454e0fb848ce12403a6790963e53fab7b3a0c7b5824206fdbb8ecdf5dd49a'
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
