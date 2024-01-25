# Maintainer: OGrigorios <aur@giotas.io>

pkgname=lazysql
pkgver=0.1.6
pkgrel=1
pkgdesc="A cross-platform TUI database management tool written in Go"
arch=('x86_64' 'i386' 'aarch64')
url="https://github.com/jorgerojas26/lazysql"
license=('MIT')

source_x86_64=(${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/jorgerojas26/lazysql/releases/download/v${pkgver}/lazysql_Linux_x86_64.tar.gz)
source_aarch64=(${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/jorgerojas26/lazysql/releases/download/v${pkgver}/lazysql_Linux_arm64.tar.gz)
source_i386=(${pkgname}-${pkgver}-i3866.tar.gz::https://github.com/jorgerojas26/lazysql/releases/download/v${pkgver}/lazysql_Linux_i386.tar.gz)

sha256sums_x86_64=('55b7c0dbffa94fd6e7dfad46043db86bf44d0390f6735c11203fcdb45e4917fe')
sha256sums_i386=('c4cc6edcf493cf0fab5e67878946b24a223ecaf574ad12b262fd1940ee3947a5')
sha256sums_aarch64=('a15a9de459e8ed02db1bbb4c64a2c8cef0ab6f2433d4bfdc95a969d9bd3be282')

package() {
  cd "$srcdir"
  install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "lazysql" "$pkgdir/usr/bin/lazysql"
}

