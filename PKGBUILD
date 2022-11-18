# Maintainer: veggieTanuki <4d7orvu7@anonaddy.me>

pkgname=synth-bin
pkgver=0.6.8_r2
pkgrel=2
pkgdesc="The Declarative Data Generator"
arch=("arm64" "x86_64")
url="https://www.getsynth.com/"
license=("Apache")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("https://github.com/shuttle-hq/synth/releases/download/v${pkgver//_/-}/synth-ubuntu-latest-x86_64.tar.gz")
sha512sums_x86_64=('9028539389209cb9e98c268e81cb901e12f892766024fb28a25c66d4d454d2ea652711e9eeee4d9b238448a26b39d745e76f341974f42fb28ad2f17944a32c7a')
source_arm64=("https://github.com/shuttle-hq/synth/releases/download/v${pkgver//_/-}/synth-ubuntu-latest-arm64.tar.gz")
sha512sums_arm64=('935b3d516e996f6d25948ba8a54c1b7f70f7f0e3f517e36481fdf0196c2c5cfc2841f86e891f3df9517746b7fb605db47cdded1b8ff78d9482ddaa621db43a34')

package() {
    install -Dm755 "synth" "${pkgdir}/usr/bin/synth"
}
