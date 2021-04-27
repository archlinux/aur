pkgname=mqttui-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="Subscribe to a MQTT Topic or publish something quickly from the terminal"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/EdJoPaTo/mqttui"
license=('GPL-3.0-or-later')
depends=()
provides=('mqttui')
conflicts=('mqttui')

source_x86_64=("$pkgname-x86_64-$pkgver.tar.gz::$url/releases/download/v${pkgver}/${pkgname/-bin/}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-aarch64-$pkgver.tar.gz::$url/releases/download/v${pkgver}/${pkgname/-bin/}-aarch64-unknown-linux-gnu.tar.gz")
source_armv6h=("$pkgname-armv6h-$pkgver.tar.gz::$url/releases/download/v${pkgver}/${pkgname/-bin/}-arm-unknown-linux-gnueabihf.tar.gz")
source_armv7h=("$pkgname-armv7h-$pkgver.tar.gz::$url/releases/download/v${pkgver}/${pkgname/-bin/}-armv7-unknown-linux-gnueabihf.tar.gz")

sha256sums_x86_64=('e1f1c3a75792308fb9e92400df41c2f55314a175c3f252db3e58aa999b03ebd9')
sha256sums_aarch64=('ddb6e035525c38e21c380bb49be420a6e6a36fafc72476c935fe962465edf555')
sha256sums_armv6h=('98ed0b0f06658659ef383c64b696b6fb40dd78eb95df6ee579d05af94534e9a3')
sha256sums_armv7h=('3e3456ca88051a0d780ecdbf67284e2790b1b5489f6ec0100ad7dc860fd2b818')

package() {
  install -Dm755 "${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
