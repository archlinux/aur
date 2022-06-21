# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=xk6-browser-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A k6 extension that adds support for browser automation and end-to-end web testing via the Chrome Devtools Protocol (Precompiled)"
provides=("xk6-browser={$pkgver}")
arch=('x86_64')
url="https://github.com/grafana/xk6-browser"
license=('AGPL3')
options=(!emptydirs)
source=("https://github.com/grafana/xk6-browser/releases/download/v${pkgver}/xk6-browser-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('82a847b1a14b6e4f0e0f6e305a19d0f53f59107329df68717bc23605f8d27d06')

package() {
  install -D $srcdir/xk6-browser-v${pkgver}-linux-amd64/xk6-browser $pkgdir/usr/bin/xk6-browser
}
