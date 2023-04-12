# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='fuc-static-musl-bin'
pkgver=1.1.7
pkgrel=2
pkgdesc='Fast Unix Commands: Modern, performance focused unix commands (pre-compiled, statically linked to musl)'
arch=('x86_64')
url='https://github.com/SUPERCILEX/fuc'
license=('Apache')
provides=('cpz' 'fuc' 'rmz')
conflicts=('cpz' 'fuc' 'rmz')
source=(
  "cpz-$pkgver::$url/releases/download/$pkgver/cpz-x86_64-unknown-linux-musl"
  "rmz-$pkgver::$url/releases/download/$pkgver/rmz-x86_64-unknown-linux-musl"
)
noextract=(
  "cpz-$pkgver"
  "rmz-$pkgver"
)

package() {
  for exe in cpz rmz; do
    install -Dm0755 "$exe-$pkgver" "$pkgdir/usr/bin/$exe"
  done
}

sha256sums=(
  'b2d00c4c3616261d89368c3a4c85a09ba67b8a1d2b4b434555d2681014873187'
  '69160ab49d3ad1984e72bf5f95efa96cad750702d993fc398ab2c9da4321c982'
)
sha512sums=(
  '50338d82710f97d5bfb79e0f7f04c4ba6592014aa840ffc07a13fa8de283f304c4dfd8e8cf1a63777565243701ca0cd72efa1199b66a37fbe1acf73f41ff0aaa'
  '22a8798f1cc91ec254860cbb814ce157544b064e41d051d05f99a9023e1154a31e7e46b85e3978007d71315f570c27f327f0a9aa7a1e72239b360ecba61bd4c1'
)
b2sums=(
  '4db69309eae9e4dee08ea473692264bbf90ad28864182f58efc47fdcd337fc5d169927f8a627b0864c7af3cc419ba7af7de07fdf1baa9ab064486c9c4760c019'
  '646b09bb03078a3f97976d59f0b41c62d245de96b5392e3a3c07b0522dc5f98ca7a56429ce7bd904a6ca2367000bbd2037f226aa4dc4554328cf83725cf0e3bb'
)

# eof
