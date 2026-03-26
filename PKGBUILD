pkgname=eim-cli-bin
pkgver=0.10.4
pkgrel=1
pkgdesc="ESP-IDF installation manager (CLI)"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/espressif/idf-im-ui"
license=('Apache-2.0')
provides=('eim')
conflicts=('eim')
makedepends=('unzip')
options=('!strip')

source_aarch64=("https://github.com/espressif/idf-im-ui/releases/download/v${pkgver}/eim-cli-linux-aarch64.zip")
source_armv7h=("https://github.com/espressif/idf-im-ui/releases/download/v${pkgver}/eim-cli-linux-armv7.zip")
source_x86_64=("https://github.com/espressif/idf-im-ui/releases/download/v${pkgver}/eim-cli-linux-x64.zip")

sha256sums_aarch64=("374fc289f82a562701a53d83a06b001b0ddc3857d32bbf555975c16af6dfd8fb")
sha256sums_armv7h=("9e74e81d927cb6c79b37992e24ce972839a0183fd99f1ca944b35c87b8f99152")
sha256sums_x86_64=("12414c271384b48afd5d5e774240f3718beb8d8bbf803b39d292d1caf73160c4")

package() {
  install -Dm755 "eim" "${pkgdir}/usr/bin/eim"
}