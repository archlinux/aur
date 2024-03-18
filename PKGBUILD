# Maintainer: OGrigorios <aur@giotas.io>

pkgname=lazysql
pkgver=0.1.8
pkgrel=1
pkgdesc="A cross-platform TUI database management tool written in Go"
arch=('x86_64' 'i386' 'aarch64')
url="https://github.com/jorgerojas26/lazysql"
license=('MIT')

source_x86_64=(${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/jorgerojas26/lazysql/releases/download/v${pkgver}/lazysql_Linux_x86_64.tar.gz)
source_aarch64=(${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/jorgerojas26/lazysql/releases/download/v${pkgver}/lazysql_Linux_arm64.tar.gz)
source_i386=(${pkgname}-${pkgver}-i3866.tar.gz::https://github.com/jorgerojas26/lazysql/releases/download/v${pkgver}/lazysql_Linux_i386.tar.gz)

sha256sums_x86_64=('4accae0e91691d35fbf9baa1c16095e9bf598340b2ca63d7426b6ba54c9783e1')
sha256sums_i386=('88a64816ca895eec0edcc29acf54572cde671ede9d0fa1b60311c5d572413dbb')
sha256sums_aarch64=('f480ca578606f05dcda38375f74c438377efe7ca0388c7ea97cbf2e29dd6ffe4')

package() {
  cd "$srcdir"
  install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "lazysql" "$pkgdir/usr/bin/lazysql"
}

