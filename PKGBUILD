# Maintainer: Turbo <dev@turbo.ooo>
pkgname=mullvad-runit
pkgver=1.0
pkgrel=1
pkgdesc="mullvad runit service"
arch=('any')
url='https://github.com/TurboCheetah/mullvad-runit'
license=('MIT')
depends=('runit')
source=("run")
sha256sums=("5175b99d7d64764a82928c7c13a4b803f2ff24c41a1bc174abc547258ff95629")

package() {
    install -Dm755 ${srcdir}/run "$pkgdir"/etc/runit/sv/mullvad/run
}