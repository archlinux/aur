pkgname=mqttui-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Subscribe to a MQTT Topic or publish something quickly from the terminal"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/EdJoPaTo/mqttui"
license=('MIT')
depends=()
provides=('mqttui')
conflicts=('mqttui')

source_x86_64=("$pkgname-$pkgver.zip::$url/releases/download/v${pkgver}/${pkgname/-bin/}-x86_64-unknown-linux-gnu.zip")
source_aarch64=("$pkgname-$pkgver.zip::$url/releases/download/v${pkgver}/${pkgname/-bin/}-aarch64-unknown-linux-gnu.zip")
source_armv7h=("$pkgname-$pkgver.zip::$url/releases/download/v${pkgver}/${pkgname/-bin/}-armv7-unknown-linux-gnueabihf.zip")

sha256sums_x86_64=('897a89fcace5cc6480d35bb9ab382ad13372b36eacd00ede93aad6c1b9dd3a9b')
sha256sums_aarch64=('897a89fcace5cc6480d35bb9ab382ad13372b36eacd00ede93aad6c1b9dd3a9b')
sha256sums_armv7h=('897a89fcace5cc6480d35bb9ab382ad13372b36eacd00ede93aad6c1b9dd3a9b')

package() {
  install -Dm755 "${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
