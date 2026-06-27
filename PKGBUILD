# Maintainer: Antoine Bertin <ant.bertin@gmail.com>

pkgname=yayamlls
pkgver=0.1.11 # renovate: datasource=github-releases depName=home-operations/yayamlls
pkgrel=1
pkgdesc="Go YAML language server"
arch=(x86_64)
url=https://github.com/home-operations/yayamlls
license=(MIT)
options=(!strip)
source=("$pkgname-$pkgver-linux-amd64.tar.gz::$url/releases/download/$pkgver/${pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('75dc9a8e96352fb23738242ea53c9e890bab75f3d0ab572ced856cc15458627f')

package() {
  install -Dm755 yayamlls "$pkgdir/usr/bin/yayamlls"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
