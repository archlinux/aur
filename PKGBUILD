pkgname="beyla-bin"
pkgver=1.8.4
pkgrel=1
pkgdesc="eBPF-based autoinstrumentation of web applications and network metrics"
arch=('x86_64')
url="https://github.com/grafana/beyla"
license=('Apache Licence 2.0')
provides=('beyla')
source_x86_64=("https://github.com/grafana/beyla/releases/download/v${pkgver}/beyla-linux-amd64-v${pkgver}.tar.gz")


sha256sums_x86_64=('6108b1872b5aaee38aa7ba71efecdcf984214fe6891388fa685f408592ea76d8')

package() {
  cd "$srcdir/"

  install -Dm755 beyla "${pkgdir}/usr/bin/beyla"
}
