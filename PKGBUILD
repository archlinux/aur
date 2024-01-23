# Maintainer: OGrigorios <aur@giotas.io>

pkgname=lazysql
pkgver=0.1.5
pkgrel=1
pkgdesc="A cross-platform TUI database management tool written in Go"
arch=('x86_64' 'i386' 'aarch64')
url="https://github.com/jorgerojas26/lazysql"
license=('MIT')

source_x86_64=(${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/jorgerojas26/lazysql/releases/download/v${pkgver}/lazysql_Linux_x86_64.tar.gz)
source_aarch64=(${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/jorgerojas26/lazysql/releases/download/v${pkgver}/lazysql_Linux_arm64.tar.gz)
source_i386=(${pkgname}-${pkgver}-i3866.tar.gz::https://github.com/jorgerojas26/lazysql/releases/download/v${pkgver}/lazysql_Linux_i386.tar.gz)

sha256sums_x86_64=('6da32058ad7249c82244006f0a4b61ed23bae637e2cb839587a46000357c53f3')
sha256sums_i386=('3775bff04c7a1e829569d3148ede64fea55b17d8c21d5c8f0dcaa82e6253619a')
sha256sums_aarch64=('da2a9d2497f964821b915ef1c60628308b2f2b547803fde8684261259fae164f')

package() {
  cd "$srcdir"
  install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "lazysql" "$pkgdir/usr/bin/lazysql"
}

