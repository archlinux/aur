# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=pgweb-bin
pkgver=0.9.6
pkgrel=1
pkgdesc="Web-based PostgreSQL database browser written in Go"
arch=('i686' 'x86_64')
url="https://github.com/sosedoff/pgweb"
license=('MIT')
provides=("pgweb=${pkgver}")
conflicts=("pgweb")
source_i686=("bin_${pkgver}_386.zip::https://github.com/sosedoff/pgweb/releases/download/v${pkgver}/pgweb_linux_386.zip")
source_x86_64=("bin_${pkgver}_amd64.zip::https://github.com/sosedoff/pgweb/releases/download/v${pkgver}/pgweb_linux_amd64.zip")
md5sums_i686=('fa7769fecf3d6bfead547d37a14d2031')
md5sums_x86_64=('27da15513fd288f313fd56ffba8df2e9')
sha256sums_i686=('a5353a1af12f32509184a471cedbdbe872dd6f1ce9ca617df5a9623f268ea1f2')
sha256sums_x86_64=('550fb4bc628b51891a5fd5cfd48221999154343d0c2a9a4182b4151ff8464fe6')

package() {
  cd "$srcdir"
  install -Dm755 pgweb_linux_* "$pkgdir"/usr/bin/pgweb
}
