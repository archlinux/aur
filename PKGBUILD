# Maintainer: hashworks <mail@hashworks.net>
pkgname=xrel-terminal-client
pkgver=2.1.1
pkgrel=1
pkgdesc="A terminal client to access the xREL.to API, written in Go."
arch=(x86_64)
url=https://github.com/hashworks/xREL-Terminal-Client
license=(GPL3)
changelog=CHANGELOG
source=("https://github.com/hashworks/xREL-Terminal-Client/releases/download/v${pkgver}/xREL-linux-amd64.tar.gz")
md5sums=(41f0c55b1065f674679b9bd8205abb6c)

package() {
  install -D xREL "${pkgdir}/usr/bin/xREL"
}
