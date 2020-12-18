pkgname=mqttui-bin
pkgver=0.10.0
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

sha256sums_x86_64=('fba3692b8eaa257e17bf8d1b218202b41c83874d42786b5c5ca2d5fb7dbdd75b')
sha256sums_aarch64=('fba3692b8eaa257e17bf8d1b218202b41c83874d42786b5c5ca2d5fb7dbdd75b')
sha256sums_armv7h=('fba3692b8eaa257e17bf8d1b218202b41c83874d42786b5c5ca2d5fb7dbdd75b')

package() {
  install -Dm755 "${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
