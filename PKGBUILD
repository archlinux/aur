# Maintainer: Paulo Almeida <almeidapaulopt at gmail dot com>
pkgname=tsdproxy-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Tailscale Docker reverse proxy — expose containers with one label"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/almeidapaulopt/tsdproxy"
license=('MIT')
provides=('tsdproxy')
conflicts=('tsdproxy')
source_x86_64=("https://github.com/almeidapaulopt/tsdproxy/releases/download/v${pkgver}/tsdproxy_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('a4e9887753373dd16189ad87831bfdc3f279a2c0020b15097910f2862b40b470')
source_aarch64=("https://github.com/almeidapaulopt/tsdproxy/releases/download/v${pkgver}/tsdproxy_${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=('2ce561f99ea9d4bec51f3c061c42245be51e3725cfe5f5245374cc408690e925')

package() {
    install -Dm755 "./tsdproxyd" "${pkgdir}/usr/bin/tsdproxyd"
    install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/tsdproxy-bin/LICENSE"
}
