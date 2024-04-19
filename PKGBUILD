# Maintainer: Nikolas Koesling <nikolas@koesling.info>

pkgname=shm-modbus-signal-gen
pkgrel=2
pkgver=1.0.2
pkgdesc="System time based signal generator for stdin-to-modbus-shm"
url="https://github.com/SHMModbus/shm-modbus-signal-gen"
license=('MIT')
arch=('any')
depends=('python')
source=("git+https://github.com/SHMModbus/shm-modbus-signal-gen.git#tag=v${pkgver}")

sha256sums=('SKIP')

package() {
    cd shm-modbus-signal-gen
    install -Dm755 src/signalgen.py "${pkgdir}/usr/bin/shm-modbus-signal-gen"
}
