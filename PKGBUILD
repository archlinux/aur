pkgname=mqttui-bin
pkgver=0.11.0
pkgrel=2
pkgdesc="Subscribe to a MQTT Topic or publish something quickly from the terminal"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/EdJoPaTo/mqttui"
license=('MIT')
depends=()
provides=('mqttui')
conflicts=('mqttui')

source_x86_64=("$pkgname-x86_64-$pkgver.tar.gz::$url/releases/download/v${pkgver}/${pkgname/-bin/}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-aarch64-$pkgver.tar.gz::$url/releases/download/v${pkgver}/${pkgname/-bin/}-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("$pkgname-armv7h-$pkgver.tar.gz::$url/releases/download/v${pkgver}/${pkgname/-bin/}-armv7-unknown-linux-gnueabihf.tar.gz")

sha256sums_x86_64=('52eee9e025b7a9721132ca759ff05f97178dab3bb7eb05df8d1d83cd3198e92f')
sha256sums_aarch64=('2cea8fba39c309e43346bb6210a89ed51a839ed57d9cb01fbe916bbb83096a7d')
sha256sums_armv7h=('2a74dd5131b6551e5e1779f6f134606cccd8fe770f0f8de0abd6a65eeb93eea9')

package() {
  install -Dm755 "${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
