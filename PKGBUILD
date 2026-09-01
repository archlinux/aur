# Maintainer: Antoine Bertin <ant.bertin@gmail.com>

pkgname=yayamlls
pkgver=0.3.0 # renovate: datasource=github-releases depName=home-operations/yayamlls
pkgrel=1
pkgdesc="Go YAML language server"
arch=(x86_64)
url=https://github.com/home-operations/yayamlls
license=(MIT)
options=(!strip)
source=("$pkgname-$pkgver-linux-amd64.tar.gz::$url/releases/download/$pkgver/${pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('036c00ed7b903e2b27950873568147dc7a96b2c36eaef11f5928516900d6a753')

package() {
  install -Dm755 yayamlls "$pkgdir/usr/bin/yayamlls"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
