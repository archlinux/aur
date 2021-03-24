pkgname=mqttui-bin
pkgver=0.11.1
pkgrel=1
pkgdesc="Subscribe to a MQTT Topic or publish something quickly from the terminal"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/EdJoPaTo/mqttui"
license=('MIT')
depends=()
provides=('mqttui')
conflicts=('mqttui')

source_x86_64=("$pkgname-x86_64-$pkgver.tar.gz::$url/releases/download/v${pkgver}/${pkgname/-bin/}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-aarch64-$pkgver.tar.gz::$url/releases/download/v${pkgver}/${pkgname/-bin/}-aarch64-unknown-linux-gnu.tar.gz")
source_armv6h=("$pkgname-armv6h-$pkgver.tar.gz::$url/releases/download/v${pkgver}/${pkgname/-bin/}-arm-unknown-linux-gnueabihf.tar.gz")
source_armv7h=("$pkgname-armv7h-$pkgver.tar.gz::$url/releases/download/v${pkgver}/${pkgname/-bin/}-armv7-unknown-linux-gnueabihf.tar.gz")

sha256sums_x86_64=('49ea1defd908a9e2f53962905f6848c9d94016a86cc15bea9188f7c6f5a034ef')
sha256sums_aarch64=('335e2d838c98555f5071a6b6bcbf27972955f837071fe5f97c76fee6173152d8')
sha256sums_armv6h=('f01dec0e0a7993036725a4a46ad7b81fa8771ccf1d49e63aef73595ed4b9d56f')
sha256sums_armv7h=('a379715aae12cd4d6e470e70522d20c851c5cb9bef2acf668b2f00e4fa227c36')

package() {
  install -Dm755 "${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
