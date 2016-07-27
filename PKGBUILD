# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=pgweb-bin
pkgver=0.9.3
pkgrel=1
pkgdesc="Web-based PostgreSQL database browser written in Go"
arch=('i686' 'x86_64')
url="https://github.com/sosedoff/pgweb"
license=('MIT')
provides=("pgweb=${pkgver}")
conflicts=("pgweb")
source_i686=("bin_${pkgver}_386.zip::https://github.com/sosedoff/pgweb/releases/download/v${pkgver}/pgweb_linux_386.zip")
source_x86_64=("bin_${pkgver}_amd64.zip::https://github.com/sosedoff/pgweb/releases/download/v${pkgver}/pgweb_linux_amd64.zip")
md5sums_i686=('d3293e6ea6ba62a2a38bff9188207aef')
md5sums_x86_64=('10141ed0fc79b25a3f23cfcf2eb5cb1c')
sha256sums_i686=('91813eb034d332d77094fa333081a9a3ca44a4dd65b8ef388976f8a702bc5ffd')
sha256sums_x86_64=('4db4ce5323826ae8e19c92719f3dfedd95dc6f2f7bddae5e437650d5b5418dde')

package() {
  cd "$srcdir"
  install -Dm755 pgweb_linux_* "$pkgdir"/usr/bin/pgweb
}
