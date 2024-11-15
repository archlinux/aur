# Maintainer: sga013
pkgname=television-bin
pkgver=0.4.21
pkgrel=1
pkgdesc="Television is a blazingly fast general purpose fuzzy finder TUI written in Rust."
arch=('x86_64')
url="https://github.com/alexpasmantier/television"
license=('MIT')
provides=('tv')
conflicts=('tv')
source_x86_64=("tv-v$pkgver-linux-$CARCH.tar.gz::https://github.com/alexpasmantier/television/releases/download/v$pkgver/tv-v$pkgver-linux-$CARCH.tar.gz")
sha256sums_x86_64=('7b65d628099a94039893c7d6491e2cc1e90a8c0f55853ee932f37388424c5117')



package() {
  install -Dm755 tv -t "$pkgdir/usr/bin"
}
