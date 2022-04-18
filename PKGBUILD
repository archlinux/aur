# Maintainer: Ville Lautanala <lautis at gmail dot com>
pkgname=ruuvitag-listener-bin
pkgver=0.5.5
pkgrel=2
pkgdesc='Listen to RuuviTag Bluetooth LE sensor measurements and output using InfluxDB line protocol.'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/lautis/ruuvitag-listener' 
license=('MIT')
provides=('ruuvitag-listener')
conflicts=('ruuvitag-listener')
install='ruuvitag-listener-bin.install'

source_x86_64=("https://github.com/lautis/ruuvitag-listener/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/lautis/ruuvitag-listener/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("https://github.com/lautis/ruuvitag-listener/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-armv7-unknown-linux-gnueabihf.tar.gz")
source_armv6h=("https://github.com/lautis/ruuvitag-listener/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-arm-unknown-linux-gnueabi.tar.gz")

sha256sums_x86_64=('89d143ce486cdc2946321de19e8876bd1d68b662df38c9190a8587994dba6497')
sha256sums_aarch64=('48a8c0974af7ba4903d173e324956c2ade9b4eb81e3b1869bd103902037f99cb')
sha256sums_armv7h=('2f17d0d821f81e8e0a1ab733ffd8ff6eff693d04d2108197bdbf8eed2fe4850c')
sha256sums_armv6h=('62817f44667c0ccad94028757a00b2e9b5bb0305a16737d06ebe2d1ed239c594')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
